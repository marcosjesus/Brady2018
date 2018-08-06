@ECHO ON

ECHO *** Inicializando Brady Data Import. Aguarde... ***

CALL "CielSapReadTable - MKT - Saldo Estoque.bat"

CALL BradyDataImport.exe -saldo_estoque

CALL BradyDataImport.exe -update_estoque

EXIT
