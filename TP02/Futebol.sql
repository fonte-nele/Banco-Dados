CREATE TABLE Localidade (
	Ident	INT 			NOT NULL,
	Rua 	VARCHAR(100)	NOT NULL,
	Numero 	INT 			NOT NULL,
	CEP 	INT 			NOT NULL,
	Cidade 	VARCHAR(30) 	NOT NULL,
	Estado 	VARCHAR(30) 	NOT NULL,
	CONSTRAINT PK_Localidade PRIMARY KEY (Ident)
);

CREATE TABLE Estadio (
	Nome 			VARCHAR(100)	NOT NULL,
	Capacidade 		INT 			NOT NULL,
	Numero 			INT 			NOT NULL,
	IdLocalidade 	INT 			NOT NULL,
	CONSTRAINT PK_Estadio PRIMARY KEY (Nome)
);

CREATE TABLE Times (
	Nome 			VARCHAR(100) 	NOT NULL,
	Nome_estadio 	VARCHAR(100)	NOT NULL,
	Data_fund 		DATE 			NOT NULL,
	IdLocalidade 	INT 			NOT NULL,
	CONSTRAINT PK_Times PRIMARY KEY (Nome)
);

CREATE TABLE Titulos (
	Titulo 		VARCHAR(100) NOT NULL,
	Nome_time 	VARCHAR(100) NOT NULL,
	CONSTRAINT PK_Titulos PRIMARY KEY (Titulo, Nome_time)
);

CREATE TABLE Pessoa (
	CPF 			VARCHAR(15) NOT NULL,
	Primeiro_nome 	VARCHAR(50) NOT NULL,
	Ultimo_nome 	VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Pessoa PRIMARY KEY (CPF)
);

CREATE TABLE Treinador (
	CPF_pessoaT 	VARCHAR(15) NOT NULL,
	Tempo_carreira 	INT 		NOT NULL,
	CONSTRAINT PK_Treinador PRIMARY KEY (CPF_pessoaT)
);

CREATE TABLE Jogador (
	CPF_pessoaJ 		VARCHAR(15) NOT NULL,
	Posicao_original 	VARCHAR(30) NOT NULL,
	Inicio_contrato 	DATE 		NOT NULL,
	Fim_contrato 		DATE 		NOT NULL,
	Gols 				INT 		NOT NULL,
 	Assistencias 		INT 		NOT NULL,
 	Num_camisa 			INT 		NOT NULL,
	Nome_time 			VARCHAR(100) NOT NULL,
	CONSTRAINT PK_Jogador PRIMARY KEY (CPF_pessoaJ)
);

CREATE TABLE Arbitro (
	CPF_pessoaAr 	VARCHAR(15) NOT NULL,
	Federacao 		VARCHAR(10) NOT NULL,
	CONSTRAINT PK_Arbitro PRIMARY KEY (CPF_pessoaAr)
);

CREATE TABLE Principal (
	CPF_pessoaP 	VARCHAR(15) NOT NULL,
	Media_faltas 	DECIMAL(3,2),
	CONSTRAINT PK_Principal PRIMARY KEY (CPF_pessoaP)
);

CREATE TABLE Auxiliar (
	CPF_pessoaAr 		VARCHAR(15) NOT NULL,
	Media_impedimentos 	DECIMAL(3,2),
	CONSTRAINT PK_Auxiliar PRIMARY KEY (CPF_pessoaAr)
);

CREATE TABLE Partida (
	Id 				VARCHAR(10)  NOT NULL,
	Data 			DATE 		 NOT NULL,
 	Publico 		INT 		 NOT NULL,
 	Renda 			DECIMAL(8,2) NOT NULL,
 	Nome_estadio 	VARCHAR(100) NOT NULL,
 	Nome_mandante 	VARCHAR(100) NOT NULL,
 	Nome_visitante 	VARCHAR(100) NOT NULL,
 	CPF_principal 	VARCHAR(15)  NOT NULL,
	CONSTRAINT PK_Partida PRIMARY KEY (Id)
);

CREATE TABLE Treina (
	CPF_treinador 		VARCHAR(15) 	NOT NULL,
	Nome_time 			VARCHAR(100) 	NOT NULL,
 	Inicio_contrato 	DATE 			NOT NULL,
 	Fim_contrato 		DATE 			NOT NULL,
	CONSTRAINT PK_Treina PRIMARY KEY (CPF_treinador, Nome_time)
);

