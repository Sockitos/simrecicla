// ignore_for_file: prefer_single_quotes

const categories = [
  {
    "category": "Garrafas",
    "iconId": "garrafas",
    "packages": [
      {
        "iconId": "garrafa_de_iogurte_l_quido___completa",
        "id": 1,
        "name": "Garrafa de iogurte líquido (grande)",
        "components": [
          {
            "iconId": "garrafa_de_iogurte_l_quido__grande_",
            "name": "Corpo da garrafa",
            "id": "01Corpo da garrafa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": 0.027,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes":
                "Esvaziar; Espalmar; Manter a tampa na embalagem espalmada"
          },
          {
            "iconId": "tampa_garrafa",
            "name": "Tampa",
            "id": "01Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": 0.003,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a tampa na embalagem"
          },
          {
            "iconId": "manga",
            "name": "Manga de plástico",
            "id": "01Manga de plástico",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.001,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Caso apresente picotado, este componente deve ser destacado e colocado isoladamente no contentor amarelo!",
            "recomendacoes": "Destacar manga se apresentar picotado"
          }
        ]
      },
      {
        "iconId": "garrafao_de_agua___completa",
        "id": 2,
        "name": "Garrafão de água",
        "components": [
          {
            "iconId": "garrafao_de_agua",
            "name": "Corpo do garrafão",
            "id": "02Corpo do garrafão",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": 0.083,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes":
                "Esvaziar; Espalmar; Manter a tampa na embalagem espalmada"
          },
          {
            "iconId": "tampa_garrafa",
            "name": "Tampa",
            "id": "02Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": 0.002,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a tampa na embalagem"
          },
          {
            "iconId": "rotulo",
            "name": "Rótulo",
            "id": "02Rótulo",
            "papel": 0.001,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Apesar de este componente ser de papel, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Apesar de este componente ser de papel, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor amarelo!",
            "recomendacoes": "Manter o rótulo na embalagem"
          }
        ]
      },
      {
        "iconId": "garrafa_de_agua___completa",
        "id": 3,
        "name": "Garrafa de água\n(1,5L)",
        "components": [
          {
            "iconId": "garrafa_de_agua",
            "name": "Corpo da garrafa",
            "id": "03Corpo da garrafa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": 0.027,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes":
                "Esvaziar; Espalmar; Manter a tampa na embalagem espalmada"
          },
          {
            "iconId": "tampa_garrafa",
            "name": "Tampa",
            "id": "03Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": 0.001,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a tampa na embalagem"
          },
          {
            "iconId": "rotulo",
            "name": "Rótulo",
            "id": "03Rótulo",
            "papel": 0.001,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Apesar de este componente ser de papel, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Apesar de este componente ser de papel, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor amarelo!",
            "recomendacoes": "Manter o rótulo na embalagem"
          }
        ]
      },
      {
        "iconId": "garrafa_de_oleo___completa",
        "id": 4,
        "name": "Garrafa de óleo",
        "components": [
          {
            "iconId": "garrafa_de_oleo",
            "name": "Corpo da garrafa",
            "id": "04Corpo da garrafa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": 0.026,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes":
                "Esvaziar; Espalmar; Manter a tampa na embalagem espalmada"
          },
          {
            "iconId": "tampa_garrafa",
            "name": "Tampa",
            "id": "04Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": 0.001,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a tampa na embalagem"
          },
          {
            "iconId": "rotulo",
            "name": "Rótulo",
            "id": "04Rótulo",
            "papel": 0.001,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Apesar de este componente ser de papel, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Apesar de este componente ser de papel, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor amarelo!",
            "recomendacoes": "Manter o rótulo na embalagem"
          }
        ]
      },
      {
        "iconId": "garrafa_de_azeite___completa",
        "id": 5,
        "name": "Garrafa de azeite\n(vidro)",
        "components": [
          {
            "iconId": "garrafa_de_azeite",
            "name": "Corpo da garrafa",
            "id": "05Corpo da garrafa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": 0.432,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!",
            "recomendacoes": "Esvaziar; Manter a tampa na embalagem"
          },
          {
            "iconId": "tampa_garrafa",
            "name": "Tampa",
            "id": "05Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": 0.005,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Apesar de este componente ser de metal, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Apesar de este componente ser de metal, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor verde!",
            "recomendacoes": "Manter a tampa na embalagem"
          }
        ]
      },
      {
        "iconId": "garrafa_de_cerveja___completa",
        "id": 52,
        "name": "Garrafa de cerveja",
        "components": [
          {
            "iconId": "garrafa_de_cerveja___garrafa",
            "name": "Corpo da garrafa",
            "id": "52Corpo da garrafa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": 0.14,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!",
            "recomendacoes": "Esvaziar; Manter a tampa na embalagem"
          },
          {
            "iconId": "garrafa_de_cerveja___carica",
            "name": "Carica",
            "id": "52Carica",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": 0.002,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Apesar de este componente ser de metal, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Apesar de este componente ser de metal, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor verde!",
            "recomendacoes": "Manter a carica na embalagem"
          },
          {
            "iconId": "rotulo",
            "name": "Rótulo",
            "id": "52Rótulo",
            "papel": 0.001,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Apesar de este componente ser de papel, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Apesar de este componente ser de papel, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor amarelo!",
            "recomendacoes": "Manter o rótulo na embalagem"
          }
        ]
      }
    ]
  },
  {
    "category": "Boiões",
    "iconId": "boioes",
    "packages": [
      {
        "iconId": "boiao_de_doce_vidro___completa",
        "id": 6,
        "name": "Boião de doce ou de conservas (vidro)",
        "components": [
          {
            "iconId": "boiao_de_doce_vidro",
            "name": "Boião",
            "id": "06Boião",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": 0.195,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!",
            "recomendacoes": "Esvaziar a embalagem"
          },
          {
            "iconId": "tampa_boiao___frasco",
            "name": "Tampa",
            "id": "06Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": 0.01,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de metal e deve ser separado da embalagem e colocado no contentor amarelo!",
            "recomendacoes": "Separar a tampa de metal"
          }
        ]
      },
      {
        "iconId": "boiao_de_doce_plastico___completa",
        "id": 7,
        "name": "Boião de doce ou de conservas (plástico)",
        "components": [
          {
            "iconId": "boiao_de_doce_plastico",
            "name": "Boião",
            "id": "07Boião",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": 0.34,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar a embalagem"
          },
          {
            "iconId": "tampa_boiao___frasco",
            "name": "Tampa",
            "id": "07Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.01,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo!",
            "recomendacoes":
                "Separar a tampa de plástico; Depositar isoladamente"
          },
          {
            "iconId": "pelicula_de_selagem",
            "name": "Película de selagem",
            "id": "07Película de selagem",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": 0.001,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de metal e deve ser separado da embalagem e colocado isoladamente no contentor amarelo!",
            "recomendacoes":
                "Separar a película de metal; Depositar isoladamente"
          }
        ]
      },
      {
        "iconId": "boiao_de_creme_hidratante___completa",
        "id": 8,
        "name": "Boião de creme hidratante (vidro)",
        "components": [
          {
            "iconId": "boiao_de_creme_hidratante",
            "name": "Boião",
            "id": "08Boião",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": 0.028,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!",
            "recomendacoes": "Esvaziar a embalagem"
          },
          {
            "iconId": "tampa_boiao___frasco",
            "name": "Tampa",
            "id": "08Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.004,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado no contentor amarelo!",
            "recomendacoes": "Separar a tampa de plástico"
          }
        ]
      }
    ]
  },
  {
    "category": "Copos/Baldes",
    "iconId": "copos_baldes",
    "packages": [
      {
        "iconId": "copo_iogurte_solido",
        "id": 9,
        "name": "Copos de iogurte sólido",
        "components": [
          {
            "iconId": "copo_iogurte_solido",
            "name": "Copo",
            "id": "09Copo",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.004,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar; Espalmar"
          },
          {
            "iconId": "pelicula_de_selagem",
            "name": "Película de selagem",
            "id": "09Película de selagem",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.001,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este material de embalagem é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componentes com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a película de selagem na embalagem"
          }
        ]
      },
      {
        "iconId": "balde_iogurte_solido",
        "id": 10,
        "name": "Balde de iogurte sólido",
        "components": [
          {
            "iconId": "balde_iogurte_solido",
            "name": "Balde",
            "id": "10Balde",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.033,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar a embalagem"
          },
          {
            "iconId": "tampa_boiao___frasco",
            "name": "Tampa",
            "id": "10Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.007,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo!",
            "recomendacoes":
                "Separar a tampa de plástico; Depositar isoladamente"
          }
        ]
      },
      {
        "iconId": "copo_de_gelado",
        "id": 11,
        "name": "Copo de gelado\n(cartão)",
        "components": [
          {
            "iconId": "copo_de_gelado",
            "name": "Copo",
            "id": "11Copo",
            "papel": null,
            "cartao": 0.007,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Indiferenciado",
            "if_true":
                "Muito bem! Esta embalagem não é reciclável e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de cartão mas está suja e com gordura, pelo que deve ser mantida separada do cartão reciclável. Esta embalagem deve ser colocada no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).",
            "recomendacoes":
                "Esvaziar; Espalmar; Manter a tampa na embalagem espalmada"
          },
          {
            "iconId": "tampa_boiao___frasco",
            "name": "Tampa",
            "id": "11Tampa",
            "papel": null,
            "cartao": 0.004,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Indiferenciado",
            "if_true":
                "Muito bem! Este componente não é reciclável e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de cartão mas está sujo e com gordura, pelo que deve ser mantido separado do cartão reciclável. Este material deve ser colocado no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).",
            "recomendacoes": "Manter a tampa na embalagem"
          },
          {
            "iconId": "pelicula_de_selagem",
            "name": "Película de selagem",
            "id": "11Película de selagem",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.001,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado no contentor amarelo!",
            "recomendacoes": "Separar a película de plástico"
          }
        ]
      }
    ]
  },
  {
    "category": "Pacotes para líquidos alimentares",
    "iconId": "pacotes_bebidas",
    "packages": [
      {
        "iconId": "pacote_de_leite_sem_tampa",
        "id": 12,
        "name": "Pacote sem tampa",
        "components": [
          {
            "iconId": "pacote_de_leite_sem_tampa",
            "name": "Pacote para bebidas",
            "id": "12Pacote para bebidas",
            "papel": null,
            "cartao": null,
            "ecal": 0.027,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de ECAL e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de ECAL e deve ser colocada no contentor amarelo! Este encaminhamento assegura a sua triagem e a recuperação dos diferentes materiais que a constituem (plástico, alumínio e cartão).",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "pacote_de_leite_com_tampa",
        "id": 13,
        "name": "Pacote com tampa",
        "components": [
          {
            "iconId": "pacote_de_leite_com_tampa",
            "name": "Pacote para bebidas",
            "id": "13Pacote para bebidas",
            "papel": null,
            "cartao": null,
            "ecal": 0.035,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de ECAL e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de ECAL e deve ser colocada no contentor amarelo! Este encaminhamento assegura a sua triagem e a recuperação dos diferentes materiais que a constituem (plástico, alumínio e cartão).",
            "recomendacoes":
                "Esvaziar; Espalmar; Manter a tampa na embalagem espalmada"
          },
          {
            "iconId": "tampa_garrafa",
            "name": "Tampa",
            "id": "13Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": 0.002,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a tampa na embalagem"
          }
        ]
      },
      {
        "iconId": "pacote_flexivel_para_sumo___completa",
        "id": 14,
        "name": "Pacote flexível",
        "components": [
          {
            "iconId": "pacote_flexivel_para_sumo",
            "name": "Pacote para bebidas",
            "id": "14Pacote para bebidas",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.005,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes":
                "Esvaziar; Espalmar; Manter a tampa na embalagem espalmada"
          },
          {
            "iconId": "tampa_garrafa",
            "name": "Tampa",
            "id": "14Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.001,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a tampa na embalagem"
          }
        ]
      }
    ]
  },
  {
    "category": "Caixas",
    "iconId": "caixas",
    "packages": [
      {
        "iconId": "caixa_de_sobremesa_refrigerada___completa",
        "id": 15,
        "name": "Caixa de sobremesa refrigerada",
        "components": [
          {
            "iconId": "caixa_de_sobremesa_refrigerada___caixa",
            "name": "Caixa",
            "id": "15Caixa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": 0.009,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar a embalagem"
          },
          {
            "iconId": "caixa_de_sobremesa_refrigerada___tampa",
            "name": "Tampa",
            "id": "15Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": 0.004,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo!",
            "recomendacoes":
                "Separar a tampa de plástico; Depositar isoladamente"
          }
        ]
      },
      {
        "iconId": "caixa_de_ovos__cartao_",
        "id": 16,
        "name": "Caixa de ovos\n(cartão)",
        "components": [
          {
            "iconId": "caixa_de_ovos__cartao_",
            "name": "Caixa",
            "id": "16Caixa",
            "papel": null,
            "cartao": 0.03,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "caixa_de_ovos__plastico_",
        "id": 17,
        "name": "Caixa de ovos\n(plástico)",
        "components": [
          {
            "iconId": "caixa_de_ovos__plastico_",
            "name": "Caixa",
            "id": "17Caixa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": 0.057,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar"
          }
        ]
      },
      {
        "iconId": "caixa_de_manteiga___completa",
        "id": 18,
        "name": "Caixa de manteiga\ne semelhantes",
        "components": [
          {
            "iconId": "caixa_de_manteiga___caixa",
            "name": "Caixa",
            "id": "18Caixa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.01,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "caixa_de_manteiga___tampa",
            "name": "Tampa",
            "id": "18Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.007,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo!",
            "recomendacoes":
                "Separar a tampa de plástico; Depositar isoladamente"
          },
          {
            "iconId": "caixa_de_manteiga___pelicula",
            "name": "Película de selagem",
            "id": "18Película de selagem",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.001,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este material de embalagem é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a película de selagem na embalagem"
          }
        ]
      },
      {
        "iconId": "caixa_de_bolo_fresco",
        "id": 19,
        "name": "Caixa de bolo fresco",
        "components": [
          {
            "iconId": "caixa_de_bolo_fresco___caixa",
            "name": "Caixa",
            "id": "19Caixa",
            "papel": null,
            "cartao": 0.133,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Indiferenciado",
            "if_true":
                "Muito bem! Esta embalagem não é reciclável e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de cartão mas está suja e com gordura, pelo que deve ser mantida separada do cartão reciclável. Esta embalagem deve ser colocada no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).",
            "recomendacoes": "Esvaziar; Espalmar"
          },
          {
            "iconId": "caixa_de_bolo_fresco___pelicula_interior",
            "name": "Película interior",
            "id": "19Película interior",
            "papel": 0.001,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Indiferenciado",
            "if_true":
                "Muito bem! Este material de embalagem não é reciclável e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este material é de papel mas está sujo e com gordura, pelo que deve ser mantido separado do papel reciclável. Este material deve ser ser colocado no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).",
            "recomendacoes": "Manter a película na embalagem"
          },
          {
            "iconId": "caixa_de_bolo_fresco___janela",
            "name": "Janela de plástico",
            "id": "19Janela de plástico",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.0006,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Indiferenciado",
            "if_true":
                "Muito bem! Apesar de este componente ser de plástico, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Apesar de este componente ser de plástico, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).",
            "recomendacoes": "Manter na embalagem"
          }
        ]
      },
      {
        "iconId": "caixa_de_detergente_em_po",
        "id": 20,
        "name": "Caixa de detergente\nem pó",
        "components": [
          {
            "iconId": "caixa_de_detergente_em_po",
            "name": "Caixa",
            "id": "20Caixa",
            "papel": null,
            "cartao": 0.231,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "caixa_de_sapatos",
        "id": 21,
        "name": "Caixa de sapatos",
        "components": [
          {
            "iconId": "caixa_de_sapatos",
            "name": "Caixa",
            "id": "21Caixa",
            "papel": null,
            "cartao": 0.225,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "caixa_de_folha_de_aluminio_ou_de_pelicula___caixa",
        "id": 22,
        "name": "Caixa de folha de alumínio ou de película",
        "components": [
          {
            "iconId": "caixa_de_folha_de_aluminio_ou_de_pelicula___caixa",
            "name": "Caixa",
            "id": "22Caixa",
            "papel": null,
            "cartao": 0.028,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!",
            "recomendacoes": "Esvaziar; Espalmar"
          },
          {
            "iconId": "caixa_de_folha_de_aluminio_ou_de_pelicula___rolo",
            "name": "Rolo",
            "id": "22Rolo",
            "papel": null,
            "cartao": 0.032,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Este componente é de cartão e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de cartão e deve ser separado da embalagem e colocado isoladamente no contentor azul!",
            "recomendacoes":
                "Separar o rolo da caixa de cartão; Depositar isoladamente"
          }
        ]
      }
    ]
  },
  {
    "category": "Cuvetes e Tubos",
    "iconId": "cuvetes_e_tubos",
    "packages": [
      {
        "iconId": "cuvete_de_legumes___completo",
        "id": 23,
        "name": "Cuvete de legumes frescos",
        "components": [
          {
            "iconId": "cuvete_de_legumes___cuvete",
            "name": "Cuvete",
            "id": "23Cuvete",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": 0.005,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar a embalagem"
          },
          {
            "iconId": "filme_de_selagem",
            "name": "Filme de selagem",
            "id": "23Filme de selagem",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": 0.003,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este material de embalagem é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este material é de plástico e deve ser separado da embalagem e colocado isoladamente no contentor amarelo!",
            "recomendacoes":
                "Separar o filme de selagem da embalagem; Depositar isoladamente"
          }
        ]
      },
      {
        "iconId": "cuvete_de_carne_ou_peixe_frescos___completo",
        "id": 24,
        "name": "Cuvete de carne ou\npeixe frescos",
        "components": [
          {
            "iconId": "cuvete_de_legumes___cuvete",
            "name": "Cuvete",
            "id": "24Cuvete",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.024,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar a embalagem"
          },
          {
            "iconId": "filme_de_selagem",
            "name": "Filme de selagem",
            "id": "24Filme de selagem",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": 0.002,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este material de embalagem é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este material é de plástico e deve ser separado da embalagem e colocado isoladamente no contentor amarelo!",
            "recomendacoes":
                "Separar o filme de selagem da embalagem; Depositar isoladamente"
          }
        ]
      },
      {
        "iconId": "tabuleiro_met_lico_de_pronto_a_comer___completo",
        "id": 25,
        "name": "Tabuleiro metálico de pronto-a-comer",
        "components": [
          {
            "iconId": "tabuleiro_met_lico_de_pronto_a_comer___tabuleiro",
            "name": "Tabuleiro",
            "id": "25Tabuleiro",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": 0.015,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de metal e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de metal e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar; Espalmar"
          },
          {
            "iconId": "tabuleiro_met_lico_de_pronto_a_comer___tampa_cartao",
            "name": "Tampa de cartão",
            "id": "25Tampa de cartão",
            "papel": null,
            "cartao": 0.003,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Indiferenciado",
            "if_true":
                "Muito bem! Este material de embalagem não é reciclável e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este material é de cartão plastificado, está sujo e com gordurapelo que deve ser mantido separado do cartão reciclável. Este material deve ser colocado no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).",
            "recomendacoes": "Separar a tampa de cartão"
          }
        ]
      },
      {
        "iconId": "tubo_de_creme_hidratante___completo",
        "id": 26,
        "name": "Tubo de creme\nhidratante",
        "components": [
          {
            "iconId": "tubo_de_creme_hidratante___tubo",
            "name": "Tubo",
            "id": "26Tubo",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": 0.013,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "tampa_garrafa",
            "name": "Tampa",
            "id": "26Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.005,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a tampa na embalagem"
          }
        ]
      }
    ]
  },
  {
    "category": "Frascos",
    "iconId": "frascos",
    "packages": [
      {
        "iconId": "frasco_de_molho_de_tempero___completo",
        "id": 27,
        "name": "Frasco de molho de tempero (plástico)",
        "components": [
          {
            "iconId": "frasco_de_molho_de_tempero___frasco",
            "name": "Frasco",
            "id": "27Frasco",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": 0.017,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "tampa_boiao___frasco",
            "name": "Tampa",
            "id": "27Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.009,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a tampa na embalagem"
          }
        ]
      },
      {
        "iconId": "frasco_de_desodorizante_roll_on___completo",
        "id": 28,
        "name": "Frasco de desodorizante roll-on (vidro)",
        "components": [
          {
            "iconId": "frasco_de_desodorizante_roll_on___frasco",
            "name": "Frasco",
            "id": "28Frasco",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": 0.099,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "frasco_de_desodorizante_roll_on___tampa",
            "name": "Tampa",
            "id": "28Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.006,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Apesar de este componente ser de plástico, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Apesar de este componente ser de plástico, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor verde!",
            "recomendacoes": "Manter a tampa na embalagem"
          }
        ]
      },
      {
        "iconId": "frasco_de_cafe___completo",
        "id": 29,
        "name": "Frasco de café ou outras misturas solúveis (vidro)",
        "components": [
          {
            "iconId": "frasco_de_cafe___frasco",
            "name": "Frasco",
            "id": "29Frasco",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": 0.239,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "frasco_de_cafe___tampa",
            "name": "Tampa",
            "id": "29Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.014,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado no contentor amarelo!",
            "recomendacoes": "Separar a tampa de plástico"
          },
          {
            "iconId": "pelicula_de_selagem",
            "name": "Película de selagem",
            "id": "29Película de selagem",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": 0.001,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de metal e deve ser separado da embalagem e colocado no contentor amarelo!",
            "recomendacoes":
                "Separar a película de metal; Depositar isoladamente"
          }
        ]
      },
      {
        "iconId": "frasco_de_champo_ou_amaciador___completo",
        "id": 30,
        "name": "Frasco de produtos\nde higiene",
        "components": [
          {
            "iconId": "frasco_de_champo_ou_amaciador___frasco",
            "name": "Frasco",
            "id": "30Frasco",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": 0.037,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "frasco_de_champo_ou_amaciador___tampa",
            "name": "Tampa",
            "id": "30Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": 0.004,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a tampa na embalagem"
          }
        ]
      },
      {
        "iconId": "frasco_de_produto_de_limpeza_com_dispensador___completo",
        "id": 31,
        "name": "Frasco de produto de limpeza com dispensador",
        "components": [
          {
            "iconId": "frasco_de_produto_de_limpeza_com_dispensador___frasco",
            "name": "Frasco",
            "id": "31Frasco",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": 0.046,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "frasco_de_produto_de_limpeza_com_dispensador___tampa",
            "name": "Tampa com dispensador",
            "id": "31Tampa com dispensador",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.025,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado isoladamente no contentor amarelo!",
            "recomendacoes":
                "Separar o dispensador da embalagem; Depositar isoladamente"
          }
        ]
      },
      {
        "iconId": "frasco_sal___completo",
        "id": 32,
        "name": "Frasco de sal",
        "components": [
          {
            "iconId": "frasco_sal___frasco",
            "name": "Frasco",
            "id": "32Frasco",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.019,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "frasco_sal___tampa",
            "name": "Tampa",
            "id": "32Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.006,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter a tampa na embalagem"
          }
        ]
      },
      {
        "iconId": "frasco_de_perfume___completo",
        "id": 33,
        "name": "Frasco de perfume",
        "components": [
          {
            "iconId": "frasco_de_perfume___frasco",
            "name": "Frasco",
            "id": "33Frasco",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": 0.142,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "tampa_garrafa",
            "name": "Tampa",
            "id": "33Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.007,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Verde",
            "if_true":
                "Muito bem! Apesar de este componente ser de plástico, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Apesar de este componente ser de plástico, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor verde!",
            "recomendacoes": "Manter a tampa na embalagem"
          }
        ]
      }
    ]
  },
  {
    "category": "Latas",
    "iconId": "latas",
    "packages": [
      {
        "iconId": "lata_conserva___completo",
        "id": 34,
        "name": "Lata de peixe em conserva",
        "components": [
          {
            "iconId": "lata_conserva___lata",
            "name": "Lata",
            "id": "34Lata",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": 0.023,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de metal e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de metal e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "lata_conserva___tampa",
            "name": "Tampa metálica (com anilha)",
            "id": "34Tampa metálica removível (com anilha)",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": 0.007,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de metal e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter as anilhas na embalagem"
          }
        ]
      },
      {
        "iconId": "lata_de_refrigerante___completo",
        "id": 35,
        "name": "Lata de refrigerante",
        "components": [
          {
            "iconId": "lata_de_refrigerante___lata",
            "name": "Lata",
            "id": "35Lata",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": 0.01,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de metal e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de metal e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar; Espalmar"
          },
          {
            "iconId": "lata_de_refrigerante___anilha",
            "name": "Anilha",
            "id": "35Anilha",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": 0.001,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de metal e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter as anilhas na embalagem"
          }
        ]
      },
      {
        "iconId": "lata_de_espuma_barbear___completo",
        "id": 36,
        "name": "Lata de espuma de barbear",
        "components": [
          {
            "iconId": "lata_de_espuma_barbear___lata",
            "name": "Lata",
            "id": "36Lata",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": 0.051,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de metal e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de metal e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "lata_de_espuma_barbear___tampa",
            "name": "Tampa",
            "id": "36Tampa",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.005,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado isoladamente no contentor amarelo!",
            "recomendacoes":
                "Separar a tampa de plástico; Depositar isoladamente"
          }
        ]
      },
      {
        "iconId": "lata_de_ra_ao_para_animal___completo",
        "id": 37,
        "name": "Lata de ração\npara animal",
        "components": [
          {
            "iconId": "lata_de_ra_ao_para_animal___lata",
            "name": "Lata",
            "id": "37Lata",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": 0.042,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de metal e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de metal e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "lata_de_ra_ao_para_animal___tampa",
            "name": "Tampa metálica (com anilha)",
            "id": "37Tampa metálica removível (com anilha)",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": 0.007,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de metal e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!",
            "recomendacoes": "Manter as anilhas na embalagem"
          }
        ]
      }
    ]
  },
  {
    "category": "Pacotes flexíveis/Sacos",
    "iconId": "pacotes_flexiveis_sacos",
    "packages": [
      {
        "iconId": "pacote_flex_vel_de_a_ucar___papel",
        "id": 38,
        "name": "Pacote de açúcar e semelhantes (papel)",
        "components": [
          {
            "iconId": "pacote_flex_vel_de_a_ucar___papel",
            "name": "Pacote flexível",
            "id": "38Pacote flexível",
            "papel": 0.008,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Esta embalagem é de papel e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel e deve ser colocada no contentor azul!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "pacote_flex_vel_de_a_ucar___plastico",
        "id": 39,
        "name": "Pacote de açúcar e semelhantes (plástico)",
        "components": [
          {
            "iconId": "pacote_flex_vel_de_a_ucar___plastico",
            "name": "Pacote flexível",
            "id": "39Pacote flexível",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": 0.006,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "pacote_flex_vel_manteiga",
        "id": 40,
        "name": "Pacote de margarina\ne semelhantes\n(plástico metalizado)",
        "components": [
          {
            "iconId": "pacote_flex_vel_manteiga",
            "name": "Pacote flexível",
            "id": "40Pacote flexível",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.002,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "pacote_flexivel_pao___completo",
        "id": 41,
        "name": "Pacote flexível de pão",
        "components": [
          {
            "iconId": "pacote_flexivel_pao___pacote",
            "name": "Pacote flexível",
            "id": "41Pacote flexível",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.005,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "pacote_padaria_com_janela___completo",
        "id": 42,
        "name": "Saco para padaria\ne pastelaria\n(com janela de plástico)",
        "components": [
          {
            "iconId": "pacote_padaria_com_janela___pacote",
            "name": "Saco para padaria e pastelaria",
            "id": "42Saco para padaria e pastelaria",
            "papel": 0.007,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Esta embalagem é de papel e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel e deve ser colocada no contentor azul!",
            "recomendacoes": "Esvaziar; Espalmar"
          },
          {
            "iconId": "pacote_padaria_com_janela___janela",
            "name": "Janela de plástico",
            "id": "42Janela de plástico",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.0006,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado no contentor amarelo!",
            "recomendacoes": "Separar a janela de plástico"
          }
        ]
      },
      {
        "iconId": "pacote_flexivel_esparguete",
        "id": 43,
        "name": "Pacote de esparguete e massas secas",
        "components": [
          {
            "iconId": "pacote_flexivel_esparguete",
            "name": "Pacote flexível",
            "id": "43Pacote flexível",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.006,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "pacote_flexivel_papel_higienico___plastico",
        "id": 44,
        "name": "Pacote de papel higiénico (plástico)",
        "components": [
          {
            "iconId": "pacote_flexivel_papel_higienico___plastico",
            "name": "Pacote flexível",
            "id": "44Pacote flexível",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": 0.026,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "pacote_flexivel_papel_higienico___papel",
        "id": 45,
        "name": "Pacote de papel higiénico (papel)",
        "components": [
          {
            "iconId": "pacote_flexivel_papel_higienico___papel",
            "name": "Pacote flexível",
            "id": "45Pacote flexível",
            "papel": 0.01,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Esta embalagem é de papel e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel e deve ser colocada no contentor azul!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "saco_compras_plastico",
        "id": 46,
        "name": "Saco de asas para as compras (plástico)",
        "components": [
          {
            "iconId": "saco_compras_plastico",
            "name": "Saco de asas\npara as compras",
            "id": "46Saco de asas para as compras",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": 0.024,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      },
      {
        "iconId": "saco_compras_papel",
        "id": 47,
        "name": "Saco de asas para as compras (papel)",
        "components": [
          {
            "iconId": "saco_compras_papel",
            "name": "Saco de asas\npara as compras",
            "id": "47Saco de asas para as compras",
            "papel": 0.059,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Esta embalagem é de papel e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel e deve ser colocada no contentor azul!",
            "recomendacoes": "Esvaziar; Espalmar"
          }
        ]
      }
    ]
  },
  {
    "category": "Multi-embalagem",
    "iconId": "multi_embalagens",
    "packages": [
      {
        "iconId": "caixa_de_pasta_de_dentes___completo",
        "id": 48,
        "name": "Caixa de pasta de dentes",
        "components": [
          {
            "iconId": "caixa_de_pasta_de_dentes___caixa",
            "name": "Caixa",
            "id": "48Caixa",
            "papel": null,
            "cartao": 0.01,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!",
            "recomendacoes": "Separar os materiais de embalagem; Espalmar"
          },
          {
            "iconId": "caixa_de_pasta_de_dentes___tubo",
            "name": "Tubo da pasta de dentes",
            "id": "48Tubo da pasta de dentes",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.01,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes":
                "Separar os materiais de embalagem; Manter a tampa na embalagem"
          }
        ]
      },
      {
        "iconId": "caixa_de_peixe_congelado___caixa",
        "id": 49,
        "name": "Caixa de peixe congelado",
        "components": [
          {
            "iconId": "caixa_de_peixe_congelado___caixa",
            "name": "Caixa",
            "id": "49Caixa",
            "papel": null,
            "cartao": 0.041,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!",
            "recomendacoes":
                "Separar os materiais de embalagem; Esvaziar; Espalmar"
          },
          {
            "iconId": "caixa_de_peixe_congelado___involucro_plastico",
            "name": "Invólucros de plástico",
            "id": "49Invólucros de plástico",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": 0.001,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este material de embalagem é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este material é de plástico e deve ser separado da embalagem e colocado no contentor amarelo!",
            "recomendacoes":
                "Separar os materiais de embalagem; Separar os invólucros de plástico"
          }
        ]
      },
      {
        "iconId": "caixa_de_cereais___caixa",
        "id": 50,
        "name": "Caixa de cereais",
        "components": [
          {
            "iconId": "caixa_de_cereais___caixa",
            "name": "Caixa",
            "id": "50Caixa",
            "papel": null,
            "cartao": 0.065,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!",
            "recomendacoes":
                "Separar os materiais de embalagem; Esvaziar; Espalmar"
          },
          {
            "iconId": "caixa_de_cereais___bolsa_plastico",
            "name": "Bolsa de plástico",
            "id": "50Bolsa de plástico",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.011,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Separar os materiais de embalagem; Esvaziar"
          }
        ]
      },
      {
        "iconId": "cuvete_de_pronto_a_comer___completa",
        "id": 51,
        "name": "Cuvete de\npronto-a-comer",
        "components": [
          {
            "iconId": "cuvete_de_pronto_a_comer___cuvete",
            "name": "Cuvete",
            "id": "51Cuvete",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.024,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!",
            "recomendacoes": "Esvaziar"
          },
          {
            "iconId": "cuvete_de_pronto_a_comer___pelicula",
            "name": "Película de selagem",
            "id": "51Película de selagem",
            "papel": null,
            "cartao": null,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": 0.001,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Amarelo",
            "if_true":
                "Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de plástico e deve ser mantido na embalagem e colocado no contentor amarelo!",
            "recomendacoes": "Manter a película de selagem na embalagem"
          },
          {
            "iconId": "cuvete_de_pronto_a_comer___rotulo",
            "name": "Rótulo",
            "id": "51Rótulo",
            "papel": null,
            "cartao": 0.007,
            "ecal": null,
            "pebd": null,
            "pet": null,
            "pead": null,
            "plasticos_mistos": null,
            "metais_ferrosos": null,
            "metais_nao_ferrosos": null,
            "vidro": null,
            "eps": null,
            "fracao_resto": null,
            "where": "Contentor Azul",
            "if_true":
                "Muito bem! Este componente é de papel e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente é de papel e, sempre que possível, deve ser separado da embalagem e colocado no contentor azul!",
            "recomendacoes": "Separar o rótulo de papel"
          }
        ]
      }
    ]
  }
];
