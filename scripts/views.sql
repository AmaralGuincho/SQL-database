# Amral Guincho Views

#View with motorista data
CREATE VIEW motoristaOnly AS
  SELECT func.id_func, func.nome_func, func.sobrenome_func,
   func.img_func, func.tel_func, mot.id_mot
  FROM funcionario func
    INNER JOIN motorista mot ON
      (func.id_func = mot.id_func);