CREATE TABLE Comanda (
	CPF_treinador	VARCHAR(15) NOT NULL,
	Id_partida 		VARCHAR(10) NOT NULL,
	CONSTRAINT PK_Comanda PRIMARY KEY (CPF_treinador, Id_partida)
);

CREATE TABLE Auxilia (
	CPF_auxiliar 	VARCHAR(15) NOT NULL,
	Id_partida 		VARCHAR(10) NOT NULL,
	CONSTRAINT PK_Auxilia PRIMARY KEY (CPF_auxiliar, Id_partida)
);

CREATE TABLE Joga (
	CPF_jogador 	VARCHAR(15) NOT NULL,
	Id_partida 		VARCHAR(10) NOT NULL,
 	Gols 			INT 		NOT NULL,
 	Num_faltas 		INT 		NOT NULL,
 	Cart_vermelho 	INT 		NOT NULL,
 	Cart_amarelo 	INT 		NOT NULL,
	CONSTRAINT PK_Joga PRIMARY KEY (CPF_jogador, Id_partida)
);

INSERT INTO Localidade
VALUES ('1', 'Rua José Vasconcelos', '120', '35400000', 'Ouro Preto','Minas Gerais');

INSERT INTO Localidade
VALUES ('2', 'Rua Augusto Lime', '10', '30190000', 'Belo Horizonte','Minas Gerais');

INSERT INTO Localidade
VALUES ('3', 'Av. Antônio Abrahão Caran', '1001', '31275000', 'Belo Horizonte', 'Minas Gerais');

INSERT INTO Localidade
VALUES ('4', 'Av. Pres. Castelo Branco', '130', '20271130', 'Rio de Janeiro','Rio de Janeiro');

INSERT INTO Localidade
VALUES ('5', 'R. Carlos Lacerda', '1371', '31545170', 'Belo Horizonte','Minas Gerais');

INSERT INTO Localidade
VALUES ('6', 'Av. Borges de Medeiros', '997', '22470001', 'Rio de Janeiro','Rio de Janeiro');

INSERT INTO Estadio
VALUES ('Mineirão', '100000', '1', '3');

INSERT INTO Estadio
VALUES ('Maracanã', '100000', '2', '4');

INSERT INTO Times
VALUES ('Cruzeiro', 'Mineirão', '02/01/1921', '5');

INSERT INTO Times
VALUES ('Flamengo', 'Maracanã', '15/11/1895', '6');

INSERT INTO Titulos
VALUES ('Campeonato Brasileiro', 'Cruzeiro');

INSERT INTO Titulos
VALUES ('Libertadores da América', 'Cruzeiro');

INSERT INTO Titulos
VALUES ('Campeonato Brasileiro', 'Flamengo');

INSERT INTO Titulos
VALUES ('Taça Guanabara', 'Flamengo');

INSERT INTO Pessoa
VALUES ('120.300.499-80', 'João', 'Carlos');

INSERT INTO Pessoa
VALUES ('002.300.499-80', 'Lucas', 'Silva');

INSERT INTO Pessoa
VALUES ('421.300.499-80', 'Everton', 'Ribeiro');

INSERT INTO Pessoa
VALUES ('611.100.499-80', 'Ramon', 'Ábila');

INSERT INTO Pessoa
VALUES ('234.542.167-08', 'Marcelo', 'Ramos');

INSERT INTO Pessoa
VALUES ('114.004.998-06', 'Kapadu', 'Gonçalves');

INSERT INTO Pessoa
VALUES ('441.323.412-26', 'Rafael', 'Lage');

INSERT INTO Pessoa
VALUES ('522.113.412-26', 'Léo', 'Martins');

INSERT INTO Pessoa
VALUES ('513.323.412-26', 'Ezequiel', 'Lage');

INSERT INTO Pessoa
VALUES ('142.312.312-26', 'Alex', 'Martins');

INSERT INTO Pessoa
VALUES ('124.327.712-26', 'Diego', 'Santos');

INSERT INTO Pessoa
VALUES ('982.323.412-26', 'Diogo', 'Nogueira');

INSERT INTO Pessoa
VALUES ('876.323.412-26', 'Fernando', 'Ferreira');

INSERT INTO Pessoa
VALUES ('987.323.412-26', 'Caio', 'Junior');

INSERT INTO Pessoa
VALUES ('688.323.412-26', 'Mateus', 'Ferreira');

INSERT INTO Pessoa
VALUES ('978.323.412-26', 'João', 'Moura');

