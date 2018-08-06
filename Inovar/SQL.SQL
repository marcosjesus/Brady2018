SELECT * FROM NFE_NF_CAPA WHERE DOCNUM = '0000092747'
SELECT * FROM NFE_NF_ITEM WHERE DOCNUM = '0000092747' AND ORIG_MERC = 5

SELECT * FROM NFE_NF_IMPOSTO WHERE DOCNUM = '0000092747' AND COD_IMPOSTO = '01'

SELECT * FROM NFE_IMPOSTO

ORIGEM 3, 5  OU 8

SELECT COD_CLIFOR
      ,CNPJ
	  ,NUM_NF
	  ,COD_PRODUTO
	  ,ORIG_MERC
	  ,replace(B.QTD_COMERC,'.',',')
	  ,replace(B.VLR_BRUTO,'.',',')
FROM NFE_NF_CAPA A INNER JOIN NFE_NF_ITEM B ON ( A.DOCNUM = B.DOCNUM )
WHERE DT_EMISSAO BETWEEN '20160101 00:00:00.000' AND '20160131 23:59:59.997'

( Marcelo )

Mariana e Leandro


select 

---------------------------
Metropolis UI Application
---------------------------
Arquivo gerado com sucesso.

D:\Clientes\Brady\Projetos\Inovar\Win32\Debug\Inovar-20151100913443.XML
---------------------------
OK   
---------------------------



select TFIS_ITECOD, REPLACE(TFIS_ITEPARDED,'.',',') from AppSOP..VFIS_ParcelaDedutivel 
where TFIS_ITECOD = 'Y4151680'



---------------------------
Metropolis UI Application
---------------------------
Arquivo gerado com sucesso.

D:\Clientes\Brady\Projetos\Inovar\Win32\Debug\Inovar-20151200913443.XML
---------------------------
OK   
---------------------------
