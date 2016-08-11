DROP DATABASE IF EXISTS amaralguincho;

CREATE DATABASE amaralguincho;

USE amaralguincho;

CREATE TABLE cliente
(
    id_cli INT NOT NULL AUTO_INCREMENT,
    nome_cli VARCHAR(20) NOT NULL,
    sobrenome_cli VARCHAR(90) NULL,
    cpf_cli VARCHAR(30) NULL,
    email_cli VARCHAR(50) NULL,
    sx_cli CHAR(1) NULL,
    telefone_cli VARCHAR(30) NULL,
    dtnasc_cli DATE NULL,
    cep_cli VARCHAR(21) NULL,
    bairro_cli VARCHAR(30) NULL,
    cid_cli VARCHAR(80) NULL,
    uf_cli VARCHAR(2) NULL,
    endereco_cli VARCHAR(50) NULL,
    img_cli TEXT NULL,

    PRIMARY KEY (id_cli),
    CONSTRAINT ch_sx CHECK (sx_cli = "M" or "F")
);

CREATE TABLE cargo
(
  id_cargo INT NOT NULL AUTO_INCREMENT,
  cargo VARCHAR(30) NOT NULL,
  salario FLOAT NOT NULL,

  CONSTRAINT uq_cargo UNIQUE (cargo),
  PRIMARY KEY(id_cargo)
);

CREATE TABLE funcionario
(
    id_func INT NOT NULL AUTO_INCREMENT,
    id_cargo INT NOT NULL,
    nome_func VARCHAR(20) NOT NULL,
    sobrenome_func VARCHAR(30) NULL,
    dtnasc_func DATE NULL,
    cep_func VARCHAR(20) NULL,
    cpf_func VARCHAR(20) NULL,
    dtcont_func DATE NULL,
    sx_func VARCHAR(1) NULL,
    tel_func VARCHAR(20) NULL,
    email_func VARCHAR(30) NOT NULL,
    residencia_func VARCHAR(30) NULL,
    bairro_func VARCHAR(30) NULL,
    uf_func VARCHAR(2) NULL,
    cid_func VARCHAR(80) NULL,
    img_func TEXT NULL,

    PRIMARY KEY (id_func),
    CONSTRAINT ch_sx CHECK (sx_func = "M" or "F"),
    FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo)
);

CREATE TABLE login(
  id_login INT NOT NULL AUTO_INCREMENT,
  username_login VARCHAR(50) NOT NULL,
  password_login VARCHAR(50) NOT NULL,
  id_func INT NOT NULL,

  PRIMARY KEY(id_login),
  FOREIGN KEY(id_func) REFERENCES funcionario(id_func)
);

CREATE TABLE motorista
(
    id_mot INT NOT NULL AUTO_INCREMENT,
    id_func INT NOT NULL,
    #habilitacao
    nome_hab VARCHAR(30) NOT NULL,
    idhab_hab VARCHAR(80) NOT NULL,
    nregistro_hab VARCHAR(80) NOT NULL,
    validade_hab DATE NOT NULL,
    local_hab VARCHAR(30) NOT NULL,
    dtemissao_hab DATE NOT NULL,

    PRIMARY KEY (id_mot),
    FOREIGN KEY (id_func) REFERENCES funcionario(id_func)
);

