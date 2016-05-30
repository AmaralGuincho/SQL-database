DROP DATABASE IF EXISTS amaralguincho;

CREATE DATABASE amaralguincho;

USE amaralguincho;

CREATE TABLE cliente
(
    id_cli INT NOT NULL AUTO_INCREMENT,
    nome_cli VARCHAR(20) NOT NULL,
    sobrenome_cli VARCHAR (50) NOT NULL,
    cpf_cli VARCHAR(30) NOT NULL,
    email_cli VARCHAR(50) NULL,
    sx_cli CHAR(1) NOT NULL,
    telefone_cli CHAR(11) NOT NULL,
    dtnasc_cli DATE NOT NULL,
    cep_cli VARCHAR(21) NOT NULL,
    bairro_cli VARCHAR(30) NOT NULL,
    cid_cli VARCHAR(80) NOT NULL,
    uf_cli VARCHAR(2) NOT NULL,
    endereco_cli VARCHAR(50) NOT NULL,
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
    sobrenome_func VARCHAR(30) NOT NULL,
    dtnasc_func DATE NOT NULL,
    cep_func VARCHAR(20) NOT NULL,
    cpf_func VARCHAR(20) NOT NULL,
    dtcont_func DATE NOT NULL,
    sx_func VARCHAR(1) NOT NULL,
    tel_func VARCHAR(20) NOT NULL,
    email_func VARCHAR(30) NOT NULL,
    uf_func VARCHAR(2) NOT NULL,
    cid_func VARCHAR(80) NOT NULL,
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
    idhab_hab INT(30) NOT NULL,
    nregistro_hab INT(12) NOT NULL,
    validade_hab DATE NOT NULL,
    local_hab VARCHAR(30) NOT NULL,
    dtemissao_hab DATE NOT NULL,

    PRIMARY KEY (id_mot),
    FOREIGN KEY (id_func) REFERENCES funcionario(id_func)
);

CREATE TABLE seguro
(
  id_seguro  INT NOT NULL AUTO_INCREMENT,
  nome_seguro  VARCHAR(20) NOT NULL,
  cod_prestador  VARCHAR(30) NOT NULL,
  cep  VARCHAR(80) NOT NULL,
  cgc  INT NOT NULL,
 #LISTA DE TELEFONES
  setor_cadastro_tel CHAR(11) NOT NULL,
  setor_pagto_tel CHAR(11) NOT NULL,
  fechamento_servicos_tel CHAR(11) NOT NULL,
  casos_andamento_tel CHAR(11) NOT NULL,
 #Cordenador
  cordenador_regiao VARCHAR(45) NOT NULL,
 #Tabela de preco Reboque
 #Passeio
  passeio_40km FLOAT NOT NULL,
  passeio_maior40km FLOAT NOT NULL,
  passeio_hora_trabalhada FLOAT NOT NULL,
  passeio_hora_parada FLOAT NOT NULL,
 #Ultilitario Lanca leve
  ull_40km  FLOAT NOT NULL,
  ull_maior40km  FLOAT NOT NULL,
  ull_hora_trabalhada  FLOAT NOT NULL,
  ull_hora_parada  FLOAT NOT NULL,
 #Moto
  moto_40km  FLOAT NOT NULL,
  moto_maior40km  FLOAT NOT NULL,
  moto_hora_trabalhada  FLOAT NOT NULL,
  moto_hora_parada  FLOAT NOT NULL,
 #Garagem
  garagem_40km  FLOAT NOT NULL,
  garagem_maior40km  FLOAT NOT NULL,
  garagem_hora_trabalhada  FLOAT NOT NULL,
  garagem_hora_parada  FLOAT NOT NULL,
 #Rodas Extras
  re_40km  FLOAT NOT NULL,
  re_maior40km  FLOAT NOT NULL,
  re_hora_trabalhada  FLOAT NOT NULL,
  re_hora_parada  FLOAT NOT NULL,
 #Patins
  patins_40km  FLOAT NOT NULL,
  patins_maior40km  FLOAT NOT NULL,
  patins_hora_trabalhada  FLOAT NOT NULL,
  patins_hora_parada  FLOAT NOT NULL,
 #cam/leve
  cl_40km  FLOAT NOT NULL,
  cl_maior40km  FLOAT NOT NULL,
  cl_hora_trabalhada  FLOAT NOT NULL,
  cl_hora_parada  FLOAT NOT NULL,
 #SOS Pesado
  sospsd_40km  FLOAT NOT NULL,
  sospsd_maior40km  FLOAT NOT NULL,
  sospsd_hora_trabalhada  FLOAT NOT NULL,
  sospsd_hora_parada  FLOAT NOT NULL,
 #Extra Pesado
  xtrpsd_40km  FLOAT NOT NULL,
  xtrpsd_maior40km  FLOAT NOT NULL,
  xtrpsd_hora_trabalhada  FLOAT NOT NULL,
  xtrpsd_hora_parada  FLOAT NOT NULL,
 #Socorro Mecanico
  scrmec_40km  float NOT NULL,
  scrmec_mais40km  float NOT NULL,
 #Taxi
  km_rodado  float NOT NULL,
  km_parado  float NOT NULL,
 #Abertura Chaveiro
  saida_nacional_40km  FLOAT NOT NULL,
  saida_nacional_mais40km  FLOAT NOT NULL,
  saida_importado_40km  FLOAT NOT NULL,
  saida_importado_mais40km  FLOAT NOT NULL,
  saida_confeccao_40km  FLOAT NOT NULL,
  saida_confeccao_mais40km  FLOAT NOT NULL,
 #Residencia
  saida_40km  FLOAT NOT NULL,
  saida_mais40km  FLOAT NOT NULL,
  saida_hora_trabalhada FLOAT NOT NULL,
 #Vigilante
  vigilante_40km  FLOAT NOT NULL,
  vigilante_mais40km  FLOAT NOT NULL,
  vigilante_hora_trabalhada FLOAT NOT NULL,

  PRIMARY KEY (id_seguro)
);

