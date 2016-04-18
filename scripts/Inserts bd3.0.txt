#Table CLIENTE

Insert into cliente values(0,"Arthur","Oliveira","32721489620","Artur_1@gmail.com","M","1994-06-11","13311032","SJCampos","SP","11993186668");
Insert into cliente values(0,"Juan","Carlos","02154789610","Juan_2@hotmail.com","M","1994-09-04","154255001","Jacarei","SP","11984089306");
Insert into cliente values(0,"Melissa","Valentina","21458796210","Melissa_3@outlook.com","F","1994-11-24","124225101","São Paulo","RJ","11991909664");
Insert into cliente values(0,"Luiz","Marcelo","02145879650","Luiz_4@gmail.com","M","1994-09-19","12211005","Caçapava","SP","11992409164");


#Table CARGO

Insert into CARGO values(0,"Faxineiro","1000");
Insert into CARGO values(0,"Auxiliar","3000");
Insert into CARGO values(0,"Atendente","4000");
Insert into CARGO values(0,"Gerente","5000");


#Table FUNCIONARIO

Insert into funcionario values(0,"1","Yuri Henrique","Filipine","1980-01-03","12255004","32485163021","2016-05-04","M","1239170542","Yuri_real@gmail.com","SP","SJCampos");
Insert into FUNCIONARIO values(0,"2","Gabriel Augusto","Prado Antunes","1992-07-29","12233002","32755482010","2016-04-01","M","1239172045","Augusto_1@gmail.com","SP","SJCampos");
Insert into FUNCIONARIO values(0,"4","Marcos Reis","Moreno","1991-04-07","12501005","35795102010","2016-01-02","M","1299140057","Marcos_2@gmail.com","SP","Jacarei");
Insert into FUNCIONARIO values(0,"3","Gabriel Bacarin","Marcondes","1990-10-11","11152001","36925814720","2015-09-20","M","12392454","Gabriel_3@gmail.com","SP","Caçapava");


#Table MOTORISTA

Insert into MOTORISTA values(0,"1","159357","122865","25413792","2018-10-20","Poupa Tempo SP","2016-01-01");
Insert into MOTORISTA values(0,"2","357951","9010235","1475365","2019-02-01","Poupa Tempo SP","2016-03-01");
Insert into MOTORISTA values(0,"3","214578","102529","0251481","2019-09-10","Poupa Tempo RJ","2016-02-13");
Insert into MOTORISTA values(0,"4","369174","383940","0123672","2016-10-11","Poupa Tempo MG","2016-01-08");


#Table SEGURO

Insert into SEGURO values (0,"Seguros Azul","303","12144008","01482","1236251401","1238104030","1240481621","1104552135","Ricardo","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","99","100","100","200","99","100","200","99")
Insert into SEGURO values (0,"Porto Seguro","404","52014755","78100","1237140250","1234015081","1201423080","1268762125","Caio","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","99","100","100","200","99","100","200","99");
Insert into SEGURO values (0,"Porto Seguro","404","14725801","25410","1231458701","1239248920","1014852104","1245636816","Felipe","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","99","100","100","200","99","100","200","99");
Insert into SEGURO values (0,"Porto Seguro","404","25814706","25420","1230140010","1239172045","1204804845","1264521321","Andre","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","99","100","100","200","99","100","200","99");


#Table FROTA

INSERT INTO frota VALUES(0,"Guincho","xxx","2014-01-02","VEIGIN","Guincho","abc1234","Amarelo");
INSERT INTO frota VALUES(0,"Taxi","Honda Civic","2015-01-02","HONDA","Taxi","tax1666","Branco");
INSERT INTO frota VALUES(0,"SOS-Guincho","xxx","2014-08-01","VEIGIN","SOS","sos4004","Amarelo");


#Table Veiculo 

Insert into veiculo values (0,"1","Hyundai","HB20","2014-01-02","asd1596","Prata");
Insert into veiculo values (0,"2","Honda", "Civic","2015-10-01","enh0660","Branco");
Insert into veiculo values (0,"3","Volkswagen"," GOL","2013-04-03","mjb4050","Preto");
Insert into veiculo values (0,"4","Ford","FOCUS","2015-02-03","asw2147","Prata");


#Table Sinistro

Insert into Sinistro Values (0,"1547","1","2","Sul America");
Insert into Sinistro Values (0,"0147","2","1","Porto Seguro");
Insert into Sinistro Values (0,"0324","2","1","Azul Seguro");
Insert into Sinistro Values (0,"0247","2","1","Mapfre Seguros");


#Table Serviço

Insert into servico values(0,"Retirada de Automovel","2000","1000");
Insert into servico values(0,"Transporte","1000","1000");
Insert into servico values(0,"SOS","2000","2000");
Insert into servico values(0,"Mecanico","500","1000");

#Table Viagem 

Insert into viagem values (0,"1","3","SJCampos","Jacarei","Bosque dos Eucaliptos","Vila Branca","24","25","SJCampos","Jacarei","SP","SP","xxx");
Insert into viagem values (0,"1","3","Jacarei","SJCampos","Vila Branca","Jardim Bela Vista","101","205","Jacarei","SJCampos","SP","SP","xxx");
Insert into viagem values (0,"1","2","Belo Horizonte","SJCampos","Rua José de Assis","Avenida Cidade Jardim","262","262","Belo Horizonte","SJCampos","MG","SP","xxx");


#Table Viagem_serviço

Insert into viagem_servico values (0,"1");
Insert into viagem_servico values (0,"2");
Insert into viagem_servico values (0,"3");



#Table Ordem de Serviço 

Insert into ordem_de_servico values (0,"1","4","2016-04-14","xxx","Aberto");
Insert into ordem_de_servico values (0,"2","3","2016-02-01","xxx","Fechado");
Insert into ordem_de_servico values (0,"3","2","2016-02-03","xxx","Rejeitado");


#Table servico_os

Insert into servico_os values (0,"1","1");
Insert into servico_os values (0,"2","2");
Insert into servico_os values (0,"3","4");


