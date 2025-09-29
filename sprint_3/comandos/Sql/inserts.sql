-- =================================================================
-- Inserção de Dados de Exemplo para a API Mottu
-- As chaves primárias (ID) são gerenciadas automaticamente (IDENTITY).
-- =================================================================

-- 1. PÁTIOS (PATIOS) - Total de 5 registros
-- A criação dos outros registros depende destes IDs.
INSERT INTO PATIOS (Nome, Endereco) VALUES (N'Pátio Central', N'Av. Brasil, 1000 - São Paulo'); -- ID 1
INSERT INTO PATIOS (Nome, Endereco) VALUES (N'Pátio Zona Leste', N'Rua Leste, 500 - São Paulo'); -- ID 2
INSERT INTO PATIOS (Nome, Endereco) VALUES (N'Pátio Sul', N'Av. do Sul, 200 - Porto Alegre'); -- ID 3
INSERT INTO PATIOS (Nome, Endereco) VALUES (N'Pátio Oeste', N'Rua da Lapa, 88 - Curitiba'); -- ID 4
INSERT INTO PATIOS (Nome, Endereco) VALUES (N'Pátio Rio', N'Av. Atlântica, 100 - Rio de Janeiro'); -- ID 5
GO

-- 2. RASTREADORES (CARRAPATOS) - Total de 10 registros
-- StatusBateria: 0=Baixa, 1=Media, 2=Alta
-- StatusDeUso: 0=Disponivel, 1=EmUso, 2=Manutencao
INSERT INTO CARRAPATOS (CodigoSerial, StatusBateria, StatusDeUso, IdPatio) VALUES (N'0000001', 2, 0, 1); -- ID 1 (Alta, Disponível, Pátio Central)
INSERT INTO CARRAPATOS (CodigoSerial, StatusBateria, StatusDeUso, IdPatio) VALUES (N'0000002', 2, 0, 2); -- ID 2 (Alta, Disponível, Pátio Zona Leste)
INSERT INTO CARRAPATOS (CodigoSerial, StatusBateria, StatusDeUso, IdPatio) VALUES (N'0000003', 2, 0, 1); -- ID 3 (Alta, Disponível, Pátio Central)
INSERT INTO CARRAPATOS (CodigoSerial, StatusBateria, StatusDeUso, IdPatio) VALUES (N'0000004', 2, 0, 3); -- ID 4 (Alta, Disponível, Pátio Sul)
INSERT INTO CARRAPATOS (CodigoSerial, StatusBateria, StatusDeUso, IdPatio) VALUES (N'0000005', 2, 0, 4); -- ID 5 (Alta, Disponível, Pátio Oeste)
INSERT INTO CARRAPATOS (CodigoSerial, StatusBateria, StatusDeUso, IdPatio) VALUES (N'0000006', 2, 0, 5); -- ID 6 (Alta, Disponível, Pátio Rio)
INSERT INTO CARRAPATOS (CodigoSerial, StatusBateria, StatusDeUso, IdPatio) VALUES (N'0000007', 2, 0, 1); -- ID 7 (Alta, Disponível, Pátio Central)
INSERT INTO CARRAPATOS (CodigoSerial, StatusBateria, StatusDeUso, IdPatio) VALUES (N'0000008', 2, 0, 2); -- ID 8 (Alta, Disponível, Pátio Zona Leste)
INSERT INTO CARRAPATOS (CodigoSerial, StatusBateria, StatusDeUso, IdPatio) VALUES (N'0000009', 2, 0, 3); -- ID 9 (Alta, Disponível, Pátio Sul)
INSERT INTO CARRAPATOS (CodigoSerial, StatusBateria, StatusDeUso, IdPatio) VALUES (N'0000010', 2, 0, 4); -- ID 10 (Alta, Disponível, Pátio Oeste)
GO

-- 3. MOTOS AUXILIARES (MOTOS_MOTTU) - Total de 10 registros
-- ID_MODELO: 1=SPORT, 2=E, 3=POP
INSERT INTO MOTOS_MOTTU (PLACA, CHASSI, ID_MODELO) VALUES (N'MOT1A23', N'9BWZZZ377VT000001', 3); -- POP
INSERT INTO MOTOS_MOTTU (PLACA, CHASSI, ID_MODELO) VALUES (N'MTT4B56', N'JS4B00000X1000002', 1); -- SPORT
INSERT INTO MOTOS_MOTTU (PLACA, CHASSI, ID_MODELO) VALUES (N'MOTT3C4', N'LWBV88888X3000003', 2); -- E
INSERT INTO MOTOS_MOTTU (PLACA, CHASSI, ID_MODELO) VALUES (N'MOTT6F7', N'TGBY01010A4000004', 1); -- SPORT
INSERT INTO MOTOS_MOTTU (PLACA, CHASSI, ID_MODELO) VALUES (N'MOTT9G0', N'ABXW11111B5000005', 3); -- POP
INSERT INTO MOTOS_MOTTU (PLACA, CHASSI, ID_MODELO) VALUES (N'MOTTA2B', N'CDYX22222C6000006', 2); -- E
INSERT INTO MOTOS_MOTTU (PLACA, CHASSI, ID_MODELO) VALUES (N'MOTTB5C', N'EFYZ33333D7000007', 3); -- POP
INSERT INTO MOTOS_MOTTU (PLACA, CHASSI, ID_MODELO) VALUES (N'MOTTF8H', N'GHIJ44444E8000008', 1); -- SPORT
INSERT INTO MOTOS_MOTTU (PLACA, CHASSI, ID_MODELO) VALUES (N'MOTTG1K', N'KLMN55555F9000009', 2); -- E
INSERT INTO MOTOS_MOTTU (PLACA, CHASSI, ID_MODELO) VALUES (N'MOTTH4L', N'OPQR66666G0000010', 3); -- POP
GO


-- 4. USUÁRIOS (USUARIOS) - Total de 5 registros
-- Todos os usuários devem estar vinculados a um pátio.
INSERT INTO USUARIOS (Email, Nome, Senha, DataCriacao, IdPatio) VALUES (N'joao@empresa.com', N'João Silva', N'Senha@123', GETDATE(), 1); -- Pátio Central
INSERT INTO USUARIOS (Email, Nome, Senha, DataCriacao, IdPatio) VALUES (N'maria.duda@empresa.com', N'Maria Eduarda', N'Mottu@2025', GETDATE(), 2); -- Pátio Zona Leste
INSERT INTO USUARIOS (Email, Nome, Senha, DataCriacao, IdPatio) VALUES (N'pedro.adm@empresa.com', N'Pedro Administrador', N'Admin#789', GETDATE(), 3); -- Pátio Sul
INSERT INTO USUARIOS (Email, Nome, Senha, DataCriacao, IdPatio) VALUES (N'ana.carolina@empresa.com', N'Ana Carolina', N'Senha@456', GETDATE(), 4); -- Pátio Oeste (Novo)
INSERT INTO USUARIOS (Email, Nome, Senha, DataCriacao, IdPatio) VALUES (N'ricardo.melo@empresa.com', N'Ricardo Melo', N'Melo#987', GETDATE(), 5); -- Pátio Rio (Novo)
GO