INSERT INTO Pessoa
VALUES ('689.823.412-26', 'Luiz', 'Henrique');

INSERT INTO Pessoa
VALUES ('897.523.412-26', 'Felipe', 'Fontenele');

INSERT INTO Pessoa
VALUES ('875.423.412-26', 'Pikachu', 'Neves');

INSERT INTO Pessoa
VALUES ('652.223.412-26', 'Manoel', 'José');

INSERT INTO Pessoa
VALUES ('786.423.412-26', 'Joaquim', 'Almeida');

INSERT INTO Pessoa
VALUES ('236.458.864-32', 'Neymar', 'Jr');

INSERT INTO Pessoa
VALUES ('250.320.298-01', 'Mano', 'Menezes');

INSERT INTO Pessoa
VALUES ('111.110.292-41', 'Zé', 'Ricardo');

INSERT INTO Pessoa
VALUES ('445.123.151-42', 'Arnaldo', 'César');

INSERT INTO Pessoa
VALUES ('123.151.323-42', 'Bruno', 'Viana');

INSERT INTO Pessoa
VALUES ('551.121.292-42', 'Gabriel', 'Ferreira');

INSERT INTO Pessoa
VALUES ('251.112.454-33', 'Carlos', 'Ferrer');

INSERT INTO Pessoa
VALUES ('523.141.235-31', 'Galvani', 'José');

INSERT INTO Pessoa
VALUES ('551.121.292-14', 'Humberto', 'Greed');

INSERT INTO Treinador
VALUES ('111.110.292-41', '10');

INSERT INTO Treinador
VALUES ('250.320.298-01', '31');

INSERT INTO Jogador
VALUES ('120.300.499-80', 'Volante', '2017-01-01', '2019-01-01', '3', '5', '17', 'Flamengo');

INSERT INTO Jogador
VALUES ('002.300.499-80', 'Volante', '2017-01-01', '2019-01-01', '4', '20', '8', 'Cruzeiro');

INSERT INTO Jogador
VALUES ('421.300.499-80', 'Meio-Campo', '2016-01-01', '2018-01-01', '20', '25', '10', 'Flamengo');

INSERT INTO Jogador
VALUES ('611.100.499-80', 'Atacante', '2017-01-01', '2020-01-01', '15', '23', '9', 'Cruzeiro');

INSERT INTO Jogador
VALUES ('234.542.167-08', 'Atacante', '2016-01-01', '2018-01-01', '100', '22', '10', 'Cruzeiro');

INSERT INTO Jogador
VALUES ('114.004.998-06', 'Atacante', '2017-01-01', '2022-01-01', '1000', '300', '9', 'Flamengo');

INSERT INTO Jogador
VALUES ('441.323.412-26', 'Meio-campo', '2016-01-01','2020-01-01', '10', '23', '6', 'Cruzeiro');

INSERT INTO Jogador
VALUES ('522.113.412-26', 'Volante', '2017-01-01', '2019-01-01', '13', '30', '4', 'Flamengo');

INSERT INTO Jogador
VALUES ('513.323.412-26', 'Lateral', '2015-01-01', '2019-01-01', '5', '21', '3', 'Cruzeiro');

INSERT INTO Jogador
VALUES ('142.312.312-26', 'Zagueiro', '2016-01-01', '2019-01-01', '3', '10', '2', 'Flamengo');

INSERT INTO Jogador
VALUES ('124.327.712-26', 'Lateral', '2017-01-01', '2020-01-01', '1', '13', '5', 'Cruzeiro');

INSERT INTO Jogador
VALUES ('982.323.412-26', 'Goleiro', '2017-01-01', '2019-01-01', '0', '0', '10', 'Flamengo');

INSERT INTO Jogador
VALUES ('876.323.412-26', 'Goleiro', '2016-01-01', '2020-01-01', '0', '0', '3', 'Cruzeiro');

INSERT INTO Jogador
VALUES ('987.323.412-26', 'Lateral', '2017-01-01', '2020-01-01', '1', '2', '6', 'Flamengo');

INSERT INTO Jogador
VALUES ('688.323.412-26', 'Zagueiro', '2017-01-01', '2019-01-01', '10', '1', '3', 'Cruzeiro');

INSERT INTO Jogador
VALUES ('978.323.412-26', 'Lateral', '2016-01-01', '2019-01-01', '20', '10', '6', 'Flamengo');

INSERT INTO Jogador
VALUES ('689.823.412-26', 'Zagueiro', '2017-01-01', '2019-01-01', '18', '9', '5', 'Cruzeiro');

