SELECT nome_func
FROM servico_os
INNER JOIN viagem_servico ON
  servico_os.id_os = viagem_servico.id_os
    INNER JOIN ordem_de_servico os ON
      viagem_servico.id_os = os.id_os
      INNER JOIN funcionario ON
        os.id_func = funcionario.id_func
        INNER JOIN veiculo ON
          os.id_veiculo = veiculo.id_veiculo
          INNER JOIN cliente ON
            veiculo.id_cli = cliente.id_cli
            INNER JOIN viagem ON
              viagem_servico.id_viagem = viagem.id_viagem
              INNER JOIN motorista ON
                viagem.id_mot = motorista.id_mot
                INNER JOIN frota ON
                  viagem.id_frota = frota.id_frota
                INNER JOIN servico ON
                  servico_os.id_servico = servico.id_servico
                INNER JOIN sinistro ON
                  servico_os.id_sinistro = sinistro.id_sinistro
where funcionario.id_func = os.id_func and os.id_os = 1;


SELECT
cliente.nome_cli, cliente.sobrenome_cli, cliente.cpf_cli, cliente.email_cli,
cliente.sx_cli, cliente.telefone_cli,cliente.dtnasc_cli, cliente.cep_cli,
cliente.bairro_cli, cliente.cid_cli, cliente.uf_cli, cliente.endereco_cli,
veiculo.fabricante_veiculo, veiculo.modelo_veiculo, veiculo.ano_veiculo,
veiculo.placa_veiculo, veiculo.cor_veiculo,
viagem.bairro_destino_viagem, viagem.bairro_partida_viagem,
viagem.endereco_destino_viagem, viagem.endereco_partida_viagem,
viagem.cidade_destino_viagem, viagem.cidade_partida_viagem,
viagem.uf_destino_viagem, viagem.uf_partida_viagem, viagem.obs_viagem,
sinistro.sinistro,
os.dtab_os, os.agendamento_os, os.status_os,
servico.id_servico,
motorista.id_mot
FROM servico_os
INNER JOIN viagem_servico ON
  servico_os.id_os = viagem_servico.id_os
    INNER JOIN ordem_de_servico os ON
      viagem_servico.id_os = os.id_os
      INNER JOIN funcionario ON
        os.id_func = funcionario.id_func
        INNER JOIN veiculo ON
          os.id_veiculo = veiculo.id_veiculo
          INNER JOIN cliente ON
            veiculo.id_cli = cliente.id_cli
            INNER JOIN viagem ON
              viagem_servico.id_viagem = viagem.id_viagem
              INNER JOIN motorista ON
                viagem.id_mot = motorista.id_mot
                INNER JOIN frota ON
                  viagem.id_frota = frota.id_frota
                INNER JOIN servico ON
                  servico_os.id_servico = servico.id_servico
                INNER JOIN sinistro ON
                  servico_os.id_sinistro = sinistro.id_sinistro
WHERE os.id_os = (@consultaOS) AND
      os.id_func = funcionario.id_func