CREATE TABLE seguro
(
  id_seguro INT NOT NULL AUTO_INCREMENT,
  nome_seguro VARCHAR(50) NOT NULL,
  nome_amigavel VARCHAR(20) NOT NULL,
  codigo_prestador VARCHAR(30) NULL,
  cgc INT,
  endereco VARCHAR(30) NULL,
 #Cordenador
  cordenador_regiao VARCHAR(45) NULL,
 #Email representante
  email_representante NULL VARCHAR(40),
 #LISTA DE TELEFONES
  setor_cadastro_tel VARCHAR(30),
  setor_pagamento_tel VARCHAR(30),
  fechamento_servicos_tel VARCHAR(30),
  casos_andamento_tel VARCHAR(30),
 #Tabela de preco Reboque
 #Passeio
  passeio_40km FLOAT NULL,
  passeio_maior40km FLOAT NULL,
  passeio_hora_trabalhada FLOAT NULL,
  passeio_hora_parada FLOAT NULL,
 #Ultilitario Lanca leve
  ull_40km FLOAT NULL,
  ull_maior40km FLOAT NULL,
  ull_hora_trabalhada FLOAT NULL,
  ull_hora_parada FLOAT NULL,
 #Moto
  moto_40km FLOAT NULL,
  moto_maior40km FLOAT NULL,
  moto_hora_trabalhada FLOAT NULL,
  moto_hora_parada FLOAT NULL,
 #Garagem
  garagem_40km FLOAT NULL,
  garagem_maior40km FLOAT NULL,
  garagem_hora_trabalhada FLOAT NULL,
  garagem_hora_parada FLOAT NULL,
 #Rodas Extras
  re_40km FLOAT NULL,
  re_maior40km FLOAT NULL,
  re_hora_trabalhada FLOAT NULL,
  re_hora_parada FLOAT NULL,
 #Patins
  patins_40km FLOAT NULL,
  patins_maior40km FLOAT NULL,
  patins_hora_trabalhada FLOAT NULL,
  patins_hora_parada FLOAT NULL,
 #cam/leve
  cl_40km FLOAT NULL,
  cl_maior40km FLOAT NULL,
  cl_hora_trabalhada FLOAT NULL,
  cl_hora_parada FLOAT NULL,
 #SOS Pesado
  sospsd_40km FLOAT NULL,
  sospsd_maior40km FLOAT NULL,
  sospsd_hora_trabalhada FLOAT NULL,
  sospsd_hora_parada FLOAT NULL,
 #Extra Pesado
  xtrpsd_40km FLOAT NULL,
  xtrpsd_maior40km FLOAT NULL,
  xtrpsd_hora_trabalhada FLOAT NULL,
  xtrpsd_hora_parada FLOAT NULL,
 #Socorro Mecanico
  scrmec_40km FLOAT NULL,
  scrmec_mais40km FLOAT NULL,
 #Taxi
  km_rodado FLOAT NULL,
  km_parado FLOAT NULL,
 #Abertura Chaveiro
  saida_nacional_40km FLOAT NULL,
  saida_nacional_mais40km FLOAT NULL,
  saida_importado_40km FLOAT NULL,
  saida_importado_mais40km FLOAT NULL,
  saida_confeccao_40km FLOAT NULL,
  saida_confeccao_mais40km FLOAT NULL,
 #Residencia
  saida_40km FLOAT NULL,
  saida_mais40km FLOAT NULL,
  saida_hora_trabalhada FLOAT NULL,
 #Vigilante
  vigilante_40km FLOAT NULL,
  vigilante_mais40km FLOAT NULL,
  vigilante_hora_trabalhada FLOAT NULL,

  PRIMARY KEY (id_seguro)
);

CREATE TABLE frota
(
    id_frota INT NOT NULL AUTO_INCREMENT,
    nome_frota VARCHAR(30) NULL,
    modelo_frota VARCHAR(30) NULL,
    ano_frota VARCHAR(4) NULL,
    fabricante_frota VARCHAR(30) NULL,
    tipo_frota VARCHAR(20) NOT NULL,
    placa_frota CHAR(8) NOT NULL,
    cor_frota VARCHAR(20) NULL,
    img_frota TEXT NULL,

    PRIMARY KEY (id_frota)
);

CREATE TABLE veiculo
(
    id_veiculo INT NOT NULL AUTO_INCREMENT,
    id_cli INT NOT NULL,
    fabricante_veiculo VARCHAR(20) NULL,
    modelo_veiculo VARCHAR (30) NULL,
    ano_veiculo VARCHAR(4) NULL,
    placa_veiculo VARCHAR(8) NULL,
    cor_veiculo VARCHAR(10) NULL,

    PRIMARY KEY (id_veiculo),
    FOREIGN KEY (id_cli) REFERENCES cliente(id_cli)
);

