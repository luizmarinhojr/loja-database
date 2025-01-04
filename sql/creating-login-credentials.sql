-- Cria o usuario loja com a senha loja e remove a verificacao de politica de senha
CREATE LOGIN loja WITH PASSWORD = 'loja', CHECK_POLICY = OFF;

-- Garante permissão de administrador para o usuario loja
EXEC sp_addsrvrolemember @loginame='loja', @rolename='sysadmin';