CREATE TABLE frota
(
    id_frota INT NOT NULL AUTO_INCREMENT,
    nome_frota VARCHAR(30) NULL,
    modelo_frota VARCHAR(30) NULL,
    ano_frota DATE NULL,
    fabricante_frota VARCHAR(30) NULL,
    tipo_frota VARCHAR(20) NOT NULL,
    placa_frota CHAR(7) NOT NULL,
    cor_frota VARCHAR(20) NULL,
    img_frota TEXT NULL,

    PRIMARY KEY (id_frota)
);

CREATE TABLE veiculo
(
    id_veiculo INT NOT NULL AUTO_INCREMENT,
    id_cli INT NOT NULL,
    fabricante_veiculo VARCHAR(20) NOT NULL,
    modelo_veiculo VARCHAR (30) NOT NULL,
    ano_veiculo DATE NOT NULL,
    placa_veiculo VARCHAR(7) NOT NULL,
    cor_veiculo VARCHAR(10) NOT NULL,

    PRIMARY KEY (id_veiculo),
    FOREIGN KEY (id_cli) REFERENCES cliente(id_cli)
);

CREATE TABLE sinistro
(
    id_sinistro INT NOT NULL AUTO_INCREMENT,
    sinistro INT NOT NULL,
    id_cli INT NOT NULL,
    id_seguro INT NULL,
    tipo_seguro VARCHAR(20) NOT NULL,

    PRIMARY KEY (id_sinistro),
    FOREIGN KEY (id_cli) REFERENCES cliente(id_cli),
    FOREIGN KEY (id_seguro) REFERENCES seguro(id_seguro)
);

CREATE TABLE servico
(
    id_servico INT NOT NULL AUTO_INCREMENT,
    tipo_servico VARCHAR(30) NOT NULL,
    precoReal_servico FLOAT NOT NULL,
    precoCobrado_servico FLOAT NOT NULL,

    PRIMARY KEY (id_servico)
);

CREATE TABLE viagem
(
    id_viagem INT NOT NULL AUTO_INCREMENT,
    id_mot INT NOT NULL,
    id_frota INT NOT NULL,
    localSaida_viagem VARCHAR(20) NOT NULL,
    localChegada_viagem VARCHAR(20) NOT NULL,
    enderecoSaida_viagem VARCHAR(30) NOT NULL,
    enderecoChegada_viagem VARCHAR(30) NOT NULL,
    numeroSaida_viagem VARCHAR(5) NULL,
    numeroChegada_viagem VARCHAR(5) NULL,
    cidadeSaida_viagem VARCHAR(20) NOT NULL,
    cidadeChegada_viagem VARCHAR(20) NOT NULL,
    ufSaida_viagem VARCHAR(2) NOT NULL,
    ufChegada_viagem VARCHAR(2) NOT NULL,
    obs_viagem TEXT NULL,

    PRIMARY KEY (id_viagem),
    FOREIGN KEY (id_mot) REFERENCES motorista (id_mot),
    FOREIGN KEY (id_frota) REFERENCES frota (id_frota)
);

CREATE TABLE viagem_servico
(
    id_viagem INT NOT NULL AUTO_INCREMENT,
    id_servico INT NOT NULL,

    PRIMARY KEY (id_viagem, id_servico),
    FOREIGN KEY (id_viagem) REFERENCES viagem(id_viagem),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico)

);

CREATE TABLE ordem_de_servico
(
    id_os INT NOT NULL AUTO_INCREMENT,
    id_func INT NOT NULL,
    id_veiculo INT NOT NULL,
    dtab_os DATETIME NOT NULL,
    agendamento_os VARCHAR(100) NULL,
    status_os VARCHAR(20) NOT NULL,

    PRIMARY KEY (id_os),
    FOREIGN KEY (id_func) REFERENCES funcionario(id_func),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE servico_os
(
    id_os INT NOT NULL AUTO_INCREMENT,
    id_servico INT NOT NULL,
    id_sinistro INT NOT NULL,

    PRIMARY KEY(id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES ordem_de_servico(id_os),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico),
    FOREIGN KEY (id_sinistro) REFERENCES sinistro(id_sinistro)
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

system clear;
SELECT "BASE DE DADOS GRAVADA COM SUCESSO 👏" as "CONCLUIDO 🍻";
