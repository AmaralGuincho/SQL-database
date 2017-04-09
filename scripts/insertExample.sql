-- # DEMO fake data

INSERT INTO `occupation` VALUES
(null,"administrator","400000,00"),
(null,"secretary","200000,00"),
(null,"driver","100000,00");

INSERT INTO `employee` VALUES
(null,1,"Kevin","Flyn","04-10-2016","","","M","flyn@email.com","","127.0.0.1",""),
(null,1,"Sam","Flyn","04-10-2016","","","M","sam@email.com","","127.0.0.1",""),
(null,1,"Clue","","04-10-2016","","","M","clue@email.com","","127.0.0.1","");

INSERT INTO `users` VALUES
(1,"flyn","1234"),
(2,"sam","password"),
(3,"clue","imbetterthanflyn");

INSERT INTO `driver` VALUES
(3,"123456","123456","","","");

INSERT INTO `vehicle_type` VALUES
(null,'motocycle'),
(null,'Truck'),
(null,'Car'),
(null,'spaceship');

INSERT INTO `business_vehicle` VALUES
(null,4,"Milenium Falcon","EEEE440","1980","grey","","milenium"),
(null,3,"DMC","OUTATIME","1985","grey","","DeLorean");

INSERT INTO `displacement` VALUES
(null,3,2,"unknow","unknow","unknow","unknow","unknow"),
(null,3,1,"unknow","unknow","unknow","unknow","unknow");

INSERT INTO `customer` VALUES
(null,"Gabriel","","",""),
(null,"Jose","","",""),
(null,"Luke","","","");

INSERT INTO `vehicle` VALUES
(null,1,"PLATE123","03-2013","trasparent","DMC"),
(null,3,"PLATE321","03-2010","green","CMD");

INSERT INTO `insurance` VALUES
(0,"Seguro25blue","Seguros Azul","303","01482","Rua Califonia","Joao","joaozinho.98@hotmail.com","1236251401","1238104030","1240481621","1589552135","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","99","100","100","200","99","100","200","99"),
(0,"PortoSaveN","Seguros Azul","303","01482","Rua Califonia","Joao","joaozinho.98@hotmail.com","1236251401","1238104030","1240481621","1589552135","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","99","100","100","200","99","100","200","99"),
(0,"Zetta Kub","Seguros Azul","303","01482","Rua Califonia","Joao","joaozinho.98@hotmail.com","1236251401","1238104030","1240481621","1589552135","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","99","100","100","200","99","100","200","99"),
(0,"minums","Seguros Azul","303","01482","Rua Califonia","Joao","joaozinho.98@hotmail.com","1236251401","1238104030","1240481621","1589552135","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","100","200","99","100","99","100","100","200","99","100","200","99");

INSERT INTO `service_type` VALUES
(null,"SOS","20,00"),
(null,"Super SOS","25,83");

INSERT INTO `service` VALUES
(null,1,1,"opened","03-12-2013 09:22:11",1,"2288832");

INSERT INTO `travel` VALUES
(1,1),
(1,2);