INSERT INTO Jogador
VALUES ('897.523.412-26', 'Zagueiro', '2015-01-01', '2019-01-01', '4', '7', '2', 'Flamengo');

INSERT INTO Jogador
VALUES ('875.423.412-26', 'Volante', '2017-01-01', '2018-01-01', '6', '8', '2', 'Cruzeiro');

INSERT INTO Jogador
VALUES ('652.223.412-26', 'Atacante', '2016-01-01', '2020-01-01', '50', '23', '21', 'Flamengo');

INSERT INTO Jogador
VALUES ('786.423.412-26', 'Meio-Campo', '2017-01-01', '2019-01-01', '40', '23', '2', 'Cruzeiro');

INSERT INTO Jogador
VALUES ('236.458.864-32', 'Meio-Campo', '2017-01-01', '2018-01-01', '300', '22', '2', 'Flamengo');

INSERT INTO Arbitro
VALUES ('445.123.151-42', 'CBF');

INSERT INTO Arbitro
VALUES ('123.151.323-42', 'CBF');

INSERT INTO Arbitro
VALUES ('551.121.292-42', 'FIFA');

INSERT INTO Arbitro
VALUES ('251.112.454-33', 'FIFA');

INSERT INTO Arbitro
VALUES ('523.141.235-31', 'CBF');

INSERT INTO Arbitro
VALUES ('551.121.292-14', 'FIFA');

INSERT INTO Principal
VALUES ('445.123.151-42', '2.2');

INSERT INTO Auxiliar
VALUES ('123.151.323-42', '1.2');

INSERT INTO Auxiliar
VALUES ('551.121.292-42', '3.3');

INSERT INTO Auxiliar
VALUES ('251.112.454-33', '1.5');

INSERT INTO Auxiliar
VALUES ('523.141.235-31', '2.2');

INSERT INTO Auxiliar
VALUES ('551.121.292-14', '1.4');

INSERT INTO Partida
VALUES ('1112223334', '2017-11-03', '50000', '130020', 'Mineirão', 'Cruzeiro', 'Flamengo', '445.123.151-42');

INSERT INTO Treina
VALUES ('111.110.292-41', 'Flamengo', '2016-12-01', '2018-12-01');

INSERT INTO Treina
VALUES ('250.320.298-01', 'Cruzeiro', '2016-12-01', '2018-12-01');

INSERT INTO Comanda
VALUES ('111.110.292-41', '1112223334');

INSERT INTO Comanda
VALUES ('250.320.298-01', '1112223334');

INSERT INTO Auxilia
VALUES ('123.151.323-42', '1112223334');

INSERT INTO Auxilia
VALUES ('551.121.292-42', '1112223334');

INSERT INTO Auxilia
VALUES ('251.112.454-33', '1112223334');

INSERT INTO Auxilia
VALUES ('523.141.235-31', '1112223334');

INSERT INTO Auxilia
VALUES ('551.121.292-14', '1112223334');

INSERT INTO Joga
VALUES ('120.300.499-80', '1112223334', '0', '0', '0', '0');

INSERT INTO Joga
VALUES ('002.300.499-80', '1112223334', '0', '0', '0', '0');

INSERT INTO Joga
VALUES ('421.300.499-80', '1112223334', '0', '0', '0', '0');

INSERT INTO Joga
VALUES ('611.100.499-80', '1112223334', '0', '2', '0', '0');

INSERT INTO Joga
VALUES ('234.542.167-08', '1112223334', '0', '0', '0', '0');

INSERT INTO Joga
VALUES ('114.004.998-06', '1112223334', '0', '2', '0', '0');

INSERT INTO Joga
VALUES ('441.323.412-26', '1112223334', '0', '3', '0', '1');

INSERT INTO Joga
VALUES ('522.113.412-26', '1112223334', '0', '0', '0', '0');

INSERT INTO Joga
VALUES ('513.323.412-26', '1112223334', '0', '0', '0', '0');

INSERT INTO Joga
VALUES ('142.312.312-26', '1112223334', '0', '0', '0', '0');

INSERT INTO Joga
VALUES ('124.327.712-26', '1112223334', '0', '0', '0', '0');

INSERT INTO Joga
VALUES ('982.323.412-26', '1112223334', '0', '4', '1', '2');

INSERT INTO Joga
VALUES ('876.323.412-26', '1112223334', '0', '3', '0', '1');

