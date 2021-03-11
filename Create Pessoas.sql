USE [Meu_Banco]
GO

/****** Object:  Table [dbo].[PESSOAS]    Script Date: 10/03/2021 23:39:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PESSOAS](
	[NUMERO_U] [int] IDENTITY(1,1) NOT NULL,
	[SIT] [int] NOT NULL,
	[NOME] [varchar](200) NULL,
	[CPF] [varchar](20) NULL,
	[RG] [varchar](20) NULL,
	[FONE1] [varchar](20) NULL,
	[BAIRRO] [varchar](200) NULL,
	[CIDADE] [varchar](200) NULL,
	[FONE2] [varchar](20) NULL,
	[EMAIL] [varchar](200) NULL,
	[CEP] [varchar](20) NULL,
	[LOGRADOURO] [varchar](2000) NULL,
	[NUMERO] [int] NULL,
	[TIPO_P] [int] NOT NULL,
	[DATA_NASC] [date] NULL,
	[DATA_CAD] [date] NULL,
	[SEXO] [varchar](20) NULL,
	[ESTADO] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NUMERO_U] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PESSOAS]  WITH CHECK ADD  CONSTRAINT [FK_SIT] FOREIGN KEY([SIT])
REFERENCES [dbo].[SITP] ([SITPCD])
GO

ALTER TABLE [dbo].[PESSOAS] CHECK CONSTRAINT [FK_SIT]
GO

ALTER TABLE [dbo].[PESSOAS]  WITH CHECK ADD  CONSTRAINT [FK_TPP] FOREIGN KEY([TIPO_P])
REFERENCES [dbo].[TPP] ([TPPCD])
GO

ALTER TABLE [dbo].[PESSOAS] CHECK CONSTRAINT [FK_TPP]
GO

CREATE   TRIGGER [dbo].[TRG_PESSOAS_INSE]
   ON  [dbo].[PESSOAS] 
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	
	DECLARE
	@CODIGO INTEGER,
    @DATA_CAD  DATETIME

    SELECT @CODIGO = NUMERO_U, @DATA_CAD = DATA_CAD FROM INSERTED

	IF (@DATA_CAD IS NULL) 
    UPDATE PESSOAS SET DATA_CAD = GETDATE()
    WHERE NUMERO_U = @CODIGO;
 

END
GO


insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(1,'Roberto Hugo Anthony Cavalcanti','600.573.218-84','12.855.685-7','(82) 3528-6626','Tabuleiro do Martins','Maceió','(82) 99346-5825','robertohugoanthonycavalcanti..robertohugoanthonycavalcanti@fictor.com.br','57081-576','Rua Maria dos Santos',725,1,'13/08/2003','23/02/2015','Masculino','AL');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(1,'Gabriel Thomas Paulo Jesus','591.957.872-67','43.534.511-4','(51) 3697-5436','Centro','Alto Feliz','(51) 98647-1163','ggabrielthomaspaulojesus@maptec.com.br','95773-970','Avenida A. J. Renner 209',566,2,'26/02/1970','23/02/1985','Masculino','RS');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(1,'Thales Marcelo Almeida','439.250.890-04','16.172.293-3','(83) 2754-4615','João Américo de Almeida','João Pessoa','(83) 98789-1688','thalesmarceloalmeida-84@goldfinger.com.br','58074-635','Rua José Carlos da Silva',984,3,'18/12/1967','01/04/1970','Masculino','PB');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(3,'Betina Silvana Viana','550.342.021-74','19.655.398-2','(62) 2770-7392','Jardim Monte Sinai','Aparecida de Goiânia','(62) 98809-3205','betinasilvanaviana__betinasilvanaviana@mls.com.br','74971-510','Avenida Clarismar Batista',313,3,'04/05/1973','27/05/1975','Feminino','GO');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(2,'Lara Luana Joana','140.083.038-98','36.426.460-3','(86) 2762-5060','Memorare','Teresina','(86) 99300-9875','laraluanajoanaassuncao-70','64008-270','Rua Santar',888,2,'18/09/1981','13/09/1994','Feminino','PI');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(3,'Renata Priscila Lopes','281.380.166-63','49.433.741-2','(96) 3539-1066','Central','Macapá','(96) 98357-4697','rrenatapriscilalopes@said.adv.br','68900-115','Avenida Henrique Galvão',412,1,'18/07/1990','27/05/1997','Feminino','AP');


insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(3,'Nina Renata Antonella Porto','446.921.528-77','36.021.038-7','(62) 2837-8865','Jardim Olímpico','Aparecida de Goiânia','(62) 98921-1666','ninarenataantonellaporto__ninarenataantonellaporto@vetech.vet.br','74922-175','Praça Concórdia',725,1,'24/07/1987','13/03/2000','Feminino','GO');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(2,'Isadora Heloisa Fernandes','283.505.161-94','30.183.965-7','(22) 2655-2311','Riviera Fluminense','Macapá','(22) 99424-9014','isadoraheloisasoniafernandes..isadoraheloisasoniafernandes@aliancacadeiras.com.br','27937-120','Rua Padre Guilherme de Castro',393,1,'18/02/1967','04/12/1970','Feminino','RIO DE JANEIRO');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(2,'Sabrina Ayla da Rosa','496.646.750-08','23.019.352-3','(85) 3815-1766','Padre Andrade','Fortaleza','(85) 98113-0254','sabrinaayladarosa__sabrinaayladarosa@lynce.com.br','60356-392','Avenida Sargento Herma­no Sampaio',980,2,'22/05/1943','25/12/1950','Feminino','CE');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(1,'Laís Almeida','352.593.757-18','26.183.863-5','TIA (85) 2545-4483','Jangurussu','Fortaleza','MÃE (85) 98479-5931','laissoniaalmeida_@zaniniengenharia.com.br','60877-055','Rua Zildete da Costa',686,3,'08/04/1975','29/11/2004','Feminino','CE');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(1,'Flávia Mariane Peixoto','302.198.139-90','23.201.077-8','(96) 3667-6909','Jardim Marco Zero','Macapá','(96) 98930-3412','fflaviamarianepeixoto@vemter.com.br','68903-361','Avenida Equatorial',842,2,'03/10/1979','07/07/2007','Feminino','AP');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(2,'Henry Rodrigues','760.174.586-47EEE','49.345.937-6','(67) 2677-7853','Residencial Villa Lobos','Campo Grande','(67) 99269-4777','henryjoaorodrigues_@abrangenciacorretora.com.br','79095-375','Rua Osvaldo G Junior',981,2,'03/05/1985','04/07/2006','Masculino','MS');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(1,'Aurora Isis Carolina Oliveira','066.761.538-58','23.423.429-5','(61) 2868-6318','Asa Sul','Brasí­lia','(61) 98370-1218','auroraisiscarolinaoliveira..auroraisiscarolinaoliveira@solviagens.com','70380-705','Quadra SHIGS 713 Bloco E',601,3,'06/02/1998','06/09/1999','Feminino','DF');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(2,'Daiane Mariah Ester Moura','004.805.014-83','12.579.739-4','(21) 2565-7528','Parque Guandu','Japeri','(21) 98573-2842','daianemariahestermoura_@atiara.com.br','26425-330','Travessa Sheila',503,3,'13/03/1983','12/04/1993','Feminino','RJ');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(1,'Bárbara Luiza Aragão','296.039.882-35','12.550.072-5','(61) 3749-4858','Mont Serrat Paiva','Novo Gama','(61) 98978-7807','barbaracecilialuizaaragao_@academiahct.com.br','72863-306','Quadra Quadra 6',953,3,'05/08/1984','03/01/2018','Feminino','GO');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(3,'Diego Igor Sebastião da Luz','224.901.819-71','25.187.005-4','(96) 3720-7460','Marabaixo','Macapá','(96) 99319-2040','diegoigorsebastiaodaluz..diegoigorsebastiaodaluz@fiorecomunicacao.com.br','68909-848','Avenida Décima Primeira',211,1,'26/09/1941','12/01/1960','Masculino','AP');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(3,'André Julio Ramos','493.323.829-48','31.604.969-4','(85) 2852-7345','Jangurussu','Fortaleza','(85) 98583-5082','andrejulioramos-76','60870-540','Rua Itagua',121,1,'27/05/1997','13/01/2002','Masculino','CE');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(2,'João Thiago da Rocha','421.871.603-00','46.361.953-5','(84) 3568-0072','Centro','Mossoró','(84) 98723-1968','josethiagodarocha-77@sestito.com.br','59610-080','Rua Doutor Mario Negócio',871,3,'14/04/1942','01/01/2001','Masculino','RN');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(1,'Igor Hugo Nogueira','329.550.529-22','38.454.039-9','(62) 3708-2529','Setor Fabrí­cio','Aparecida de Goiânia','(62) 99466-2170','igorhugonogueira_@dcazzainteriores.com.br','74969-317','Rua Diamante',497,2,'23/07/1953','10/07/1994','Masculino','GO');

insert into PESSOAS ( SIT, NOME, CPF, RG, FONE1,BAIRRO, CIDADE, FONE2, EMAIL, CEP, LOGRADOURO,  NUMERO, TIPO_P, DATA_NASC, DATA_CAD, SEXO, ESTADO)
VALUES(1,'Enrico Miguel Cavalcanti','427.099.169-08','41.396.973-3','(54) 2635-7259','Santa Marta','Passo Fundo','(54) 98609-1443','enricomiguelcavalcanti__enricomiguelcavalcanti@aircominternational.com','99036-493','Travessa Celeste Souza dos Santos',589,1,'25/02/2002','02/09/1993','Masculino','RIO GRANDE DO SUL');


