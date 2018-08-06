USE [master]
GO
/****** Object:  Database [Cadastro]    Script Date: 09/10/2017 18:28:17 ******/
CREATE DATABASE [Cadastro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cadastro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Cadastro.mdf' , SIZE = 328704KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Cadastro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Cadastro_log.ldf' , SIZE = 35712KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Cadastro] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cadastro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cadastro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cadastro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cadastro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cadastro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cadastro] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cadastro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cadastro] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Cadastro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cadastro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cadastro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cadastro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cadastro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cadastro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cadastro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cadastro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cadastro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cadastro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cadastro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cadastro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cadastro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cadastro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cadastro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cadastro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cadastro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cadastro] SET  MULTI_USER 
GO
ALTER DATABASE [Cadastro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cadastro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cadastro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cadastro] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Cadastro]
GO
/****** Object:  User [CTE]    Script Date: 09/10/2017 18:28:18 ******/
CREATE USER [CTE] FOR LOGIN [CTE] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CTE]
GO
/****** Object:  StoredProcedure [dbo].[PROC_INCLUIR_TOKEN]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_INCLUIR_TOKEN]
                     (
                        @IDOperador	int                    -- Operador que solicita geração token
                      , @Validade	varchar(5)             -- Mes/Ano validade do(s) token
                      , @NumToken	int                    -- Quantidade de tokens a ser gerado
                      , @RESULTADO	int OUTPUT             -- Retorna status da operacao 1-OK, 0-Erro
                     -- , @MENSAGEM	VARCHAR(MAX) OUTPUT    -- Retorna mensagem, referente @resultado
                     )
AS
BEGIN
    SET NOCOUNT ON
	SET @RESULTADO = 1
	--SET @MENSAGEM = NULL;
	IF NOT EXISTS(SELECT * FROM DBO.USUARIO WHERE CodUsuario = ISNULL(@IDOperador,0)) 
	BEGIN
	        RAISERROR ('01-Operador não existe ou foi excluido por outro usuário',16,1);
	        SET @RESULTADO = 0
	        RETURN
	END
    BEGIN TRAN
		-->> SEMPRE que for gerado um novo token (cartao) a um operador/cliente, deve ser inativado
		-->> os cartão antigo		
	        UPDATE dbo.TOKEN SET flagInativo = 1 WHERE IDOperador = ISNULL(@IDOperador,0)
	        
	    -->> Por segurança a cada operação efetuada nos registros, verifico se esta foi concluída com sucesso.
	    -->> Se por ventura alguma operação falhar, nao importando em qual parte do processo. TODA a operação 
	    -->> sera cancelado, graças aos comandos BEGIN TRAN, ROLLBACK e COMMIT
	        IF @@ERROR <> 0
	         BEGIN
	          RAISERROR ('02 - ERROR: Ao incluir registro na tabela Token',16,1);
	          SET @RESULTADO = 0
	          ROLLBACK
	          RETURN 
	        END
	        
	    -->> Pronto agora posso gerar um novo cartão, isto consiste em inserir um registro na tabela TOKEN
	    -->>
	        INSERT INTO dbo.TOKEN ( IDOperador,  Validade, flagInativo) VALUES(@IDOperador, @Validade, 0)
	        IF @@ERROR <> 0
	         BEGIN
	          RAISERROR ('03 - ERROR: Ao incluir registro na tabela Token',16,1);
	          SET @RESULTADO = 0
	          ROLLBACK
	          RETURN 
	        END
		-->> Ate aqui o cartão de token foi gerado com sucesso, agora vamos gerar o conteudo deste cartão, ou
		-->> seja a numeração bem com suas posições Ex. posição 10 valor: 9764; posição 11 valor 4176, etc..
		
		-->> Crio algumas variaveis de controle, que no decorrer do código explico suas funções.
		DECLARE @IDRegistro		INT
		DECLARE @NumeroToken	VARCHAR(4)
		DECLARE @nCont			INT 
		DECLARE @valor			INT 
		DECLARE @svalor			VARCHAR(4)
		DECLARE @PosicaoToken	INT
		SET     @nCont			= 1
		SET		@IDRegistro		= @@IDENTITY
		SET     @PosicaoToken	= 1
		
		-->> @NumToken, é um parametro que indica a quantidade de posições (tokens) que iremos gerar
        -->> @nCont, indica a quantidade de token que ja foi gerada, tendo como limite o valor contido em @NumToken
            WHILE @nCont <= @NumToken
            BEGIN
              -->> Aqui utilizo o função TSQL NewID() que me gera uma chave UNICA de 36 posições contendo numeros
              -->> ou letras.
              SET @valor = CAST(SubString(CONVERT(binary(16), newid()), 14, 3) AS int)
              
              -->> Do valor de 36 posições gerado eu pego apenas 4, pois desejo que as minhas chaves tenham este tamanho
              SET @svalor = substring(convert(varchar, @valor),LEN(@valor)-3,100)              
              IF LEN(CONVERT(INT,@svalor)) =4
              BEGIN
				-->> Verifico se o valor de 4 posições selecionado ainda NAO FOI UTILIZADO por nenhum cliente, caso afirmativo
				-->> insiro este valor na tabela e avanco para o proxima numeração do token adicionando +1 a variavel @nCont
                IF NOT EXISTS(SELECT * FROM dbo.TOKEN_FILHO WHERE NumeroToken = @svalor)			
                BEGIN
                  INSERT INTO dbo.TOKEN_FILHO (IDTokenPai, PosicaoToken, NumeroToken) VALUES (@IDRegistro, @PosicaoToken, @svalor)
                  -->> como sempre verifico se esta indo tudo correto
                  IF @@ERROR <> 0
                  BEGIN
                    RAISERROR ('04-ERROR: Ao incluir registro na tabela TOKEN_FILHO',16,1);
                    SET @RESULTADO = 0
                    ROLLBACK
                    RETURN 
                  END
                  -->> contabilizo um token gerado pois tudo ocorreu bem e incremento +1 na numeração da posição.
                  -->> Poderia ter utilizado uma unica variavel, mas pensando em futuras implementações decidi utilizar duas
                  
                  SET @PosicaoToken	= @PosicaoToken +1		-- Contabilizo a posição do token que foi gerado.
                  SET @nCont		= @nCont		+1		-- Contabilizo numero de tokens gerado
                END
              END
            END			
        -->> Como toda a operação ocorreu sem nenhum ERRINHO, eu finalizo processo com o comando COMMIT. Como assim?
        -->> quando abri o comando Begin Tran, toda esta operação foi feita em memória o commando commit torna estas
        -->> operações fisica no banco de dados
        COMMIT
    SET NOCOUNT OFF
    select @RESULTADO
END

GO
/****** Object:  StoredProcedure [dbo].[spx_ImportFromExcel03]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		http://www.ASPSnippets.com
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--spx_ImportFromExcel03 'Sheet1$', 'C:\Excel03.xls', 'NO', 'CUSTOMER_tABLE'
CREATE PROCEDURE [dbo].[spx_ImportFromExcel03]
	@SheetName varchar(20),
    @FilePath varchar(100),
	@HDR varchar(3),
    @TableName varchar(50)
AS
BEGIN
    DECLARE @SQL nvarchar(1000)
		
	IF OBJECT_ID (@TableName,'U') IS NOT NULL
		SET @SQL = 'INSERT INTO ' + @TableName + ' SELECT * FROM OPENDATASOURCE'
	ELSE
		SET @SQL = 'SELECT * INTO ' + @TableName + ' FROM OPENDATASOURCE'

    SET @SQL = @SQL + '(''Microsoft.Jet.OLEDB.4.0'',''Data Source='
    SET @SQL = @SQL + @FilePath + ';Extended Properties=''''Excel 8.0;HDR=' 
	SET @SQL = @SQL + @HDR + ''''''')...[' 
    SET @SQL = @SQL + @SheetName + ']'
	EXEC sp_executesql @SQL
END

GO
/****** Object:  StoredProcedure [dbo].[spx_ImportFromExcel07]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		http://www.ASPSnippets.com
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--spx_ImportFromExcel07 'Sheet1$', 'C:\Excel07.xlsx', 'YES', 'CustomerS'
CREATE PROCEDURE [dbo].[spx_ImportFromExcel07]
	@SheetName varchar(20),
    @FilePath varchar(100),
	@HDR varchar(3),
	@TableName varchar(50)
AS
BEGIN
    DECLARE @SQL nvarchar(1000)
	
	IF OBJECT_ID (@TableName,'U') IS NOT NULL
		SET @SQL = 'INSERT INTO ' + @TableName + ' SELECT * FROM OPENDATASOURCE'
	ELSE
		SET @SQL = 'SELECT * INTO ' + @TableName + ' FROM OPENDATASOURCE'

    SET @SQL = @SQL + '(''Microsoft.ACE.OLEDB.12.0'',''Data Source='
    SET @SQL = @SQL + @FilePath + ';Extended Properties=''''Excel 12.0;HDR=' 
    SET @SQL = @SQL + @HDR + ''''''')...[' 
    SET @SQL = @SQL + @SheetName + ']'
	EXEC sp_executesql @SQL
END

GO
/****** Object:  StoredProcedure [dbo].[STP_DEL_ENDERECOCOMPLETO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[STP_DEL_ENDERECOCOMPLETO]
(
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15),
  @cd_Endereco int
)
 AS
 BEGIN

   DELETE
   FROM ENDERECO
   Where CodigoEmpresa = @CodigoEmpresa
   and CodigoCliente = @CodigoCliente
   and cd_endereco = @cd_Endereco
 END

GO
/****** Object:  StoredProcedure [dbo].[STP_INS_ACESSO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_INS_ACESSO]
(
  @Cnpj varchar(14),
  @Nome varchar(50),
  @cd_logacesso int output
)
as
begin 
  SET NOCOUNT ON;

  Insert into LogAcesso (CNPJ, Nome) Values (@Cnpj, @Nome)

  IF (@@ROWCOUNT > 0)
   BEGIN

     SET  @cd_logacesso = SCOPE_IDENTITY();

   END

   SET NOCOUNT OFF;

   SELECT @cd_logacesso;
end
GO
/****** Object:  StoredProcedure [dbo].[STP_INS_ARQUIVOBAIXADO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 CREATE PROCEDURE [dbo].[STP_INS_ARQUIVOBAIXADO]
 (
  @CODIGOEMPRESA VARCHAR(15),
  @CODIGOCLIENTE VARCHAR(15),
  @NOMEARQUIVO VARCHAR(100),
  @IDARQUIVOBAIXADO INT OUTPUT
)
AS
BEGIN

   SET NOCOUNT ON;
   SET @IDARQUIVOBAIXADO = 0;

   INSERT INTO ARQUIVOBAIXADO ( CODIGOEMPRESA, CODIGOCLIENTE, NOMEARQUIVO) 
	VALUES (@CODIGOEMPRESA, @CODIGOCLIENTE, @NOMEARQUIVO)
  
   IF (@@ROWCOUNT > 0)
   BEGIN
     SET  @IDARQUIVOBAIXADO = SCOPE_IDENTITY();
   END

   SET NOCOUNT OFF;

   SELECT @IDARQUIVOBAIXADO;

END
GO
/****** Object:  StoredProcedure [dbo].[STP_INS_CONTATO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[STP_INS_CONTATO]
(
  
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15),
  @Nome varchar(50),
  @cd_cargo int,
  @cd_tipoTelefone int,
  @ddd varchar(2),
  @telefone varchar(10),
  @Email varchar(100),
  @website varchar(100),
  @facebook varchar(100),
  @twitter varchar(100),
  @CanalYoutube varchar(100),
  @Instagram varchar(100),
  @linkdin varchar(100),
  @CodigoContato int output
)
as
begin


SET NOCOUNT ON;
 
  insert into Contatos (codigoempresa, codigocliente, Nome, cd_cargo, cd_tipoTelefone, ddd, telefone, Email, website,
                       facebook, twitter, CanalYoutube, Instagram, Linkdin, Ativo, DataCadastro)

  values (@codigoempresa, @codigocliente, @Nome, @cd_cargo, @cd_tipoTelefone, @ddd, @telefone, @Email, @website,
                       @facebook, @twitter, @CanalYoutube, @Instagram, @Linkdin, 'SIM', GetDate())
  
   IF (@@ROWCOUNT > 0)
   BEGIN

     SET  @CodigoContato = SCOPE_IDENTITY();

   END

   SET NOCOUNT OFF;

   SELECT @CodigoContato;



end
GO
/****** Object:  StoredProcedure [dbo].[STP_INS_EMAILRECEBIDO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_INS_EMAILRECEBIDO]
(
  
 @Nome varchar(50),
 @Classificacao varchar(10),
 @Email varchar(100),
 @Assunto varchar(30),
 @Corpo varchar(350),
 @IDEmail int OUTPUT
)
AS
BEGIN

   SET NOCOUNT ON;

   INSERT INTO EmailRecebido (NOME, Classificacao, Email, Assunto, Corpo)
   VALUES (@NOME, @CLASSIFICACAO, @EMAIL, @ASSUNTO, @CORPO)
 
   IF (@@ROWCOUNT > 0)
   BEGIN
     SET  @IDEmail = SCOPE_IDENTITY();
   END

   SET NOCOUNT OFF;

   SELECT @IDEmail;

END
GO
/****** Object:  StoredProcedure [dbo].[STP_INS_ENDERECO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_INS_ENDERECO]

(

 @codigoempresa varchar(15),

 @codigocliente varchar(15),

 @cep varchar(9),

 @numero varchar(10),

 @complemento varchar(45),

 @pontoreferencia varchar(40),

 @cd_tipoendereco int,

 @cd_endereco int  output

)

as

begin
   SET NOCOUNT ON;

  declare @ativo varchar(3)
  set @ativo = 'SIM';
 
  insert into Endereco (codigoempresa, codigocliente, cep, numero, complemento, pontoreferencia, cd_tipoendereco, Ativo)

  values (@codigoempresa, @codigocliente, @cep, @numero, @complemento, @pontoreferencia, @cd_tipoendereco, @ativo)

  
   IF (@@ROWCOUNT > 0)
   BEGIN

     SET  @cd_endereco = SCOPE_IDENTITY();

   END

   SET NOCOUNT OFF;

   SELECT @cd_endereco;

end




GO
/****** Object:  StoredProcedure [dbo].[STP_INS_HISTORICO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_INS_HISTORICO]
(
 @CODIGOEMPRESA VARCHAR(15),
 @CODIGOCLIENTE VARCHAR(15),
 @CODUSUARIO VARCHAR(15),
 @IDTIPOSOLICITACAO INT,
 @IDHISTORICOEMAIL INT OUTPUT
)
AS
BEGIN
   SET NOCOUNT ON;

   DECLARE  @DATAENVIO DATETIME
   SET   @DATAENVIO = GETDATE()

   INSERT INTO HISTORICOEMAIL ( CODIGOEMPRESA, CODIGOCLIENTE, CODUSUARIO, DATAENVIO, IDTIPOSOLICITACAO)
   VALUES (@CODIGOEMPRESA, @CODIGOCLIENTE, @CODUSUARIO, @DATAENVIO, @IDTIPOSOLICITACAO)

    IF (@@ROWCOUNT > 0)
   BEGIN

     SET  @IDHISTORICOEMAIL = SCOPE_IDENTITY();

   END

   SET NOCOUNT OFF;

   SELECT @IDHISTORICOEMAIL;
END
GO
/****** Object:  StoredProcedure [dbo].[stp_ins_jbs_cliente]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[stp_ins_jbs_cliente]
(
  @nome varchar(20),
  @ID_CLIENTE int output
)
as
begin
    SET  @ID_CLIENTE = 0;
    insert into jbs_cliente (nome, data) values (@nome, getdate())

	if (@@ROWCOUNT > 0)
	BEGIN

	   SET @ID_CLIENTE = SCOPE_IDENTITY();

	END

	SELECT @ID_CLIENTE

end
GO
/****** Object:  StoredProcedure [dbo].[STP_INS_PAGAMENTO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_INS_PAGAMENTO]
(
 @CodUsuario varchar(15)
)
as
begin
  
  Update Usuario
  Set Ativo = 'S', data_pagamento = Getdate()
  Where CodUsuario = @CodUsuario

end

GO
/****** Object:  StoredProcedure [dbo].[STP_INS_PET]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[STP_INS_PET]
(
        @CodigoEmpresa VARCHAR(15),
        @CodigoCliente VARCHAR(15),
        @IDEspecie INT,
        @IDRaca INT,
        @Nome VARCHAR(50),
        @Idade INT,
        @Kg DECIMAL,
        @NumPedigre VARCHAR(20),
		@IDPET INT OUTPUT
)

AS
BEGIN


     INSERT INTO PET (
        CodigoEmpresa, 
        CodigoCliente,
        IDEspecie,
        IDRaca, 
        Nome, 
        Idade, 
        Kg, 
        NumPedigre
	)
	VALUES (
        @CodigoEmpresa, 
        @CodigoCliente,
        @IDEspecie,
        @IDRaca,
        @Nome, 
        @Idade, 
        @Kg, 
        @NumPedigre )


		IF (@@ROWCOUNT > 0) 
	BEGIN
	  SET @IDPET = SCOPE_IDENTITY();
	END

	SELECT @IDPET AS IDPET
END
GO
/****** Object:  StoredProcedure [dbo].[STP_INS_SOCIO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[STP_INS_SOCIO]
(
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15),
  @Nome varchar(50), 
  @Cpf varchar(14), 
  @Rg varchar(12), 
  @dddtelefone varchar(2), 
  @telefone varchar(10), 
  @dddcelular varchar(2), 
  @celular varchar(10),
  @email varchar(100), 
  @sexo varchar(1), 
  @datanascimento date,
  @CodigoSocio int output
)
as
begin
   SET NOCOUNT ON;
   
   declare @DataCadastro datetime;
   set @DataCadastro = GetDate();

   insert into Socio (CodigoEmpresa, CodigoCliente, Nome, Cpf, Rg, dddtelefone, telefone, dddcelular, celular,
   email, sexo, ativo, datanascimento, datacadastro)
   values (@CodigoEmpresa, @codigocliente, @nome, @cpf, @rg, @dddtelefone, @telefone, @dddcelular, @celular,
   @email, @sexo, 'SIM', @datanascimento, @DataCadastro)


   IF (@@ROWCOUNT > 0)
   BEGIN

     SET  @CodigoSocio = SCOPE_IDENTITY();

   END

   SET NOCOUNT OFF;

   SELECT @CodigoSocio;

end


GO
/****** Object:  StoredProcedure [dbo].[STP_INS_TOKENCOMPARTILHADO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure  [dbo].[STP_INS_TOKENCOMPARTILHADO]
(
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15),
  @Email varchar(100),
  @NumeroToken varchar(4),
  @PosicaoToken int,
  @Validade varchar(5),
  @IDTokenCompartilhado int output
)
as
begin

  SET NOCOUNT ON;
   
   Delete from  Token_Compartilhado  where CodigoEmpresa = @CodigoEmpresa and CodigoCliente = @CodigoCliente;

   declare @DataEnvio datetime;
   set @DataEnvio = GetDate();

   INSERT INTO Token_Compartilhado (CodigoEmpresa, CodigoCliente, Email, NumeroToken, PosicaoToken, DataEnvio, Validade) Values
   (@CodigoEmpresa, @CodigoCliente, @Email, @NumeroToken, @PosicaoToken, @DataEnvio, @Validade)

   
   IF (@@ROWCOUNT > 0)
   BEGIN

     SET  @IDTokenCompartilhado = SCOPE_IDENTITY();

   END

   SET NOCOUNT OFF;

   SELECT @IDTokenCompartilhado;


end



GO
/****** Object:  StoredProcedure [dbo].[STP_INS_USUARIO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[STP_INS_USUARIO]
(
  @NOME VARCHAR(80),
  @EMAIL VARCHAR(100),
  @SENHA VARCHAR(8),
  @CODUSUARIO INT OUTPUT
)
AS
BEGIN

   SET NOCOUNT ON
   
   DECLARE @CODIGOEMPRESA VARCHAR(15);
   DECLARE @CODIGOCLIENTE VARCHAR(15);

   SET @CODIGOEMPRESA = (SELECT CODIGOEMPRESA FROM PARAMETROS);
   SET @CODIGOCLIENTE = (SELECT CODIGOCLIENTE+1 FROM PARAMETROS);
   SET @CODUSUARIO = 0;


   INSERT INTO USUARIO (NOME, EMAIL, SENHA, DATA_CADASTRO, ATIVO)
   VALUES (@NOME, @EMAIL, @SENHA,  GETDATE(), 'N');

   IF (@@ROWCOUNT > 0)
   BEGIN
 
     SET  @CODUSUARIO = SCOPE_IDENTITY();
   
     INSERT INTO CLIENTE (CODIGOPAIS, CODIGOEMPRESA, CODIGOCLIENTE, TIPOCLIENTE, NOMECLIENTE, EmailPessoa, CODUSUARIO)
	 VALUES ('55',@CODIGOEMPRESA,@CODIGOCLIENTE, '1',@NOME, @EMAIL,  @CODUSUARIO);

	 
	   IF (@@ROWCOUNT > 0)
	   BEGIN
           UPDATE PARAMETROS
		   SET CODIGOCLIENTE = @CODIGOCLIENTE
	   END

   END

   SET NOCOUNT OFF

   SELECT @CODUSUARIO

END



GO
/****** Object:  StoredProcedure [dbo].[STP_INS_USUARIO_CONVIDADO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[STP_INS_USUARIO_CONVIDADO]
(
  @NOME VARCHAR(80),
  @EMAIL VARCHAR(100),
  @CODIGOEMPRESA VARCHAR(15),
  @CODIGOCLIENTE VARCHAR(15),
  @CODUSUARIOCONVIDADO INT OUTPUT
)
AS
BEGIN

   SET NOCOUNT ON
   DECLARE @CODIGOCLIENTECONVIDADO VARCHAR(15);
   DECLARE @CODIGOEMPRESACONVIDADO VARCHAR(15);

   SET  @CODUSUARIOCONVIDADO = 0;
   SET @CODIGOCLIENTECONVIDADO = (SELECT CODIGOCLIENTE+1 FROM PARAMETROS);
   SET @CODIGOEMPRESACONVIDADO = (SELECT CODIGOEMPRESA FROM PARAMETROS);

   INSERT INTO USUARIO (NOME, EMAIL, DATA_CADASTRO, ATIVO)
   VALUES (@NOME, @EMAIL, GETDATE(), 'N');

   IF (@@ROWCOUNT > 0)
   BEGIN
 
     SET  @CODUSUARIOCONVIDADO = SCOPE_IDENTITY();
   
     INSERT INTO CLIENTE (CODIGOPAIS, CODIGOEMPRESA, CODIGOCLIENTE, TIPOCLIENTE, NOMECLIENTE, EmailPessoa, CODUSUARIO)
	 VALUES ('55',@CODIGOEMPRESACONVIDADO,@CODIGOCLIENTECONVIDADO, '1',@NOME, @EMAIL, @CODUSUARIOCONVIDADO);

	 
	   IF (@@ROWCOUNT > 0)
	   BEGIN
           UPDATE PARAMETROS
		   SET CODIGOCLIENTE = @CODIGOCLIENTECONVIDADO

		   INSERT INTO CONVITE( CODIGOEMPRESA, CODIGOCLIENTE, CODUSUARIOCONVIDADO)
		   VALUES (@CODIGOEMPRESA, @CODIGOCLIENTE, @CODUSUARIOCONVIDADO)
	   END

   END

   SET NOCOUNT OFF

   SELECT @CODUSUARIOCONVIDADO

END



GO
/****** Object:  StoredProcedure [dbo].[STP_INS_USUARIOCARTEIRA]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --usuario.codigoEmpresa = HttpContext.Current.Session["param1"].ToString();
 --           usuario.idCarteira = idCarteira;
 --           usuario.codperfil = codperfil.ToString();            
 --           usuario.nome = item.nome;
 --           usuario.email = item.email;
 --           usuario.senha = "123";
 --           usuario.tipocliente = _tipopessoa;
 --           usuario.Documento = item.documento;


CREATE PROCEDURE [dbo].[STP_INS_USUARIOCARTEIRA]
(
  @CODIGOEMPRESA VARCHAR(15),
  @IDCARTEIRA INT,
  @CODPERFIL VARCHAR(20),
  @NOME VARCHAR(80),
  @EMAIL VARCHAR(100),
  @SENHA VARCHAR(8),
  @TIPOCLIENTE CHAR(1),
  @DOCUMENTO VARCHAR(20),
  @CODUSUARIO INT OUTPUT
)
AS
BEGIN


   SET NOCOUNT ON
   
   DECLARE @CODIGOCLIENTE VARCHAR(15);

   SET @CODIGOCLIENTE = (SELECT CODIGOCLIENTE+1 FROM PARAMETROS);
   SET @CODUSUARIO = 0;


   INSERT INTO USUARIO (NOME, EMAIL, SENHA, DATA_CADASTRO, ATIVO, data_pagamento, IDCARTEIRA, CodPerfil)
   VALUES (@NOME, @EMAIL, @SENHA,  GETDATE(), 'S', GETDATE(),@IDCARTEIRA, @CODPERFIL) ;

   IF (@@ROWCOUNT > 0)
   BEGIN
 
     SET  @CODUSUARIO = SCOPE_IDENTITY();
   
     INSERT INTO CLIENTE (CODIGOPAIS, CODIGOEMPRESA, CODIGOCLIENTE, TIPOCLIENTE, NOMECLIENTE, EmailPessoa, CODUSUARIO,
	             Documento)
	 VALUES ('55',@CODIGOEMPRESA,@CODIGOCLIENTE, @TIPOCLIENTE,@NOME, @EMAIL,  @CODUSUARIO, @DOCUMENTO);

	 
	   IF (@@ROWCOUNT > 0)
	   BEGIN
           UPDATE PARAMETROS
		   SET CODIGOCLIENTE = @CODIGOCLIENTE
	   END

   END

   SET NOCOUNT OFF

   SELECT @CODUSUARIO

END



GO
/****** Object:  StoredProcedure [dbo].[STP_INS_VEICULO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_INS_VEICULO]
(
	@CODIGOEMPRESA VARCHAR(15),
	@CODIGOCLIENTE VARCHAR(15),
	@IDCOMBUSTIVEL INT,
	@RENAVAM VARCHAR(20),
	@PLACA VARCHAR(8),
	@ANO VARCHAR(4),
	@ANOFABRICACAO VARCHAR(4),
	@IDMARCA INT,
	@IDMODELO INT,
	@IDCOR INT,
	@IDVEICULO INT OUTPUT

)
AS
BEGIN

INSERT INTO VEICULOS(

        
        CODIGOEMPRESA,
        CODIGOCLIENTE,
        IDCOMBUSTIVEL,
        RENAVAM, 
        PLACA, 
        ANO, 
        ANOFABRICACAO, 
        IDMARCA, 
        IDMODELO, 
        IDCOR 
        )
		VALUES 
		(
        @CODIGOEMPRESA,
        @CODIGOCLIENTE,
        @IDCOMBUSTIVEL,
        @RENAVAM,
        @PLACA, 
        @ANO, 
        @ANOFABRICACAO, 
        @IDMARCA, 
        @IDMODELO, 
        @IDCOR
		);

	IF (@@ROWCOUNT > 0) 
	BEGIN
	  SET @IDVEICULO = SCOPE_IDENTITY();
	END

	SELECT @IDVEICULO AS IDVEICULO

END

GO
/****** Object:  StoredProcedure [dbo].[STP_LOGIN]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[STP_LOGIN]
(
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15),
  @CNPJ varchar(20)
)
as
begin

  Select CodigoEmpresa, CodigoCliente, Documento, TipoCliente
  From Cliente
  Where CodigoEmpresa = @CodigoEmpresa
  and CodigoCliente = @CodigoCliente
  and Documento = @CNPJ

end
GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_ARQUIVOBAIXADO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_SEL_ARQUIVOBAIXADO]
(
  @IDARQUIVOBAIXADO INT
)
AS
BEGIN
   SELECT NOMEARQUIVO FROM ARQUIVOBAIXADO WHERE IDARQUIVOBAIXADO = @IDARQUIVOBAIXADO;
END
GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_CAMPO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[STP_SEL_CAMPO]
(
 @p_variavel varchar(30),
 @p_chave1 varchar(50),
 @p_chave2 varchar(50)
)
as
begin

  declare @Tabela nvarchar(40);
  declare @campo nvarchar(30);
  declare @chave1 nvarchar(50);
  declare @chave2 nvarchar(50);
  declare @sql nvarchar(400);

  set @Tabela = (select Tabela From Macro Where Variavel = @p_variavel)
  set @campo =  (select Campo From Macro Where Variavel = @p_variavel)
  set @chave1 = (select chave1 From Macro Where Variavel = @p_variavel)
  set @chave2 = (select chave2 From Macro Where Variavel = @p_variavel)

  set @sql = 'select  ' + @campo + ' as Campo from ' + @Tabela  + ' Where ' + @chave1 + ' = ''' + @p_chave1 + '''';
  
  if @p_chave2 <> ''
  begin
   set @sql = @sql  + ' and ' + @chave2 + ' = ''' + @p_chave2 + '''';
  end 
  
  print @sql

  execute SP_Executesql @sql 

end

GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_CEP]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_SEL_CEP]

(

 @CEP VARCHAR(9),
 @ESTADO VARCHAR(2)

)

AS

BEGIN



  SELECT * FROM CEP WHERE CEP = @CEP AND UF = @ESTADO



END
GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_CONTATO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[STP_SEL_CONTATO]
(
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15),
  @cd_contato int
)
 AS
 BEGIN

   select CodigoContato, CodigoEmpresa, CodigoCliente, Nome, contatos.cd_cargo, contatos.cd_tipoTelefone, ddd, telefone, email,
   website, facebook, twitter, canalYouTube, instagram, linkdin, ativo, DataCadastro, DataAtualizacao, cg.ds_cargo, tt.ds_tipotelefone
   from contatos
   left outer join Cargo cg on cg.cd_cargo = contatos.cd_cargo
   left outer join TipoTelefone tt on tt.cd_tipotelefone = contatos.cd_tipoTelefone
   Where CodigoEmpresa = @CodigoEmpresa
   and CodigoCliente = @CodigoCliente
   and CodigoContato = @cd_contato

 END
GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_CONTATOS]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[STP_SEL_CONTATOS]
(
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15)
)
 AS
 BEGIN

   select CodigoContato, CodigoEmpresa, CodigoCliente, Nome, contatos.cd_cargo, contatos.cd_tipoTelefone, ddd, telefone, email,
   website, facebook, twitter, canalYouTube, instagram, linkdin, ativo, DataCadastro, DataAtualizacao, cg.ds_cargo, tt.ds_tipotelefone
   from contatos
   left outer join Cargo cg on cg.cd_cargo = contatos.cd_cargo
   left outer join TipoTelefone tt on tt.cd_tipotelefone = contatos.cd_tipoTelefone
   Where CodigoEmpresa = @CodigoEmpresa
   and CodigoCliente = @CodigoCliente
 

 END



GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_EMPRESA]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE procedure [dbo].[STP_SEL_EMPRESA]
 (
   @CodEmpresa varchar(15),
   @CodCliente varchar(15)
)
as
begin

  Select c.CodigoEmpresa, e.NomeEmpresa, ce.logradouro, ce.localidade, ce.uf, c.tipocliente, c.CodUsuario
  from cliente c
  inner join Empresa e on e.CodigoEmpresa = c.CodigoEmpresa
  left outer join cep ce  on ce.cep = e.CEP
  Where c.CodigoEmpresa = @CodEmpresa
  and c.CodigoCliente = @CodCliente

end

GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_EMPRESACOMTOKEN]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_SEL_EMPRESACOMTOKEN]
(
  @TOKEN VARCHAR(4),
  @POSICAO INT
)
AS
BEGIN

  SELECT C.CODIGOEMPRESA, E.NOMEEMPRESA, CE.LOGRADOURO, CE.LOCALIDADE, CE.UF, C.TIPOCLIENTE, C.CODUSUARIO, C.CODIGOCLIENTE
  FROM CLIENTE C
  INNER JOIN TOKEN_COMPARTILHADO TC ON TC.CODIGOEMPRESA = C.CODIGOEMPRESA AND TC.CODIGOCLIENTE = C.CODIGOCLIENTE
  INNER JOIN EMPRESA E ON E.CODIGOEMPRESA = C.CODIGOEMPRESA
  LEFT OUTER JOIN CEP CE  ON CE.CEP = E.CEP
  WHERE TC.NUMEROTOKEN = @TOKEN
  AND TC.POSICAOTOKEN = @POSICAO
  AND TC.ATIVO = 'S'


END

GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_ENDERECO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_SEL_ENDERECO]
(
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15)
)
 AS
 BEGIN

   SELECT TE.ds_tipoendereco, e.cd_endereco, e.cep, ce.Localidade, E.numero, E.complemento,
   e.DataCadastro, e.DataAtualizacao, e.PontoReferencia, e.cd_tipoendereco
   FROM ENDERECO E
   INNER JOIN cep ce ON ce.cep = E.cep
   INNER JOIN TipoEndereco TE ON TE.cd_tipoendereco = E.cd_tipoendereco
   Where e.CodigoEmpresa = @CodigoEmpresa
   and e.CodigoCliente = @CodigoCliente
 END


GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_ENDERECOCOMPLETO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[STP_SEL_ENDERECOCOMPLETO]

(

  @CodigoEmpresa varchar(15),

  @CodigoCliente varchar(15),

  @cd_Endereco int

)

 AS

 BEGIN



   SELECT TE.ds_tipoendereco, e.cd_endereco, e.cep, ce.Localidade, E.numero, E.complemento,

   e.DataCadastro, e.DataAtualizacao, e.PontoReferencia, e.cd_tipoendereco, ce.Bairro, ce.UF, ce.Localidade,
    ce.CodCidade, ce.LogradouroAbrev, ce.LogComplemento, ce.BairroAbrev, ce.Tipo, ce.Logradouro
	, (select top 1 c.Cidade from Cidades c where c.CodCidade = ce.CodCidade) as Cidade, e.Ativo, ce.Tipo

   FROM ENDERECO E

   INNER JOIN cep ce ON ce.cep = E.cep

   INNER JOIN TipoEndereco TE ON TE.cd_tipoendereco = E.cd_tipoendereco

   Where e.CodigoEmpresa = @CodigoEmpresa

   and e.CodigoCliente = @CodigoCliente

   and e.cd_endereco = @cd_Endereco

 END

GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_ESTRUTURA]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_SEL_ESTRUTURA]
(
 @CODFILIAL VARCHAR(15),
 @TABELA VARCHAR(128)
 )
 AS
 BEGIN

	WITH  DADOS AS ( 
	SELECT COLTABNAME as Tabela, (SELECT TOP 1 COLNAME 
			FROM XTABDEF X WHERE T.COLNAME = X.COLNAME 
			AND X.COLTYPE = 'DATETIME') 
			 as Coluna, COLTYPE as Tipo, COLLEN as Tamanho 
	FROM XTABDEF T
	where  T.ColAutoVal = 0 
	UNION ALL 
	SELECT COLTABNAME as Tabela, (SELECT TOP 1 COLNAME 
			FROM XTABDEF X WHERE T.COLNAME = X.COLNAME 
			AND COLNAME NOT LIKE 'DAT%') 
			 as Coluna, COLTYPE as Tipo, COLLEN  as Tamanho
	FROM XTABDEF T 
	where  T.ColAutoVal = 0
	)  
	 SELECT  D.Tabela,
	         D.Coluna,
	         D.Tipo,
	         D.Tamanho
	 FROM  DADOS D 
	
   WHERE D.Coluna IS NOT NULL  
    AND D.TABELA = @TABELA

	AND (D.Tabela + ' ' + d.Coluna ) NOT IN (SELECT (NomeTabela + ' ' + NomeColunaOriginal) FROM LAYOUT WHERE CodFilial = @CODFILIAL)
   ORDER BY d.Tabela, d.COluna
 
 END
GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_LAYOUT]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_SEL_LAYOUT]
(
 @CODFILIAL VARCHAR(15),
 @TABELA VARCHAR(128)
 )
 AS
 BEGIN

	WITH  DADOS AS ( 
	SELECT COLTABNAME as Tabela, (SELECT TOP 1 COLNAME 
			FROM XTABDEF X WHERE T.COLNAME = X.COLNAME 
			AND X.COLTYPE = 'DATETIME') 
			 as Coluna, COLTYPE as Tipo, COLLEN as Tamanho 
	FROM XTABDEF T 
	Where  T.ColAutoVal = 0
	UNION ALL 
	SELECT COLTABNAME as Tabela, (SELECT TOP 1 COLNAME 
			FROM XTABDEF X WHERE T.COLNAME = X.COLNAME 
			AND COLNAME NOT LIKE 'DAT%') 
			 as Coluna, COLTYPE as Tipo, COLLEN  as Tamanho
	FROM XTABDEF T 
	Where  T.ColAutoVal = 0
	)  
	 SELECT  D.Tabela,
	         D.Coluna,
	         D.Tipo,
	         D.Tamanho
	 FROM  DADOS D 
	
   WHERE D.Coluna IS NOT NULL  
    AND D.TABELA = @TABELA
   ORDER BY d.Tabela, d.COluna
 
 END





GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_LISTACOMPARTILHADO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_SEL_LISTACOMPARTILHADO]
(
 @CODIGOEMPRESA VARCHAR(15),
 @CODIGOCLIENTE VARCHAR(15),
 @IDTOKENCOMPARTILHADO int
)
AS
BEGIN

    
  DECLARE @FILTRO NVARCHAR(100);
  DECLARE @SQL NVARCHAR(600);

  SET @FILTRO ='';

  IF (@IDTOKENCOMPARTILHADO <> 0)
  BEGIN
     SET @FILTRO = ' AND IDTOKENCOMPARTILHADO = ' + CONVERT(VARCHAR, @IDTOKENCOMPARTILHADO)
  END


	SET @SQL = 'SELECT IDTOKENCOMPARTILHADO, CODIGOEMPRESA, CODIGOCLIENTE, EMAIL, AUTOMATICO, QUADRO ' +
	' FROM TOKEN_COMPARTILHADO ' +
	' WHERE CODIGOEMPRESA = ''' + @CODIGOEMPRESA +
		''' AND CODIGOCLIENTE = ''' + @CODIGOCLIENTE + '''' +  @FILTRO
 
  PRINT @SQL

  EXECUTE SP_EXECUTESQL @SQL 

END



GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_LISTAEMAIL]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_SEL_LISTAEMAIL]
(
 @CodigoEmpresa varchar(15),
 @ID_MODELOEMAIL int
)
as
begin
   SELECT c.CodigoEmpresa, c.IDCliente as ChaveSeq, C.CodigoCliente as CodCliente, C.NomeCliente AS Nome, 
    C.NomeCliente AS Razao, C.EmailPessoa as E_mail, 'N' AS MARCAR , ISNULL(AC.CDSTATUS,'0') AS CDSTATUS ,  
  AC.DTENVIO, AC.DTATUALIZADO , ME.ASSUNTO 
  FROM Cliente C    
  LEFT OUTER JOIN  ATUALIZACADASTRO AC ON AC.CDCLIENTE = C.CodigoCliente
  LEFT OUTER JOIN MODELOEMAIL ME ON ME.ID_MODELOEMAIL = AC.ID_MODELOEMAIL      
  Where c.CodigoEmpresa = @CodigoEmpresa
  and C.CodigoCliente  NOT IN (SELECT CDCLIENTE FROM ATUALIZACADASTRO WHERE ID_MODELOEMAIL = @ID_MODELOEMAIL)
     and  C.EmailPessoa IS NOT NULL ORDER BY CodigoCliente 
  
end
GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_LISTAEMAILSELECIONADO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_SEL_LISTAEMAILSELECIONADO]
(
 @CodigoEmpresa varchar(15),
 @ID_MODELOEMAIL int
)
as
begin
   SELECT c.CodigoEmpresa, c.IDCliente as ChaveSeq, C.CodigoCliente as CodCliente, C.NomeCliente AS Nome, 
    C.NomeCliente AS Razao, C.EmailPessoa as E_mail, 'N' AS MARCAR , ISNULL(AC.CDSTATUS,'0') AS CDSTATUS ,  
  AC.DTENVIO, AC.DTATUALIZADO , ME.ASSUNTO, ac.Id_AtualizaCadastro 
  FROM Cliente C    
  LEFT OUTER JOIN  ATUALIZACADASTRO AC ON AC.CDCLIENTE = C.CodigoCliente
  LEFT OUTER JOIN MODELOEMAIL ME ON ME.ID_MODELOEMAIL = AC.ID_MODELOEMAIL      
  Where c.CodigoEmpresa = @CodigoEmpresa
  and C.CodigoCliente   IN (SELECT CDCLIENTE FROM ATUALIZACADASTRO WHERE ID_MODELOEMAIL = @ID_MODELOEMAIL)
     and  C.EmailPessoa IS NOT NULL ORDER BY CodigoCliente 
  
end


GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_LISTAENDERECOS]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[STP_SEL_LISTAENDERECOS]

(

  @CodigoEmpresa varchar(15),

  @CodigoCliente varchar(15)
)

 AS

 BEGIN



   SELECT TE.ds_tipoendereco, e.cd_endereco, e.cep, ce.Localidade, E.numero, E.complemento,

   e.DataCadastro, e.DataAtualizacao, e.PontoReferencia, e.cd_tipoendereco, ce.Bairro, ce.UF, ce.Localidade,
    ce.CodCidade, ce.LogradouroAbrev, ce.LogComplemento, ce.BairroAbrev, ce.Tipo, ce.Logradouro
	, (select top 1 c.Cidade from Cidades c where c.CodCidade = ce.CodCidade) as Cidade, e.Ativo, ce.Tipo

   FROM ENDERECO E

   INNER JOIN cep ce ON ce.cep = E.cep

   INNER JOIN TipoEndereco TE ON TE.cd_tipoendereco = E.cd_tipoendereco

   Where e.CodigoEmpresa = @CodigoEmpresa

   and e.CodigoCliente = @CodigoCliente


 END

GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_MACRO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[STP_SEL_MACRO]
as
begin
   Select * from Macro
end

GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_PARAMETROS]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_SEL_PARAMETROS]
AS
BEGIN
   SELECT * FROM Parametros
END

GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_PESSOA]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_SEL_PESSOA]
(  
   @CodEmpresa varchar(15),
   @CodCliente varchar(15)
)
as
begin
  
    Select IDCliente, CodigoEmpresa, CodigoCliente, TipoCliente,  codigopais, Documento, nomecliente, DataNascFundacao, 
	IERG, EmailPessoa, DataCadastro, DataAtualizacao, NomeFantasia, CNAE, RegimeTributario, CodSuframa, DataSuframa,
	EmailCobranca, EmailNFe
	from cliente
	where CodigoEmpresa = @CodEmpresa
	and CodigoCliente = @CodCliente

end


GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_PET]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_SEL_PET]
(
  @CODIGOEMPRESA VARCHAR(15),
  @CODIGOCLIENTE VARCHAR(15),
  @IDPET INT
)
AS
BEGIN

   DECLARE @FILTRO NVARCHAR(100);
   DECLARE @SQL NVARCHAR(500);

   IF (@IDPET <> 0)
     SET @FILTRO = ' AND P.IDPET = ' + CONVERT(VARCHAR, @IDPET);

  SET @SQL = ' SELECT ' +
        'P.IDPET, '+
	    'P.CODIGOEMPRESA, '+
        'P.CODIGOCLIENTE,'+
        'P.IDESPECIE,'+
        'P.IDRACA, '+
        'P.NOME, '+
        'P.IDADE, '+
        'P.KG, '+
        'P.NUMPEDIGRE,'+
		'P.ATIVO,'+
		'P.DATAATUALIZACAO,'+
		'P.DATACADASTRO'+
		'FROM PET P'+
		'WHERE P.CODIGOEMPRESA = ' + @CODIGOEMPRESA +
		' AND P.CODIGOCLIENTE = ' + @CODIGOCLIENTE + @FILTRO
  
  PRINT @SQL

  EXECUTE SP_EXECUTESQL @SQL 

END

GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_RESPOSTAPADRAO_BY_IDTIPOSOLICITACAO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[STP_SEL_RESPOSTAPADRAO_BY_IDTIPOSOLICITACAO]
(
  @idTipoSolicitacao int,
  @idStatus int
)
as
begin

  Select * from RespostaPadrao Where IdTipoSolicitacao = @idTipoSolicitacao
   and IdStatus = @idStatus
end

GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_SOCIO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[STP_SEL_SOCIO]
(
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15),
  @CodigoSocio int
)
as
begin

 select CodigoSocio, CodigoEmpresa, CodigoCliente, Nome, Cpf, Rg, dddtelefone, telefone, dddcelular, celular,
 email, sexo, ativo, datanascimento, datacadastro, dataatualizacao
  from socio
  where codigoempresa = @CodigoEmpresa
  and codigocliente = @CodigoCliente
  and codigosocio = @CodigoSocio
 
end
GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_SOCIOS]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[STP_SEL_SOCIOS]
(
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15)
)
as
begin

 select CodigoSocio, CodigoEmpresa, CodigoCliente, Nome, Cpf, Rg, dddtelefone, telefone, dddcelular, celular,
 email, sexo, ativo, datanascimento, datacadastro, dataatualizacao
  from socio
  where codigoempresa = @CodigoEmpresa
  and codigocliente = @CodigoCliente
 
end
GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_TOKEN]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[STP_SEL_TOKEN]
(
        @CODIGOEMPRESA VARCHAR(15),
		@CODIGOCLIENTE VARCHAR(15)
)
 AS
 BEGIN

	DECLARE @TOKEN    VARCHAR(04)
	DECLARE @POSICAO  INT
	DECLARE @NOME     VARCHAR(80)
	DECLARE @EMAIL    VARCHAR(100)
	DECLARE @CODUSUARIO VARCHAR(15)
	DECLARE @VALIDADE VARCHAR(5)


    SET NOCOUNT ON

        -->> ESTA É A ROTINA COMPLETA POREM VOU QUEBRA-LA EM PARTES PARA PODER COMENTAR MELHOR OK.

        SELECT TOP 1 
           @POSICAO = TF.POSICAOTOKEN, 
           @TOKEN   = TF.NUMEROTOKEN,
		   @NOME    = CC.NOMECLIENTE,
		   @EMAIL   = U.EMAIL,
		   @CODUSUARIO = U.CODUSUARIO,
		   @VALIDADE = K.VALIDADE
        FROM TOKEN_FILHO TF
		INNER JOIN TOKEN K ON K.IDREGISTRO = TF.IDTOKENPAI
		INNER JOIN CLIENTE CC ON CC.CODUSUARIO = K.IDOPERADOR
		INNER JOIN USUARIO U ON U.CODUSUARIO = CC.CODUSUARIO

        WHERE TF.IDTOKENPAI   IN (SELECT IDREGISTRO 
                               FROM TOKEN T
 						      INNER JOIN CLIENTE C ON C.CODUSUARIO  = T.IDOPERADOR
                              WHERE C.CODIGOEMPRESA = @CODIGOEMPRESA
							  AND C.CODIGOCLIENTE = @CODIGOCLIENTE 
							  AND T.FLAGINATIVO =0

                            ) 

        ORDER BY NEWID()

    SET NOCOUNT OFF

    SELECT @TOKEN AS TOKEN, @POSICAO AS POSICAO, @NOME AS NOME, @EMAIL AS EMAIL, @CODUSUARIO AS CODUSUARIO, 
	       @VALIDADE AS VALIDADE

END 
GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_USUARIO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[STP_SEL_USUARIO]
(
 @Nome varchar(50),
 @Email varchar(100)
)
as
begin
   Select CodUsuario,Nome, Email from Usuario
   Where Nome = @Nome
   and Email = @Email
end

GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_USUARIO_FP]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[STP_SEL_USUARIO_FP]
(
 @Senha varchar(8),
 @Email varchar(100)
)
as
begin
   Select C.CodigoEmpresa, C.CodigoCliente, U.CodUsuario,U.Nome, U.Email , u.parceiro, c.TipoCliente, u.CodPerfil, u.ativo, c.Documento
   from Usuario u
   INNER JOIN CLIENTE C ON C.CODUSUARIO = U.CodUsuario
   Where ativo = 'S' and data_pagamento is not null
   and U.Senha = @Senha
   and U.Email = @Email
end


GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_USUARIO_X_FILIAL]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_SEL_USUARIO_X_FILIAL]
(
 @CODUSUARIO VARCHAR(15)
)
AS
BEGIN

  SELECT F.CodFilial, F.Razao
  FROM UsuarioXFilial UF
  INNER JOIN FILIAL F ON F.CodFilial = UF.CODFILIAL
  WHERE UF.CODUSUARIO =@CODUSUARIO

END
GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_USUARIOATIVO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_SEL_USUARIOATIVO]
(
   @CodUsuario varchar(15)
)
AS 
BEGIN

    SELECT C.CodigoEmpresa, C.CodigoCliente, C.CodUsuario, U.nome, u.email
	FROM CLIENTE C
	INNER JOIN USUARIO U ON U.CodUsuario = C.CodUsuario
	WHERE C.CodUsuario = @CodUsuario
   
END

GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_USUARIOBYEMAIL]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_SEL_USUARIOBYEMAIL]
(
 @EMAIL VARCHAR(100)
)
AS
BEGIN
    SELECT u.CodUsuario, u.nome, u.email, c.CodigoEmpresa, c.CodigoCliente FROM USUARIO u
	inner join Cliente c on c.CodUsuario = u.CodUsuario
	WHERE u.EMAIL = @EMAIL
END
GO
/****** Object:  StoredProcedure [dbo].[STP_SEL_VEICULOS]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_SEL_VEICULOS]
(
  @CODIGOEMPRESA VARCHAR(15),
  @CODIGOCLIENTE VARCHAR(15),
  @IDVEICULO INT
)
AS
BEGIN

  DECLARE @FILTRO NVARCHAR(100);
  DECLARE @SQL NVARCHAR(600);

  SET @FILTRO = NULL;

  IF (@IDVEICULO <> 0)
  BEGIN
     SET @FILTRO = ' AND V.IDVEICULO = ' + CONVERT(VARCHAR, @IDVEICULO)
  END

  PRINT @filtro

  SET @SQL = 'SELECT V.IDVEICULO, ' +
        'V.CODIGOEMPRESA, ' +
        'V.CODIGOCLIENTE, ' +
        'V.IDCOMBUSTIVEL, ' +
        'V.RENAVAM,  ' +
        'V.PLACA,  ' +
        'V.ANO,  ' +
        'V.ANOFABRICACAO, ' + 
        'V.IDFABRICANTE, ' +
        'V.IDMARCA,  ' +
        'V.IDMODELO,  ' +
        'V.IDCOR, ' +
		'V.DATAATUALIZACAO, ' +
		'V.DATACADASTRO, ' +
		'V.ATIVO ' +
        'FROM VEICULOS V' +
		' WHERE V.CODIGOEMPRESA = ''' + @CODIGOEMPRESA +
		''' AND V.CODIGOCLIENTE = ''' + @CODIGOCLIENTE + '''' +  @FILTRO
 
  PRINT @SQL

  EXECUTE SP_EXECUTESQL @SQL 


END

GO
/****** Object:  StoredProcedure [dbo].[STP_UPD_CLIENTE]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_UPD_CLIENTE]
(
 @CodigoEmpresa varchar(15),
 @CodigoCliente varchar(15),
 @nomecliente varchar(80),
 @Documento varchar(20),
 @IERG varchar(20),
 @EmailPessoal varchar(100),
 @codigopais varchar(15),
 @DataNascFundacao date
)
as
begin

   DECLARE @DataAtualizacao DATETIME
   SET @DataAtualizacao = GETDATE();
   IF EXISTS (SELECT IDCliente FROM cliente Where CodigoEmpresa = @CodigoEmpresa
                                              and CodigoCliente = @CodigoCliente)

   BEGIN

		   Update cliente
		   Set nomecliente = @nomecliente,
		   Documento = @Documento,
		   IERG = @IERG,
		   EmailPessoa = @EmailPessoal,
		   CodigoPais = @codigopais,
		   DataNascFundacao = @DataNascFundacao,
		   DataAtualizacao  = @DataAtualizacao
		   Where CodigoEmpresa = @CodigoEmpresa
		   and CodigoCliente = @CodigoCliente

   End
end


GO
/****** Object:  StoredProcedure [dbo].[STP_UPD_CLIENTE_FIS]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_UPD_CLIENTE_FIS]
(
 @CodigoEmpresa varchar(15),
 @CodigoCliente varchar(15),
 @nomecliente varchar(80),
 @Documento varchar(20),
 @IERG varchar(20),
 @EmailPessoal varchar(100),
 @codigopais varchar(15),
 @DataNascFundacao date
)
as
begin

   DECLARE @DataAtualizacao DATETIME
   SET @DataAtualizacao = GETDATE();
   IF EXISTS (SELECT IDCliente FROM cliente Where CodigoEmpresa = @CodigoEmpresa
                                              and CodigoCliente = @CodigoCliente)

   BEGIN

		   Update cliente
		   Set nomecliente = @nomecliente,
		   Documento = @Documento,
		   IERG = @IERG,
		   EmailPessoa = @EmailPessoal,
		   CodigoPais = @codigopais,
		   DataNascFundacao = @DataNascFundacao,
		   DataAtualizacao  = @DataAtualizacao
		   Where CodigoEmpresa = @CodigoEmpresa
		   and CodigoCliente = @CodigoCliente

   End
end


GO
/****** Object:  StoredProcedure [dbo].[STP_UPD_CLIENTE_JUR]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[STP_UPD_CLIENTE_JUR]
(
 @CodigoEmpresa varchar(15),
 @CodigoCliente varchar(15),
 @nomecliente varchar(80),
 @NomeFantasia varchar(30),
 @IERG varchar(20),
 @CNAE varchar(20),
 @CodSuframa varchar(20),
 @DataSuframa date,
 @RegimeTributario varchar(20),
 @DataNascFundacao date,
 @EmailCobranca varchar(100),
 @EmailNFe varchar(100)
)
as
begin

   DECLARE @DataAtualizacao DATETIME
   SET @DataAtualizacao = GETDATE();
   IF EXISTS (SELECT IDCliente FROM cliente Where CodigoEmpresa = @CodigoEmpresa
                                              and CodigoCliente = @CodigoCliente)

   BEGIN

		   Update cliente
		   Set nomecliente = @nomecliente,
		   IERG = @IERG,
		   NomeFantasia = @NomeFantasia,
		   CNAE = @CNAE,
	       CodSuframa = @CodSuframa,
		   DataSuframa = @DataSuframa,
		   RegimeTributario = @RegimeTributario,
		   DataNascFundacao = @DataNascFundacao,
		   EmailCobranca = @EmailCobranca,
		   EmailNfe = @EmailNFe,
           DataAtualizacao  = @DataAtualizacao
		   Where CodigoEmpresa = @CodigoEmpresa
		   and CodigoCliente = @CodigoCliente

   End
end


GO
/****** Object:  StoredProcedure [dbo].[STP_UPD_CONFIRMAPAGAMENTO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_UPD_CONFIRMAPAGAMENTO]
(
 @CODUSUARIO VARCHAR(15)
)
AS
BEGIN
   
    UPDATE USUARIO
	SET ATIVO ='S' , DATA_PAGAMENTO = GETDATE()
	WHERE CODUSUARIO = @CODUSUARIO

END

GO
/****** Object:  StoredProcedure [dbo].[STP_UPD_CONTATO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[STP_UPD_CONTATO]
(
  
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15),
  @Nome varchar(50),
  @cd_cargo int,
  @cd_tipoTelefone int,
  @ddd varchar(2),
  @telefone varchar(10),
  @Email varchar(100),
  @website varchar(100),
  @facebook varchar(100),
  @twitter varchar(100),
  @CanalYoutube varchar(100),
  @Instagram varchar(100),
  @linkdin varchar(100),
  @Ativo varchar(3),
  @CodigoContato int,
  @cd_retorno int output
)
as
begin

   set @cd_retorno = 0
   SET NOCOUNT ON;
 
 
   Update Contatos
   set nome = @Nome
   ,cd_cargo = @cd_cargo
   ,cd_tipoTelefone = @cd_tipoTelefone
   ,ddd = @ddd
   ,telefone = @telefone
   ,Email = @Email
   ,website = @website
   ,facebook = @facebook
   ,twitter  = @twitter
   ,Ativo = @Ativo
   ,canalYoutube = @CanalYoutube
   ,Instagram = @Instagram
   ,Linkdin = @linkdin
   ,DataAtualizacao  = Getdate()
   Where CodigoEmpresa  = @CodigoEmpresa
    and CodigoCliente = @CodigoCliente
	and CodigoContato = @CodigoContato

   SET NOCOUNT OFF;
   set @cd_retorno = @CodigoContato;

   SELECT @cd_retorno;


end
GO
/****** Object:  StoredProcedure [dbo].[STP_UPD_ENDERECO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[STP_UPD_ENDERECO]
(
 @codigoempresa varchar(15),
 @codigocliente varchar(15),
 @cep varchar(9),
 @numero varchar(10),
 @complemento varchar(45),
 @pontoreferencia varchar(40),
 @cd_tipoendereco int,
 @cd_endereco int,
 @ativo varchar(3),
 @cd_retorno int output
)

as

begin

   set @cd_retorno = 0
   SET NOCOUNT ON;
 
    update Endereco
	Set cep = @cep
	,numero = @numero
	,complemento = @complemento
	,pontoreferencia = @pontoreferencia
	,cd_tipoendereco = @cd_tipoendereco
	,DataAtualizacao = Getdate()
	,Ativo = @ativo
	Where CodigoEmpresa = @codigoempresa
	and CodigoCliente = @codigocliente
	and cd_endereco = @cd_endereco

   SET NOCOUNT OFF;
   set @cd_retorno = @cd_endereco;

   SELECT @cd_retorno;

end



GO
/****** Object:  StoredProcedure [dbo].[STP_UPD_ENVIOEMAIL]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[STP_UPD_ENVIOEMAIL]
(
 @CodUsuario int,
 @Retorno char(1)
)
as
begin
   Update Usuario
   set EmailRegistroEnviado = @Retorno, DataEnvioEmail = Getdate()
   Where CodUsuario = @CodUsuario

end

GO
/****** Object:  StoredProcedure [dbo].[STP_UPD_PET]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[STP_UPD_PET]
(
        @IDPet int, 
        @CodigoEmpresa VARCHAR(15),
        @CodigoCliente VARCHAR(15),
        @IDEspecie INT,
        @IDRaca INT,
        @Nome VARCHAR(50),
        @Idade INT,
        @Kg DECIMAL,
        @NumPedigre VARCHAR(20),
		@ativo char(1),
		@IdRetorno INT OUTPUT
)
AS
BEGIN
  
   Update Pet
   set IDEspecie = @IDEspecie,
   IDRaca = @IDRaca,
   nome = @Nome,
   Idade = @Idade,
   kg = @Kg,
   NumPedigre = @NumPedigre,
   ativo = @ativo,
   DataAtualizacao = getdate()
   where CodigoEmpresa = @CodigoEmpresa
   and CodigoCliente = @CodigoCliente
   and IDPet = @IDPet

   IF (@@ROWCOUNT > 0)
	BEGIN
	  SET @IDRETORNO = @IDPet
	END

	SELECT @IDRETORNO AS IDRETORNO

END
GO
/****** Object:  StoredProcedure [dbo].[STP_UPD_REDEFINIRSENHA]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_UPD_REDEFINIRSENHA]
(
  @CODIGOEMPRESA VARCHAR(15),
  @CODIGOCLIENTE VARCHAR(15),
  @EMAIL VARCHAR(100),
  @SENHA VARCHAR(8),
  @CODUSUARIO INT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
  
    SET @CODUSUARIO = 0;
    SET @CODUSUARIO = (SELECT CODUSUARIO FROM CLIENTE WHERE CODIGOEMPRESA = @CODIGOEMPRESA AND CODIGOCLIENTE = @CODIGOCLIENTE)

	
	   UPDATE USUARIO
	   SET SENHA = @SENHA
	   WHERE CODUSUARIO = @CODUSUARIO AND EMAIL = @EMAIL
	

    SET NOCOUNT OFF;
    SELECT @CODUSUARIO;

END

GO
/****** Object:  StoredProcedure [dbo].[STP_UPD_SOCIO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[STP_UPD_SOCIO]
(
  @CodigoEmpresa varchar(15),
  @CodigoCliente varchar(15),
  @CodigoSocio int,
  @Nome varchar(50), 
  @Cpf varchar(14), 
  @Rg varchar(12), 
  @dddtelefone varchar(2), 
  @telefone varchar(10), 
  @dddcelular varchar(2), 
  @celular varchar(10),
  @email varchar(100), 
  @sexo varchar(1), 
  @ativo varchar(3), 
  @datanascimento date,
  @cd_retorno int output
)
as
begin
   set @cd_retorno = 0
   SET NOCOUNT ON;
 

   update Socio
   set Nome = @Nome
   , cpf = @cpf
   , rg = @rg
   , dddtelefone = @dddtelefone
   , telefone = @telefone
   , dddcelular = @dddcelular
   , celular = @celular
   , email = @email
   , sexo = @sexo
   , ativo = @ativo
   , datanascimento = @datanascimento
   , dataatualizacao = GetDate()
   Where codigoempresa = @codigoempresa
   and codigocliente = @codigocliente
   and codigosocio = @CodigoSocio

   SET NOCOUNT OFF;
   set @cd_retorno = @CodigoSocio;

   SELECT @cd_retorno;


end


GO
/****** Object:  StoredProcedure [dbo].[STP_UPD_VEICULO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_UPD_VEICULO]
(
    @IDVEICULO INT,
	@CODIGOEMPRESA VARCHAR(15),
	@CODIGOCLIENTE VARCHAR(15),
	@IDCOMBUSTIVEL INT,
	@RENAVAM VARCHAR(20),
	@PLACA VARCHAR(8),
	@ANO VARCHAR(4),
	@ANOFABRICACAO VARCHAR(4),
	@IDFABRICANTE INT,
	@IDMARCA INT,
	@IDMODELO INT,
	@IDCOR INT,
	@IDRETORNO INT OUTPUT
)
AS
BEGIN
    
	SET @IDRETORNO = 0;

    UPDATE Veiculos
	SET IDCOMBUSTIVEL = @IDCOMBUSTIVEL,
	RENAVAM = @RENAVAM,
	PLACA = @PLACA,
	ANO = @ANO,
	AnoFabricacao = @ANOFABRICACAO,
	IdFabricante = @IDFABRICANTE,
	IdMarca = @IDMARCA,
	IdModelo = @IDMODELO,
	IdCor = @IDCOR,
	DATAATUALIZACAO = GETDATE()
	WHERE CodigoEmpresa = @CODIGOEMPRESA
	AND CodigoCliente = @CODIGOCLIENTE
	AND IdVeiculo = @IDVEICULO

	IF (@@ROWCOUNT > 0)
	BEGIN
	  SET @IDRETORNO = @IDVEICULO
	END

	SELECT @IDRETORNO AS IDRETORNO

END

GO
/****** Object:  StoredProcedure [dbo].[TabDef_UpdAll]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[TabDef_UpdAll]
AS
BEGIN
DECLARE @TABNAME VARCHAR(128)
DECLARE CURSOR_TABLES CURSOR FOR
    Select name From SYSOBJECTS Where xtype = 'U'
       And name <> 'xTabDef'
       And name <> 'dtproperties'
OPEN  CURSOR_TABLES
FETCH CURSOR_TABLES INTO @TABNAME
WHILE (@@FETCH_STATUS = 0)
BEGIN
    Delete From xTabDef Where ColTabName = @TABNAME
    Insert Into xTabDef ( ColTabName, ColID, ColName, ColType, ColLen, ColScale, ColAutoVal ) 
           Select  B.NAME, A.COLID, A.NAME , C.NAME , 
                   A.LENGTH * (1 - sign(isnull(A.PREC,0))) + isnull(A.PREC,0), A.SCALE, 
                   CAST(A.COLSTAT AS INT) --COLAUTOVAL -- NAO FUNCIONA SQL 2005
           From SYSCOLUMNS A , SYSOBJECTS B , SYSTYPES C 
           Where
                   B.NAME = @TABNAME And B.ID = A.ID And 
                   A.USERTYPE = C.USERTYPE Order by COLID
    FETCH CURSOR_TABLES INTO @TABNAME
END
CLOSE CURSOR_TABLES
deallocate CURSOR_TABLES
Select * From xTabDef Order By ColTabName, ColID
END




GO
/****** Object:  Table [dbo].[ARQUIVOBAIXADO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ARQUIVOBAIXADO](
	[IDARQUIVOBAIXADO] [int] IDENTITY(1,1) NOT NULL,
	[CODIGOEMPRESA] [varchar](15) NULL,
	[CODIGOCLIENTE] [varchar](15) NULL,
	[NOMEARQUIVO] [varchar](100) NULL,
	[DATADOWNLOAD] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDARQUIVOBAIXADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ATUALIZACADASTRO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ATUALIZACADASTRO](
	[ID_ATUALIZACADASTRO] [int] IDENTITY(1,1) NOT NULL,
	[CDCLIENTE] [int] NULL,
	[CDCONTATO] [int] NULL,
	[CDSTATUS] [varchar](1) NULL,
	[ID_MODELOEMAIL] [int] NULL,
	[DTENVIO] [datetime] NULL,
	[DTATUALIZADO] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ATUALIZACADASTRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bairro]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bairro](
	[cd_bairro] [int] IDENTITY(1,1) NOT NULL,
	[ds_bairro] [varchar](255) NULL,
	[cd_cidade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_bairro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CAIXASAIDA]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CAIXASAIDA](
	[ID_CAIXASAIDA] [int] IDENTITY(1,1) NOT NULL,
	[TIPO] [varchar](3) NULL,
	[CODIGO] [int] NULL,
	[EMAILS] [varchar](max) NULL,
	[CDSTATUS] [char](1) NULL,
	[ID_MODELOEMAIL] [int] NULL,
	[ARQUIVO] [varchar](400) NULL,
	[OBSERVACAO] [varchar](20) NULL,
	[DTENVIO] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CAIXASAIDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cargo](
	[cd_cargo] [int] IDENTITY(1,1) NOT NULL,
	[ds_cargo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CEP]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CEP](
	[Tipo] [varchar](36) NULL,
	[Logradouro] [varchar](200) NULL,
	[CEP] [varchar](9) NULL,
	[Bairro] [varchar](100) NULL,
	[UF] [varchar](2) NULL,
	[Localidade] [varchar](200) NULL,
	[CodCidade] [int] NULL,
	[LogradouroAbrev] [varchar](200) NULL,
	[LogComplemento] [varchar](100) NULL,
	[BairroAbrev] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cidade]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cidade](
	[cd_cidade] [int] IDENTITY(1,1) NOT NULL,
	[ds_cidade] [varchar](255) NULL,
	[cd_estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_cidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cidades]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cidades](
	[CodCidade] [int] NULL,
	[Cidade] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[CodigoPais] [varchar](15) NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[TipoCliente] [char](1) NULL,
	[NomeCliente] [varchar](80) NULL,
	[NomeFantasia] [varchar](30) NULL,
	[Documento] [varchar](20) NULL,
	[IERG] [varchar](20) NULL,
	[DataNascFundacao] [date] NULL,
	[CNAE] [varchar](20) NULL,
	[CodSuframa] [varchar](20) NULL,
	[DataSuframa] [date] NULL,
	[RegimeTributario] [varchar](20) NULL,
	[EmailPessoa] [varchar](100) NULL,
	[EmailCobranca] [varchar](100) NULL,
	[EmailNFe] [varchar](100) NULL,
	[DataCadastro] [datetime] NULL,
	[DataAtualizacao] [datetime] NULL,
	[CodClienteExterno] [int] NULL,
	[CodUsuario] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CNAE]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CNAE](
	[SubClasse] [varchar](20) NULL,
	[Denominacao] [varchar](300) NULL,
	[cd_cnae] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contatos]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contatos](
	[CodigoContato] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[Nome] [varchar](50) NULL,
	[cd_cargo] [int] NULL,
	[cd_tipoTelefone] [int] NULL,
	[ddd] [varchar](2) NULL,
	[telefone] [varchar](10) NULL,
	[Email] [varchar](100) NULL,
	[website] [varchar](100) NULL,
	[facebook] [varchar](100) NULL,
	[twitter] [varchar](100) NULL,
	[canalYoutube] [varchar](100) NULL,
	[Instagram] [varchar](100) NULL,
	[Linkdin] [varchar](100) NULL,
	[Ativo] [varchar](3) NULL,
	[DataCadastro] [datetime] NULL,
	[DataAtualizacao] [datetime] NULL,
 CONSTRAINT [PK__contatos__4F481362496D93E1] PRIMARY KEY CLUSTERED 
(
	[CodigoContato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[convite]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[convite](
	[IDconvite] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[CodUsuarioConvidado] [varchar](15) NULL,
	[DataConvite] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDconvite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_AUTXML]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_AUTXML](
	[CTE_AUTXML] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[CNPJ] [varchar](14) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_AUTXML] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_CAPA]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_CAPA](
	[CTE_CAPA_ID] [int] IDENTITY(1,1) NOT NULL,
	[cUF] [varchar](2) NULL,
	[cCT] [varchar](8) NULL,
	[CFOP] [varchar](4) NULL,
	[natOp] [varchar](100) NULL,
	[forPag] [varchar](2) NULL,
	[mod_] [varchar](2) NULL,
	[serie] [varchar](1) NULL,
	[nCT] [varchar](10) NULL,
	[dhEmi] [datetime] NULL,
	[tpImp] [varchar](2) NULL,
	[tpEmis] [varchar](2) NULL,
	[cDV] [varchar](2) NULL,
	[tpAmb] [varchar](2) NULL,
	[tpCTe] [varchar](2) NULL,
	[procEmi] [varchar](2) NULL,
	[verProc] [varchar](5) NULL,
	[cMunEnv] [varchar](8) NULL,
	[xMunEnv] [varchar](60) NULL,
	[UFEnv] [varchar](2) NULL,
	[modal] [varchar](2) NULL,
	[tpServ] [varchar](2) NULL,
	[cMunIni] [varchar](8) NULL,
	[xMunIni] [varchar](60) NULL,
	[UFIni] [varchar](2) NULL,
	[cMunFim] [varchar](8) NULL,
	[xMunFim] [varchar](60) NULL,
	[UFFim] [varchar](2) NULL,
	[retira] [varchar](2) NULL,
	[toma03] [varchar](2) NULL,
	[xCaracAd] [varchar](30) NULL,
	[xCaracSer] [varchar](30) NULL,
	[xEmi] [varchar](50) NULL,
	[xOrig] [varchar](3) NULL,
	[xDest] [varchar](3) NULL,
	[tpPer] [varchar](2) NULL,
	[dProg] [datetime] NULL,
	[tpHor] [varchar](2) NULL,
	[hProg] [datetime] NULL,
	[xObs] [varchar](max) NULL,
	[xTexto] [varchar](max) NULL,
	[CTE_FILIAL_ID] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_CAPA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_COBR]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_COBR](
	[CTE_COBR_ID] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[nFat] [varchar](10) NULL,
	[vOrig] [decimal](18, 2) NULL,
	[vDesc] [decimal](18, 2) NULL,
	[vLiq] [decimal](18, 2) NULL,
	[nDup] [varchar](10) NULL,
	[dVenc] [datetime] NULL,
	[vDup] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_COBR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_COMP_VALORES]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_COMP_VALORES](
	[CTE_COMP_VALORES_ID] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[Nome] [varchar](40) NULL,
	[Valor] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_COMP_VALORES_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_Destinatario]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_Destinatario](
	[CTE_Destinatario] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[CNPJ] [varchar](14) NULL,
	[IE] [varchar](15) NULL,
	[xNome] [varchar](100) NULL,
	[xFant] [varchar](40) NULL,
	[xLgr] [varchar](100) NULL,
	[nro] [varchar](30) NULL,
	[xCpl] [varchar](30) NULL,
	[xBairro] [varchar](50) NULL,
	[cMun] [varchar](8) NULL,
	[xMun] [varchar](60) NULL,
	[CEP] [varchar](8) NULL,
	[UF] [varchar](2) NULL,
	[cPais] [varchar](4) NULL,
	[xPais] [varchar](20) NULL,
 CONSTRAINT [PK__CTE_Dest__AD862FFADA01E00C] PRIMARY KEY CLUSTERED 
(
	[CTE_Destinatario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_EMITENTE]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_EMITENTE](
	[CTE_Emitente_ID] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[CNPJCPF] [varchar](14) NULL,
	[IE] [varchar](15) NULL,
	[IEST] [varchar](15) NULL,
	[xNome] [varchar](100) NULL,
	[xFant] [varchar](40) NULL,
	[IM] [varchar](20) NULL,
	[CNAE] [varchar](20) NULL,
	[Fone] [varchar](12) NULL,
	[xCpl] [varchar](30) NULL,
	[xLgr] [varchar](100) NULL,
	[nro] [varchar](30) NULL,
	[xBairro] [varchar](50) NULL,
	[cMun] [varchar](8) NULL,
	[xMun] [varchar](60) NULL,
	[CEP] [varchar](8) NULL,
	[UF] [varchar](2) NULL,
	[cPais] [varchar](4) NULL,
	[xPais] [varchar](20) NULL,
 CONSTRAINT [PK__CTE_EMIT__0830CB07A2B78080] PRIMARY KEY CLUSTERED 
(
	[CTE_Emitente_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_ESTADOS]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_ESTADOS](
	[CTE_ESTADOS] [int] IDENTITY(1,1) NOT NULL,
	[CODIGO] [varchar](2) NULL,
	[UF] [varchar](2) NULL,
	[DESCRICAO] [varchar](50) NULL,
	[ZFM] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_ESTADOS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_FILIAL]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_FILIAL](
	[CTE_FILIAL_ID] [varchar](15) NULL,
	[Nome] [varchar](40) NULL,
	[CNPJ] [varchar](14) NULL,
	[xMunicipio] [varchar](50) NULL,
	[UF] [varchar](2) NULL,
	[Path_NFE] [varchar](100) NULL,
	[regime] [varchar](2) NULL,
	[Inscricao] [varchar](12) NULL,
	[periodo] [varchar](7) NULL,
	[saldo] [decimal](18, 2) NULL,
	[Path_CTE] [varchar](100) NULL,
	[Credito] [decimal](18, 2) NULL,
	[Path_GIA] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_IMPOSTOS]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_IMPOSTOS](
	[CTE_IMPOSTOS_ID] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[SituTrib] [varchar](8) NULL,
	[CST] [varchar](8) NULL,
	[pRedBC] [decimal](18, 2) NULL,
	[vBC] [decimal](18, 2) NULL,
	[pICMS] [decimal](18, 2) NULL,
	[vICMS] [decimal](18, 2) NULL,
	[vCred] [decimal](18, 2) NULL,
	[infAdFisco] [varchar](400) NULL,
	[vTotTrib] [decimal](18, 2) NULL,
	[vPIS] [decimal](18, 2) NULL,
	[vCOFINS] [decimal](18, 2) NULL,
	[vIR] [decimal](18, 2) NULL,
	[vINSS] [decimal](18, 2) NULL,
	[vCSLL] [decimal](18, 2) NULL,
	[CFOP] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_IMPOSTOS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_INFCARGA]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_INFCARGA](
	[CTE_INFCARGA_ID] [int] IDENTITY(1,1) NOT NULL,
	[CCT] [varchar](8) NULL,
	[VCARGA] [decimal](18, 2) NULL,
	[PROPRED] [varchar](50) NULL,
	[XOUTCAT] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_INFCARGA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_INFCTESUB]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_INFCTESUB](
	[CTE_INFCTESUB_ID] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[CteChave] [varchar](44) NULL,
	[RefCteAnu] [varchar](8) NULL,
	[RefNfe] [varchar](10) NULL,
	[CNPJCPF] [varchar](14) NULL,
	[modelo] [varchar](2) NULL,
	[serie] [varchar](2) NULL,
	[subserie] [varchar](2) NULL,
	[numero] [varchar](10) NULL,
	[valor] [decimal](18, 2) NULL,
	[dEmi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_INFCTESUB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_INFMANU]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_INFMANU](
	[CTE_INFMANU_ID] [int] IDENTITY(1,1) NOT NULL,
	[CTE_INFMODAL] [int] NULL,
	[CCT] [varchar](8) NULL,
	[CINFMANU] [varchar](2) NULL,
	[XDIME] [varchar](20) NULL,
	[cIMP] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_INFMANU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_INFMODAL]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_INFMODAL](
	[CTE_INFMODAL] [int] IDENTITY(1,1) NOT NULL,
	[CCT] [varchar](8) NULL,
	[DPREVAEREO] [datetime] NULL,
	[IDT] [varchar](20) NULL,
	[CL] [varchar](2) NULL,
	[VTARIFA] [decimal](18, 2) NULL,
	[nMinu] [int] NULL,
	[nOCA] [varchar](15) NULL,
	[xLAgEmi] [varchar](50) NULL,
	[cTar] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_INFMODAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_INFQ]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_INFQ](
	[CTE_INFQ] [int] IDENTITY(1,1) NOT NULL,
	[CCT] [varchar](8) NULL,
	[CUNID] [varchar](2) NULL,
	[TPMED] [varchar](20) NULL,
	[QCARGA] [decimal](18, 4) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_INFQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_INFServico]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_INFServico](
	[CTE_INFServico_id] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[xDescServ] [varchar](300) NULL,
	[qCarga] [decimal](18, 4) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_INFServico_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_MUNICIPIO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_MUNICIPIO](
	[CTE_MUNICIPIO] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](6) NULL,
	[descricao] [varchar](100) NULL,
	[codigoIBGE] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_MUNICIPIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_MUNICIPIO_ZFM]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_MUNICIPIO_ZFM](
	[CTE_MUNICIPIO_ZFM] [int] IDENTITY(1,1) NOT NULL,
	[CODMUNICIPIO_DEST] [varchar](5) NULL,
	[MUNICIPIO] [varchar](50) NULL,
	[CODIGOUF] [varchar](2) NULL,
	[UF] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_MUNICIPIO_ZFM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_NFE]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_NFE](
	[CTE_NFE_ID] [int] IDENTITY(1,1) NOT NULL,
	[CCT] [varchar](8) NULL,
	[CHAVENFE] [varchar](44) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_NFE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_OBSCONT]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_OBSCONT](
	[CTE_OBSCONT_ID] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[xCampo] [varchar](20) NULL,
	[xTexto] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_OBSCONT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_PROTOCOLO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_PROTOCOLO](
	[CTE_Protocolo_ID] [int] IDENTITY(1,1) NOT NULL,
	[ID] [varchar](47) NULL,
	[tpAmb] [varchar](1) NULL,
	[verAplic] [varchar](20) NULL,
	[chCTe] [varchar](44) NULL,
	[dhRecbto] [datetime] NULL,
	[nProt] [varchar](20) NULL,
	[digVal] [varchar](40) NULL,
	[cStat] [varchar](3) NULL,
	[xMotivo] [varchar](80) NULL,
	[cCT] [varchar](8) NULL,
	[nCT] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_Protocolo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_REF]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_REF](
	[CTE_REF_ID] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[refCTe] [varchar](8) NULL,
	[cUF] [varchar](2) NULL,
	[AAMM] [varchar](4) NULL,
	[Cnpj] [varchar](14) NULL,
	[modelo] [varchar](2) NULL,
	[serie] [varchar](2) NULL,
	[nNF] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_REF_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_Remetente]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_Remetente](
	[CTE_Remetente_ID] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[CNPJ] [varchar](14) NULL,
	[IE] [varchar](15) NULL,
	[xNome] [varchar](100) NULL,
	[xFant] [varchar](40) NULL,
	[xLgr] [varchar](100) NULL,
	[nro] [varchar](30) NULL,
	[xCpl] [varchar](30) NULL,
	[xBairro] [varchar](50) NULL,
	[cMun] [varchar](8) NULL,
	[xMun] [varchar](60) NULL,
	[CEP] [varchar](8) NULL,
	[UF] [varchar](2) NULL,
	[cPais] [varchar](4) NULL,
	[xPais] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK__CTE_Reme__F3D6731F42003775] PRIMARY KEY CLUSTERED 
(
	[CTE_Remetente_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_RODO]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_RODO](
	[CTE_RODO_ID] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[RNTRC] [varchar](20) NULL,
	[dPrev] [datetime] NULL,
	[lota] [char](1) NULL,
	[CIOT] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_RODO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_RODO_OCC]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_RODO_OCC](
	[CTE_RODO_OCC_ID] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[CTE_RODO_ID] [int] NULL,
	[serie] [varchar](4) NULL,
	[nOcc] [int] NULL,
	[dEmi] [datetime] NULL,
	[CNPJ] [varchar](14) NULL,
	[cInt] [varchar](20) NULL,
	[IE] [varchar](15) NULL,
	[UF] [varchar](2) NULL,
	[fone] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_RODO_OCC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_SALDOCREDOR]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_SALDOCREDOR](
	[CTE_SALDOCREDOR_ID] [int] IDENTITY(1,1) NOT NULL,
	[CTE_FILIAL_ID] [varchar](15) NULL,
	[ARQUIVO] [varchar](100) NULL,
	[PERIODO] [varchar](8) NULL,
	[DATACADASTRO] [datetime] NULL,
	[SaldoInicial] [decimal](18, 2) NULL,
	[SaldoFinal] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_SEGURADORA]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_SEGURADORA](
	[CTE_SEGURADORA_ID] [int] IDENTITY(1,1) NOT NULL,
	[CCT] [varchar](8) NULL,
	[RESPSEG] [int] NULL,
	[XSEG] [varchar](80) NULL,
	[NAPOLICE] [varchar](20) NULL,
	[VCARGA] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_SEGURADORA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_Tomador]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_Tomador](
	[CTE_Tomador_ID] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[CNPJ] [varchar](14) NULL,
	[IE] [varchar](15) NULL,
	[xNome] [varchar](100) NULL,
	[xFant] [varchar](40) NULL,
	[xLgr] [varchar](100) NULL,
	[nro] [varchar](30) NULL,
	[xCpl] [varchar](30) NULL,
	[xBairro] [varchar](50) NULL,
	[cMun] [varchar](8) NULL,
	[xMun] [varchar](60) NULL,
	[CEP] [varchar](8) NULL,
	[UF] [varchar](2) NULL,
	[cPais] [varchar](4) NULL,
	[xPais] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK__CTE_Toma__F3D6731F42003775] PRIMARY KEY CLUSTERED 
(
	[CTE_Tomador_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTE_VPrest]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTE_VPrest](
	[CTE_VPrest] [int] IDENTITY(1,1) NOT NULL,
	[cCT] [varchar](8) NULL,
	[vTPrest] [decimal](18, 2) NULL,
	[vRec] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_VPrest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cursos]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cursos](
	[idCursos] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[escola] [varchar](80) NULL,
	[curso] [varchar](60) NULL,
	[nivel] [char](1) NULL,
	[mesanoconclusao] [varchar](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CustomerID] [varchar](15) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DOCUMENTOS]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DOCUMENTOS](
	[IDDocumentos] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[NomeDocumento] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDDocumentos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailRecebido]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailRecebido](
	[IDEmail] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
	[Classificacao] [varchar](10) NULL,
	[Email] [varchar](100) NULL,
	[Assunto] [varchar](30) NULL,
	[Corpo] [varchar](350) NULL,
	[DataRecebimento] [datetime] NULL,
	[DataResposta] [datetime] NULL,
	[IDEmailPai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empregos]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empregos](
	[IDEmpregos] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[NomeEmprego] [varchar](50) NULL,
	[id_cargo] [int] NULL,
	[MesAnoInicio] [varchar](7) NULL,
	[MesAnoFim] [varchar](7) NULL,
	[EmpregoAtual] [char](1) NULL,
	[Atividade] [varchar](400) NULL,
	[MotivoSaida] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEmpregos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresa](
	[IDEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[NomeEmpresa] [varchar](50) NULL,
	[NomeContato] [varchar](50) NULL,
	[CNPJ] [varchar](14) NULL,
	[CEP] [varchar](9) NULL,
	[Numero] [varchar](6) NULL,
	[Complemento] [varchar](10) NULL,
	[DDD] [varchar](4) NULL,
	[Telefone] [varchar](10) NULL,
	[website] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[endereco]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[endereco](
	[cd_endereco] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[cd_tipocontato] [int] NULL,
	[cep] [varchar](9) NULL,
	[numero] [varchar](10) NULL,
	[complemento] [varchar](45) NULL,
	[PontoReferencia] [varchar](40) NULL,
	[cd_tipoendereco] [int] NULL,
	[DataCadastro] [datetime] NULL,
	[DataAtualizacao] [datetime] NULL,
	[Ativo] [char](3) NULL,
 CONSTRAINT [PK__endereco__5652E915E11B7BE2] PRIMARY KEY CLUSTERED 
(
	[cd_endereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estado]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estado](
	[cd_estado] [varchar](2) NULL,
	[ds_estado] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Filhos]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Filhos](
	[iIdFilho] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[Nome] [varchar](80) NULL,
	[DataNascimento] [datetime] NULL,
	[Sexo] [varchar](1) NULL,
	[Rg] [varchar](15) NULL,
	[CPF] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdFilho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Filial]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Filial](
	[CodFilial] [varchar](15) NULL,
	[AliasEmpresa] [varchar](20) NULL,
	[Razao] [varchar](50) NULL,
	[Cgc] [varchar](18) NULL,
	[Inscricao] [varchar](15) NULL,
	[Endereco] [varchar](200) NULL,
	[Cidade] [varchar](200) NULL,
	[Estado] [varchar](2) NULL,
	[Cep] [varchar](9) NULL,
	[Numero1] [varchar](15) NULL,
	[Numero2] [varchar](15) NULL,
	[Numero3] [varchar](15) NULL,
	[Numero4] [varchar](15) NULL,
	[Tipo1] [varchar](1) NULL,
	[Tipo2] [varchar](1) NULL,
	[Tipo3] [varchar](1) NULL,
	[Tipo4] [varchar](1) NULL,
	[Email] [varchar](40) NULL,
	[TS] [binary](8) NULL,
	[EndNum] [varchar](15) NULL,
	[Complemento] [varchar](25) NULL,
	[Bairro] [varchar](100) NULL,
	[CodCidade] [int] NULL,
	[Logo] [varchar](255) NULL,
	[Danfe] [varchar](15) NULL,
	[Certificado] [varchar](250) NULL,
	[Ambiente] [int] NULL,
	[Simples] [varchar](1) NULL,
	[Path_Nfe] [varchar](255) NULL,
	[host] [varchar](80) NULL,
	[port] [int] NULL,
	[EmailSistema] [varchar](50) NULL,
	[Senha] [varchar](20) NULL,
	[nome] [varchar](50) NULL,
	[NomeRemetente] [varchar](60) NULL,
	[NumNFe] [int] NULL,
	[Par_Orcamento] [int] NULL,
	[Par_Pedido] [int] NULL,
	[Regime] [int] NULL,
	[Path_Schemas] [varchar](255) NULL,
	[Path_PDF] [varchar](255) NULL,
	[CreditoSN] [decimal](18, 2) NULL,
	[Par_Compra] [int] NULL,
	[SSL] [varchar](1) NULL,
	[LogoPremio] [varchar](255) NULL,
	[Site] [varchar](100) NULL,
	[MsgValores] [varchar](1000) NULL,
	[NumNFeEntrada] [int] NULL,
	[URL_PessoaFisica] [varchar](100) NULL,
	[URL_PessoaJuridica] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistoricoEmail]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistoricoEmail](
	[IDHistoricoEmail] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[CodUsuario] [varchar](15) NULL,
	[DataEnvio] [datetime] NULL,
	[IdTipoSolicitacao] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDHistoricoEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Informacoes]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Informacoes](
	[IDInformacoes] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[NomeMae] [varchar](80) NULL,
	[NomePai] [varchar](80) NULL,
	[Habilitacao] [varchar](20) NULL,
	[TipoHabilitacao] [varchar](10) NULL,
	[Reservista] [varchar](20) NULL,
	[Possuifilhos] [char](1) NULL,
	[QtosFilhos] [varchar](10) NULL,
	[TipoSanguineo] [varchar](5) NULL,
	[CTPS] [varchar](15) NULL,
	[TituloEleitor] [varchar](20) NULL,
	[Passporte] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDInformacoes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbs_cliente]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbs_cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](20) NULL,
	[data] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LAYOUT]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LAYOUT](
	[CodLayout] [int] IDENTITY(1,1) NOT NULL,
	[CodFilial] [varchar](15) NULL,
	[NomeTabela] [varchar](50) NULL,
	[NomeColunaOriginal] [varchar](50) NULL,
	[NomeColunaRenomeada] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodLayout] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogAcesso]    Script Date: 09/10/2017 18:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogAcesso](
	[cd_logacesso] [int] IDENTITY(1,1) NOT NULL,
	[CNPJ] [varchar](14) NULL,
	[Nome] [varchar](50) NULL,
	[DataLogin] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_logacesso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[logradouro]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logradouro](
	[cd_logradouro] [int] IDENTITY(1,1) NOT NULL,
	[cep] [varchar](9) NULL,
	[ds_logradouro] [varchar](255) NULL,
	[ds_abreviada] [varchar](100) NULL,
	[cd_bairro] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_logradouro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Macro]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Macro](
	[IDMacro] [int] IDENTITY(1,1) NOT NULL,
	[Tabela] [varchar](40) NULL,
	[Campo] [varchar](30) NULL,
	[Variavel] [varchar](30) NULL,
	[chave1] [varchar](50) NULL,
	[chave2] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDMacro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MODELOEMAIL]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MODELOEMAIL](
	[ID_MODELOEMAIL] [int] IDENTITY(1,1) NOT NULL,
	[CORPO_EMAIL] [varchar](4000) NULL,
	[ASSUNTO] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_MODELOEMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Operacao]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Operacao](
	[CodOperacao] [varchar](40) NOT NULL,
	[Descricao] [varchar](60) NOT NULL,
	[TS] [binary](8) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parametros](
	[ServidorSMTP] [varchar](100) NULL,
	[Porta] [varchar](6) NULL,
	[Email] [varchar](100) NULL,
	[Senha] [varchar](20) NULL,
	[ContadorArquivo] [int] NULL,
	[DiretorioArquivo] [varchar](100) NULL,
	[Par_Associado] [int] NULL,
	[versao] [varchar](10) NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCLiente] [varchar](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil](
	[CodPerfil] [varchar](20) NOT NULL,
	[Descricao] [varchar](50) NOT NULL,
	[TS] [binary](8) NULL,
	[CodFilial] [varchar](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Perfil_Operacao]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil_Operacao](
	[CodPerfil] [varchar](20) NOT NULL,
	[CodOperacao] [varchar](40) NOT NULL,
	[Manut] [varchar](10) NOT NULL,
	[TS] [binary](8) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PET]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PET](
	[IDPet] [int] NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[IDEspecie] [int] NULL,
	[IDRaca] [int] NULL,
	[Nome] [varchar](50) NULL,
	[Idade] [int] NULL,
	[Kg] [decimal](18, 0) NULL,
	[NumPedigre] [varchar](20) NULL,
	[DataCadastro] [datetime] NULL,
	[DataAtualizacao] [datetime] NULL,
	[Ativo] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegimeTributario]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegimeTributario](
	[cd_regime] [int] NULL,
	[ds_regime] [varchar](60) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RespostaPadrao]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RespostaPadrao](
	[IdRespostaPadrao] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoSolicitacao] [int] NULL,
	[Ativo] [bit] NULL,
	[Assunto] [varchar](100) NULL,
	[Texto] [varchar](4000) NULL,
	[IdStatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRespostaPadrao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sexo](
	[cd_sexo] [int] IDENTITY(1,1) NOT NULL,
	[ds_sexo] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_sexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Socio]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Socio](
	[CodigoSocio] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[Nome] [varchar](50) NULL,
	[cpf] [varchar](14) NULL,
	[rg] [varchar](12) NULL,
	[dddtelefone] [varchar](2) NULL,
	[telefone] [varchar](10) NULL,
	[dddcelular] [varchar](2) NULL,
	[celular] [varchar](10) NULL,
	[email] [varchar](100) NULL,
	[sexo] [char](1) NULL,
	[datanascimento] [date] NULL,
	[ativo] [varchar](3) NULL,
	[datacadastro] [datetime] NULL,
	[dataatualizacao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoSocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[teste]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teste](
	[nome] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoEndereco]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoEndereco](
	[cd_tipoendereco] [int] IDENTITY(1,1) NOT NULL,
	[ds_tipoendereco] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_tipoendereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoTelefone]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTelefone](
	[cd_tipotelefone] [int] IDENTITY(1,1) NOT NULL,
	[ds_tipotelefone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_tipotelefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TOKEN]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TOKEN](
	[IDRegistro] [int] IDENTITY(1,1) NOT NULL,
	[IDOperador] [int] NOT NULL,
	[Validade] [varchar](5) NOT NULL,
	[flagInativo] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Token_Compartilhado]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Token_Compartilhado](
	[IDTokenCompartilhado] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[PosicaoToken] [int] NULL,
	[NumeroToken] [varchar](4) NULL,
	[DataEnvio] [datetime] NULL,
	[DataAcesso] [datetime] NULL,
	[Imprimiu] [char](1) NULL,
	[Ativo] [char](1) NULL,
	[Validade] [varchar](5) NULL,
	[Automatico] [char](1) NULL,
	[Quadro] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTokenCompartilhado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TOKEN_FILHO]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TOKEN_FILHO](
	[IDRegistroFilho] [int] IDENTITY(1,1) NOT NULL,
	[IDTokenPai] [int] NOT NULL,
	[PosicaoToken] [int] NOT NULL,
	[NumeroToken] [varchar](4) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[CodUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](80) NULL,
	[senha] [varchar](8) NULL,
	[email] [varchar](100) NULL,
	[ddd] [varchar](4) NULL,
	[telefone] [varchar](10) NULL,
	[ativo] [char](1) NULL,
	[data_cadastro] [datetime] NULL,
	[data_pagamento] [datetime] NULL,
	[logado] [char](1) NULL,
	[CodPerfil] [varchar](20) NULL,
	[DataEnvioEmail] [datetime] NULL,
	[EmailRegistroEnviado] [char](1) NULL,
	[parceiro] [varchar](1) NULL,
	[IDCARTEIRA] [int] NULL,
 CONSTRAINT [PK__usuario__D0C03CD0F07F8B96] PRIMARY KEY CLUSTERED 
(
	[CodUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioXFilial]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioXFilial](
	[CodUsuario] [varchar](15) NOT NULL,
	[CodFilial] [varchar](15) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VeiculoManutencao]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VeiculoManutencao](
	[IdVeiculoManutencao] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [varchar](8) NULL,
	[IDItem] [int] NULL,
	[Periodo] [varchar](7) NULL,
	[Estabelecimento] [varchar](50) NULL,
	[ValorDespesa] [decimal](18, 5) NULL,
	[DataCadastro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVeiculoManutencao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Veiculos]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Veiculos](
	[IdVeiculo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoEmpresa] [varchar](15) NULL,
	[CodigoCliente] [varchar](15) NULL,
	[Placa] [varchar](10) NULL,
	[Ano] [varchar](4) NULL,
	[AnoFabricacao] [varchar](4) NULL,
	[IdFabricante] [int] NULL,
	[IdMarca] [int] NULL,
	[IdModelo] [int] NULL,
	[IdCor] [int] NULL,
	[IDCombustivel] [int] NULL,
	[DATAATUALIZACAO] [datetime] NULL,
	[RENAVAM] [varchar](20) NULL,
	[DATACADASTRO] [datetime] NULL,
	[ATIVO] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVeiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[XML_IMPORTADA]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[XML_IMPORTADA](
	[CTE_IMPORTADA_ID] [int] IDENTITY(1,1) NOT NULL,
	[DataEmissao] [datetime] NULL,
	[cCT] [varchar](8) NULL,
	[nCT] [varchar](7) NULL,
	[CHCTE] [varchar](44) NULL,
	[ArquivoXML] [xml] NULL,
	[DataEntrada] [datetime] NULL,
	[CodUsuario] [varchar](15) NULL,
	[TipoXML] [varchar](4) NULL,
	[Origem] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTE_IMPORTADA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xTabDef]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xTabDef](
	[ColTabName] [varchar](128) NULL,
	[ColId] [int] NULL,
	[ColName] [varchar](128) NULL,
	[ColType] [varchar](20) NULL,
	[ColLen] [int] NULL,
	[ColScale] [int] NULL,
	[ColAutoVal] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VW_LISTAEMAIL]    Script Date: 09/10/2017 18:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_LISTAEMAIL]        
AS        
(        
  SELECT c.CodigoEmpresa, c.IDCliente as ChaveSeq, C.CodigoCliente as CodCliente, C.NomeCliente AS Nome,  C.NomeCliente AS Razao, C.EmailPessoa as E_mail, 'N' AS MARCAR , ISNULL(AC.CDSTATUS,'0') AS CDSTATUS ,  
  AC.DTENVIO, AC.DTATUALIZADO , ME.ASSUNTO , AC.Id_AtualizaCadastro
  FROM Cliente C    
  LEFT OUTER JOIN  ATUALIZACADASTRO AC ON AC.CDCLIENTE = C.CodigoCliente
  LEFT OUTER JOIN MODELOEMAIL ME ON ME.ID_MODELOEMAIL = AC.ID_MODELOEMAIL      

)

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20170606-152245]    Script Date: 09/10/2017 18:28:20 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20170606-152245] ON [dbo].[XML_IMPORTADA]
(
	[DataEmissao] ASC,
	[cCT] ASC,
	[nCT] ASC,
	[CHCTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ARQUIVOBAIXADO] ADD  DEFAULT (getdate()) FOR [DATADOWNLOAD]
GO
ALTER TABLE [dbo].[CAIXASAIDA] ADD  DEFAULT ('0') FOR [CDSTATUS]
GO
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT (getdate()) FOR [DataCadastro]
GO
ALTER TABLE [dbo].[convite] ADD  DEFAULT (getdate()) FOR [DataConvite]
GO
ALTER TABLE [dbo].[CTE_SALDOCREDOR] ADD  DEFAULT (getdate()) FOR [DATACADASTRO]
GO
ALTER TABLE [dbo].[EmailRecebido] ADD  DEFAULT (getdate()) FOR [DataRecebimento]
GO
ALTER TABLE [dbo].[endereco] ADD  CONSTRAINT [DF__endereco__DataCa__33D4B598]  DEFAULT (getdate()) FOR [DataCadastro]
GO
ALTER TABLE [dbo].[endereco] ADD  DEFAULT ('SIM') FOR [Ativo]
GO
ALTER TABLE [dbo].[LogAcesso] ADD  DEFAULT (getdate()) FOR [DataLogin]
GO
ALTER TABLE [dbo].[Token_Compartilhado] ADD  DEFAULT ('N') FOR [Imprimiu]
GO
ALTER TABLE [dbo].[Token_Compartilhado] ADD  DEFAULT ('S') FOR [Ativo]
GO
ALTER TABLE [dbo].[Token_Compartilhado] ADD  DEFAULT ('N') FOR [Automatico]
GO
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [DF__usuario__ativo__1B0907CE]  DEFAULT ('0') FOR [ativo]
GO
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [DF__usuario__logado__1BFD2C07]  DEFAULT ('0') FOR [logado]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT ('N') FOR [parceiro]
GO
ALTER TABLE [dbo].[VeiculoManutencao] ADD  DEFAULT (getdate()) FOR [DataCadastro]
GO
ALTER TABLE [dbo].[Veiculos] ADD  DEFAULT (getdate()) FOR [DATACADASTRO]
GO
ALTER TABLE [dbo].[XML_IMPORTADA] ADD  DEFAULT (getdate()) FOR [DataEntrada]
GO
USE [master]
GO
ALTER DATABASE [Cadastro] SET  READ_WRITE 
GO
