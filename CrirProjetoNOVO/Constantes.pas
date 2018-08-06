unit Constantes;

interface

Const

   OPE_ESCAPE    = 0 ;
   OPE_INCLUSAO  = 1 ;
   OPE_ALTERACAO = 2 ;
   OPE_EXCLUSAO  = 3 ;
   OPE_CONSULTA  = 4 ;

   TAG_FIELD = -1 ;
   TAG_KEY   = -2 ;

   // Tipos
   TYPE_STRING  = 1 ;
   TYPE_INTEGER = 2 ;
   TYPE_FLOAT   = 3 ;

   PAGREC_STATUS_ABERTO       = 'A' ;
   PAGREC_STATUS_CANCELADO    = 'C' ;
   PAGREC_STATUS_RECEBIDO     = 'R' ;
   PAGREC_STATUS_PAGO         = 'P' ;

   // Movimentacao bancaria
   MV_TIPO_CREDITO   = 'C' ;
   MV_TIPO_DEBITO    = 'D' ;
   MV_TIPO_CANCELADO = 'X' ;
   MV_INSMOV_NAO     = False ;
   MV_INSMOV_SIM     = True ;

   // Status dos lancamentos contabeis
   LC_STATUS_ABERTO = 'A' ;
   LC_STATUS_ENCERRADO = 'E' ;

   // Tipo de contas para fechamento
   FECHA_BANCO  = 'B' ;
   FECHA_CONTAB = 'C' ;

   // Tipos de movimentos de clientes
   MOVCLI_COMPRA  = 'C' ;
   MOVCLI_VENDA   = 'V' ;
   MOVCLI_TRANSFA = 'T' ;
   MOVCLI_TRANSFB = 't' ;
   MOVCLI_DELCOM  = 'c' ;
   MOVCLI_DELVEN  = 'v' ;
   MOVCLI_ALTCOM  = 'O' ;
   MOVCLI_ALTVEN  = 'E' ;
   MOVCLI_PEND    = 'P' ;
   MOVCLI_CONPAG  = 'p' ;
   MOVCLI_CONREC  = 'r' ;
   MOVCLI_EXCLUI  = 'e' ;
   MOVCLI_ALTPEND = 'D' ;
   MOVCLI_BORDERO = 'B' ;

   // Tipos de Operacoes (OpeID )
   OPEID_TRANSF = -1 ;
   OPEID_PENDBR = -2 ;
   OPEID_TRANSFCON = -3 ;

   // Tipos de pendências
   PEND_PLANILHA  = 'P' ;
   PEND_FACTORING = 'F' ;
   PEND_INS       = 'I' ;
   PEND_TRANSF    = 'T' ;
   PEND_MOV       = 'M' ;
   PEND_CONPAG    = 'P' ;
   PEND_CONREC    = 'R' ;
   PEND_CPCRCANC  = 'c' ;
   PEND_DEL       = 'D' ;
   PEND_B         = 'b' ;
   PEND_QUITFAC   = 'Q' ;

   // Status dos borderos
   BORD_LIQUIDADO  = 'L' ;
   BORD_PRORROGADO = 'P' ;
   BORD_ANTECIPADO = 'A' ;
   BORD_BRASIL     = 'R' ;
   BORD_DOLAR      = 'D' ;
   BORD_EMPRESTIMO = 'E' ;
   BORD_CUSTODIA   = 'C' ;

   BORDDOC_ABERTO    = 'A' ;
   BORDDOC_LIQUIDADO = 'L' ;
   BORDDOC_PENDENTE  = 'P' ;

   // -- Erros do SQLTableFun
   ERRO_OK           = 0 ;
   ERRO_KEYVIOLATION = 2601 ;
   ERRO_REC_MODIFIED = 2 ;
   ERRO_CONSTRAINT   = 547 ;
   ERRO_NULL_VALUES  = 515 ;
   ERRO_COMMIT       = -1 ;
   
implementation

end.