INSERT INTO Joga
VALUES ('987.323.412-26', '1112223334', '0', '2', '1', '0');

INSERT INTO Joga
VALUES ('688.323.412-26', '1112223334', '0', '0', '0', '0');

INSERT INTO Joga
VALUES ('978.323.412-26', '1112223334', '0', '0', '0', '0');

INSERT INTO Joga
VALUES ('689.823.412-26', '1112223334', '0', '0', '0', '0');

INSERT INTO Joga
VALUES ('897.523.412-26', '1112223334', '0', '2', '0', '0');

INSERT INTO Joga
VALUES ('875.423.412-26', '1112223334', '0', '4', '0', '1');

INSERT INTO Joga
VALUES ('652.223.412-26', '1112223334', '0', '2', '0', '0');

INSERT INTO Joga
VALUES ('786.423.412-26', '1112223334', '0', '1', '0', '0');

INSERT INTO Joga
VALUES ('236.458.864-32', '1112223334', '0', '0', '0', '0');

ALTER TABLE Estadio 
ADD CONSTRAINT FK_Estadio FOREIGN KEY (IdLocalidade) REFERENCES Localidade(Ident);

ALTER TABLE Times 
ADD CONSTRAINT FK_TimesLocal FOREIGN KEY (IdLocalidade) REFERENCES Localidade(Ident);

ALTER TABLE Times
ADD CONSTRAINT FK_TimesEstadio FOREIGN KEY (nome_estadio) REFERENCES Estadio(nome);

ALTER TABLE Titulos 
ADD CONSTRAINT FK_Times FOREIGN KEY (nome_time) REFERENCES Times(nome) ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE Treinador 
ADD CONSTRAINT FK_Treinador FOREIGN KEY (CPF_pessoaT) REFERENCES Pessoa(CPF) ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE Jogador 
ADD CONSTRAINT FK_Jogador FOREIGN KEY (CPF_pessoaJ) REFERENCES Pessoa(CPF) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Jogador 
ADD CONSTRAINT FK_JogadorTime FOREIGN KEY (nome_time) REFERENCES Times(nome) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Arbitro
ADD CONSTRAINT FK_Arbitro FOREIGN KEY (CPF_PessoaAr) REFERENCES Pessoa(CPF) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Principal 
ADD CONSTRAINT FK_Principal FOREIGN KEY (CPF_PessoaP) REFERENCES Arbitro(CPF_PessoaAr) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Auxiliar 
ADD CONSTRAINT FK_Auxiliar FOREIGN KEY (CPF_PessoaAr) REFERENCES Arbitro(CPF_PessoaAr) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Partida 
ADD CONSTRAINT FK_PartidaNome FOREIGN KEY (nome_estadio) REFERENCES Estadio(nome);

ALTER TABLE Partida 
ADD CONSTRAINT FK_PartidaMandante FOREIGN KEY (nome_mandante) REFERENCES Times(nome);

ALTER TABLE Partida 
ADD CONSTRAINT FK_PartidaVisitante FOREIGN KEY (nome_visitante) REFERENCES Times(nome);

ALTER TABLE Partida 
ADD CONSTRAINT FK_Partida FOREIGN KEY (CPF_principal) REFERENCES Principal(CPF_PessoaP) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Treina 
ADD CONSTRAINT FK_TreinaTreinador FOREIGN KEY (CPF_treinador) REFERENCES Treinador(CPF_PessoaT) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Treina 
ADD CONSTRAINT FK_TreinaTime FOREIGN KEY (nome_time) REFERENCES Times(nome) ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE Comanda 
ADD CONSTRAINT FK_ComandaAux FOREIGN KEY (CPF_treinador) REFERENCES Treinador(CPF_pessoaT) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Comanda 
ADD CONSTRAINT FK_Comanda FOREIGN KEY (Id_partida) REFERENCES Partida(Id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Auxilia 
ADD CONSTRAINT FK_Auxilia FOREIGN KEY (CPF_auxiliar) REFERENCES Auxiliar(CPF_PessoaAr) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Auxilia 
ADD CONSTRAINT FK_Auxilia2 FOREIGN KEY (Id_partida) REFERENCES Partida(Id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Joga 
ADD CONSTRAINT FK_Joga FOREIGN KEY (CPF_jogador) REFERENCES Jogador(CPF_PessoaJ) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Joga 
ADD CONSTRAINT FK_Joga2 FOREIGN KEY (Id_partida) REFERENCES Partida(Id) ON UPDATE CASCADE ON DELETE CASCADE;