CREATE TABLE sinistro
(
    id_sinistro INT NOT NULL AUTO_INCREMENT,
    sinistro VARCHAR(30) NOT NULL,
    id_cli INT NULL,
    id_seguro INT NULL,
    tipo_seguro VARCHAR(20) NULL,

    PRIMARY KEY (id_sinistro),
    FOREIGN KEY (id_cli) REFERENCES cliente(id_cli),
    FOREIGN KEY (id_seguro) REFERENCES seguro(id_seguro)
);

CREATE TABLE servico
(
    id_servico INT NOT NULL AUTO_INCREMENT,
    tipo_servico VARCHAR(30) NOT NULL,
    precoR_servico FLOAT NOT NULL,
    precoC_servico FLOAT NOT NULL,

    PRIMARY KEY (id_servico)
);

CREATE TABLE viagem
(
    id_viagem INT NOT NULL AUTO_INCREMENT,
    id_mot INT not NULL,
    id_frota INT not NULL,
    bairro_destino_viagem VARCHAR(50) NULL,
    bairro_partida_viagem VARCHAR(50) NULL,
    endereco_destino_viagem VARCHAR(80) NULL,
    endereco_partida_viagem VARCHAR(80) NULL,
    cidade_destino_viagem VARCHAR(50) NULL,
    cidade_partida_viagem VARCHAR(50) NULL,
    uf_destino_viagem VARCHAR(2) NULL,
    uf_partida_viagem VARCHAR(2) NULL,
    obs_viagem TEXT NULL,

    PRIMARY KEY (id_viagem),
    FOREIGN KEY (id_mot) REFERENCES motorista (id_mot),
    FOREIGN KEY (id_frota) REFERENCES frota (id_frota)
);

CREATE TABLE ordem_de_servico
(
    id_os INT NOT NULL AUTO_INCREMENT,
    id_func INT NOT NULL,
    id_veiculo INT NOT NULL,
    dtab_os DATETIME NOT NULL,
    agendamento_os DATETIME NULL,
    status_os VARCHAR(20) NOT NULL,

    PRIMARY KEY (id_os),
    FOREIGN KEY (id_func) REFERENCES funcionario(id_func),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE viagem_servico
(
    id_viagem INT NOT NULL AUTO_INCREMENT,
    id_os INT NOT NULL,

    PRIMARY KEY (id_viagem, id_os),
    FOREIGN KEY (id_viagem) REFERENCES viagem(id_viagem),
    FOREIGN KEY (id_os) REFERENCES ordem_de_servico(id_os)
);

CREATE TABLE servico_os
(
    id_os INT NOT NULL,
    id_servico INT NOT NULL,
    id_sinistro INT NOT NULL,
    id_seguro INT NOT NULL,

    PRIMARY KEY(id_os, id_servico, id_sinistro, id_seguro),
    FOREIGN KEY (id_os) REFERENCES ordem_de_servico(id_os),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico),
    FOREIGN KEY (id_sinistro) REFERENCES sinistro(id_sinistro),
    FOREIGN KEY (id_seguro) REFERENCES seguro(id_seguro)
);

# TRIGGERS AND PROCEDURES
DROP TRIGGER IF EXISTS defaultLogin;

DELIMITER $$

CREATE TRIGGER defaultLogin
  AFTER INSERT ON funcionario
FOR EACH ROW
BEGIN
  INSERT INTO login VALUES(0,NEW.email_func,"0000",new.id_func);
END$$

DELIMITER ;

-- TODO root User

system clear;
SELECT "BASE DE DADOS GRAVADA COM SUCESSO 👏" as "CONCLUIDO 🍻";
