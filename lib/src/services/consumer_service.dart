// ignore_for_file: prefer_single_quotes

import 'dart:developer';

import 'package:simtech/src/models/category.dart';
import 'package:simtech/src/models/enums.dart';
import 'package:simtech/src/models/line.dart';
import 'package:simtech/src/models/matrix.dart';

class ConsumerService {
  static List<Category> getCategories() {
    return categories.map((d) => Category.fromJson(d)).toList();
  }

  static final coeficientesTriagemPC = MatrixCoeficiente(
    valorizacaoMaterial: const Line(
      papel: 0.845,
      cartao: 0.732,
    ),
  );

  static final coeficientesTriagemPM = MatrixCoeficiente(
    valorizacaoMaterial: const Line(
      ecal: 0.845,
      filmePlastico: 0.732,
      pet: 0.694,
      pead: 0.673,
      plasticosMistos: 0.138,
      metaisFerrosos: 0.628,
      metaisNaoFerrosos: 0.536,
    ),
  );

  static final coeficientesTriagemVidro =
      MatrixCoeficiente(valorizacaoMaterial: const Line(vidro: 1));

  static final coeficientesTriagemMecanico =
      MatrixCoeficiente(valorizacaoMaterial: const Line(vidro: 1));

  void calculateImpacts() {
    const where = Where.recolhaIndiferenciada;
    const package = Line(pead: 0.03);

    final io = calculateMatrixIO(where: where, package: package);

    final indicadoresEconomicos = Matrix(
      recolhaIndiferenciada: Line.fromValue(38.980),
      recolhaPapelCartao: Line.fromValue(139.640),
      recolhaPlasticoMetal: Line.fromValue(207.420),
      recolhaVidro: Line.fromValue(71.800),
    );

    final indicadoresAmbientais = Matrix(
      recolhaIndiferenciada: Line.fromValue(14.700),
      recolhaPapelCartao: Line.fromValue(47.540),
      recolhaPlasticoMetal: Line.fromValue(64.080),
      recolhaVidro: Line.fromValue(21.060),
      triagemPC: Line.fromValue(26.990),
    );

    final impactesEconomicos = io * indicadoresEconomicos;
    final impactesAmbientais = io * indicadoresAmbientais;

    log(impactesEconomicos.toString());
    log(impactesAmbientais.toString());
  }

  Matrix calculateMatrixIO({required Where where, required Line package}) {
    final recolhaIndiferenciada =
        where == Where.recolhaIndiferenciada ? package : Line.zero;
    final recolhaPapelCartao =
        where == Where.recolhaPapelCartao ? package : Line.zero;
    final recolhaPlasticoMetal =
        where == Where.recolhaPlasticoMetal ? package : Line.zero;
    final recolhaVidro = where == Where.recolhaVidro ? package : Line.zero;
    final recolhaEcocentro =
        where == Where.recolhaEcocentro ? package : Line.zero;
    final recolhaBiorresiduos =
        where == Where.recolhaBiorresiduos ? package : Line.zero;

    final triagemPC = recolhaPapelCartao +
        Line(papel: recolhaEcocentro.papel, cartao: recolhaEcocentro.cartao);
    final triagemPM = recolhaPlasticoMetal +
        Line(
          ecal: recolhaEcocentro.ecal,
          filmePlastico: recolhaEcocentro.filmePlastico,
          pet: recolhaEcocentro.pet,
          pead: recolhaEcocentro.pead,
          plasticosMistos: recolhaEcocentro.plasticosMistos,
          metaisFerrosos: recolhaEcocentro.metaisFerrosos,
          metaisNaoFerrosos: recolhaEcocentro.metaisNaoFerrosos,
          eps: recolhaEcocentro.eps,
        );
    final triagemVidro = recolhaVidro + Line(vidro: recolhaEcocentro.vidro);
    final tratamentoMecanico = recolhaIndiferenciada;

    final valorizacaoMaterial =
        (triagemPC * coeficientesTriagemPC.valorizacaoMaterial) +
            (triagemPM * coeficientesTriagemPM.valorizacaoMaterial) +
            (triagemVidro * coeficientesTriagemVidro.valorizacaoMaterial);

    final valorizacaoOrganica =
        (triagemPC * coeficientesTriagemPC.valorizacaoOrganica) +
            (triagemPM * coeficientesTriagemPM.valorizacaoOrganica) +
            (triagemVidro * coeficientesTriagemVidro.valorizacaoOrganica);

    final valorizacaoEnergetica =
        (triagemPC * coeficientesTriagemPC.valorizacaoEnergetica) +
            (triagemPM * coeficientesTriagemPM.valorizacaoEnergetica) +
            (triagemVidro * coeficientesTriagemVidro.valorizacaoEnergetica);

    final aterro = (triagemPC * coeficientesTriagemPC.aterro) +
        (triagemPM * coeficientesTriagemPM.aterro) +
        (triagemVidro * coeficientesTriagemVidro.aterro);

    return Matrix(
      recolhaIndiferenciada: recolhaIndiferenciada,
      recolhaPapelCartao: recolhaPapelCartao,
      recolhaPlasticoMetal: recolhaPlasticoMetal,
      recolhaVidro: recolhaVidro,
      recolhaEcocentro: recolhaEcocentro,
      recolhaBiorresiduos: recolhaBiorresiduos,
      triagemPC: triagemPC,
      triagemPM: triagemPM,
      triagemVidro: triagemVidro,
      tratamentoMecanico: tratamentoMecanico,
      valorizacaoMaterial: valorizacaoMaterial,
      valorizacaoOrganica: valorizacaoOrganica,
      valorizacaoEnergetica: valorizacaoEnergetica,
      aterro: aterro,
    );
  }
}

const categories = [
  {
    "category": "Garrafas",
    "iconId": "garrafas",
    "packages": [
      {
        "package": "Garrafa de iogurte líquido (grande)",
        "iconId": "garrafa_de_iogurte_l_quido___completa",
        "components": [
          {
            "component": "Corpo da garrafa",
            "iconId": "garrafa_de_iogurte_l_quido__grande_",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_garrafa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          },
          {
            "component": "Manga de plástico",
            "iconId": "manga",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Retira o rótulo que envolve a embalagem sempre que possível. Usa o picotado para ser mais fácil."
          }
        ]
      },
      {
        "package": "Garrafão de água",
        "iconId": "garrafao_de_agua___completa",
        "components": [
          {
            "component": "Corpo do garrafão",
            "iconId": "garrafao_de_agua",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem, mantendo a tampa na embalagem espalmada."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_garrafa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          },
          {
            "component": "Rótulo",
            "iconId": "manga",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "O rótulo de papel também é reciclável. Separa-o da embalagem e deposita-o no ecoponto azul."
          }
        ]
      },
      {
        "package": "Garrafa de água (1,5L)",
        "iconId": "garrafa_de_agua___completa",
        "components": [
          {
            "component": "Corpo da garrafa",
            "iconId": "garrafa_de_agua",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem, mantendo a tampa na embalagem espalmada."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_garrafa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          },
          {
            "component": "Rótulo",
            "iconId": "manga",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "O rótulo de papel também é reciclável. Separa-o da embalagem e deposita-o no ecoponto azul."
          }
        ]
      },
      {
        "package": "Garrafa de óleo",
        "iconId": "garrafa_de_oleo___completa",
        "components": [
          {
            "component": "Corpo da garrafa",
            "iconId": "garrafa_de_oleo",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem, mantendo a tampa na embalagem espalmada."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_garrafa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          },
          {
            "component": "Rótulo",
            "iconId": "manga",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "O rótulo de papel também é reciclável. Separa-o da embalagem e deposita-o no ecoponto azul."
          }
        ]
      },
      {
        "package": "Garrafa de azeite",
        "iconId": "garrafa_de_azeite___completa",
        "components": [
          {
            "component": "Corpo da garrafa",
            "iconId": "garrafa_de_azeite",
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
            "where": "recolhaVidro",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e por isso deve ir para o contentor verde!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_garrafa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de metal e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "As tampas metálicas também são recicláveis. Separa-as da embalagem e deposita-as no ecoponto amarelo."
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
        "package": "Boião de doce ou de conservas (vidro)",
        "iconId": "boiao_de_doce_vidro___completa",
        "components": [
          {
            "component": "Boião",
            "iconId": "boiao_de_doce_vidro",
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
            "where": "recolhaVidro",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e por isso deve ir para o contentor verde!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_boiao___frasco",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de metal e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "As tampas metálicas também são recicláveis. Separa-as da embalagem e deposita-as no ecoponto amarelo."
          }
        ]
      },
      {
        "package": "Boião de doce ou de conservas (plástico)",
        "iconId": "boiao_de_doce_plastico___completa",
        "components": [
          {
            "component": "Boião",
            "iconId": "boiao_de_doce_plastico",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_boiao___frasco",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          },
          {
            "component": "Película de selagem",
            "iconId": "pelicula_de_selagem",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de metal e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "As películas de selagem são recicláveis desde que sejam depositadas isoladamente no ecoponto. Separa-as da restante embalagem e coloca-as no ecoponto amarelo."
          }
        ]
      },
      {
        "package": "Boião de creme hidratante",
        "iconId": "boiao_de_creme_hidratante___completa",
        "components": [
          {
            "component": "Boião",
            "iconId": "boiao_de_creme_hidratante",
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
            "where": "recolhaVidro",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e por isso deve ir para o contentor verde!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_boiao___frasco",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "As tampas de plástico também são recicláveis. Separa-as da embalagem e deposita-as no ecoponto amarelo."
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
        "package": "Copos de iogurte sólido",
        "iconId": "copo_iogurte_solido",
        "components": [
          {
            "component": "Copo",
            "iconId": "copo_iogurte_solido",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          },
          {
            "component": "Película de selagem",
            "iconId": "pelicula_de_selagem",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a película de selagem na embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          }
        ]
      },
      {
        "package": "Balde de iogurte sólido",
        "iconId": "balde_iogurte_solido",
        "components": [
          {
            "component": "Balde",
            "iconId": "balde_iogurte_solido",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_boiao___frasco",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          }
        ]
      },
      {
        "package": "Copo de gelado",
        "iconId": "copo_de_gelado",
        "components": [
          {
            "component": "Copo",
            "iconId": "copo_de_gelado",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_boiao___frasco",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          },
          {
            "component": "Película de selagem",
            "iconId": "pelicula_de_selagem",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "As películas de selagem são recicláveis desde que sejam depositadas isoladamente no ecoponto. Separa-as da restante embalagem e coloca-as no ecoponto amarelo."
          }
        ]
      }
    ]
  },
  {
    "category": "Pacotes para bebidas",
    "iconId": "pacotes_bebidas",
    "packages": [
      {
        "package": "Pacote de leite sem tampa",
        "iconId": "pacote_de_leite_sem_tampa",
        "components": [
          {
            "component": "Pacote para bebidas",
            "iconId": "pacote_de_leite_sem_tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de ECAL e por isso deve ir para o contentor amarelo! As embalagens de ECAL, por serem constituídas por diferentes materiais (plástico, alumínio e cartão), devem ir para este ecoponto, porque depois vão para uma linha de triagem que separa as embalagens pelo seu tipo de material.",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Pacote de leite com tampa",
        "iconId": "pacote_de_leite_com_tampa",
        "components": [
          {
            "component": "Pacote para bebidas",
            "iconId": "pacote_de_leite_com_tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de ECAL e por isso deve ir para o contentor amarelo! As embalagens de ECAL, por serem constituídas por diferentes materiais (plástico, alumínio e cartão), devem ir para este ecoponto, porque depois vão para uma linha de triagem que separa as embalagens pelo seu tipo de material.",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem, mantendo a tampa na embalagem espalmada."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_garrafa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          }
        ]
      },
      {
        "package": "Pacote flexível para sumo",
        "iconId": "pacote_flexivel_para_sumo___completa",
        "components": [
          {
            "component": "Pacote para bebidas",
            "iconId": "pacote_flexivel_para_sumo",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem, mantendo a tampa na embalagem espalmada."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_garrafa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
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
        "package": "Caixa de sobremesa refrigerada",
        "iconId": "caixa_de_sobremesa_refrigerada___completa",
        "components": [
          {
            "component": "Caixa",
            "iconId": "caixa_de_sobremesa_refrigerada___caixa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "caixa_de_sobremesa_refrigerada___tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          }
        ]
      },
      {
        "package": "Caixa de ovos (cartão)",
        "iconId": "caixa_de_ovos__cartao_",
        "components": [
          {
            "component": "Caixa",
            "iconId": "caixa_de_ovos__cartao_",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Caixa de ovos (plástico)",
        "iconId": "caixa_de_ovos__plastico_",
        "components": [
          {
            "component": "Caixa",
            "iconId": "caixa_de_ovos__plastico_",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          }
        ]
      },
      {
        "package": "Caixa de manteiga e semelhantes",
        "iconId": "caixa_de_manteiga___completa",
        "components": [
          {
            "component": "Caixa",
            "iconId": "caixa_de_manteiga___caixa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "caixa_de_manteiga___tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          },
          {
            "component": "Película de selagem",
            "iconId": "caixa_de_manteiga___pelicula",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a película de selagem na embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          }
        ]
      },
      {
        "package": "Caixa de bolo fresco",
        "iconId": "caixa_de_bolo_fresco",
        "components": [
          {
            "component": "Caixa",
            "iconId": "caixa_de_bolo_fresco",
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
            "where": "recolhaIndiferenciada",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Os resíduos desta embalagem de papel ou cartão vão ficar contaminados com sujidade e gordura, por isso devem ser colocados no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).",
            "recomendacoes": ""
          }
        ]
      },
      {
        "package": "Caixa de detergente em pó",
        "iconId": "caixa_de_detergente_em_po",
        "components": [
          {
            "component": "Caixa",
            "iconId": "caixa_de_detergente_em_po",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Caixa de sapatos",
        "iconId": "caixa_de_sapatos",
        "components": [
          {
            "component": "Caixa",
            "iconId": "caixa_de_sapatos",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Caixa de folha de alumínio ou de película",
        "iconId": "caixa_de_folha_de_aluminio_ou_de_pelicula___caixa",
        "components": [
          {
            "component": "Caixa",
            "iconId": "caixa_de_folha_de_aluminio_ou_de_pelicula___caixa",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          },
          {
            "component": "Rolo",
            "iconId": "caixa_de_folha_de_aluminio_ou_de_pelicula___rolo",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Deposita o rolo e a caixa separadamente no ecoponto azul, e facilita o processo de separação na central de triagem."
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
        "package": "Cuvete de legumes frescos",
        "iconId": "cuvete_de_legumes___completo",
        "components": [
          {
            "component": "Cuvete",
            "iconId": "cuvete_de_legumes___cuvete",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Filme de selagem",
            "iconId": "filme_de_selagem",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Os filmes de selagem são recicláveis desde que sejam depositados isoladamente no ecoponto. Separa-os da restante embalagem e coloca-os no ecoponto amarelo."
          }
        ]
      },
      {
        "package": "Cuvete de carne ou peixe frescos",
        "iconId": "cuvete_de_carne_ou_peixe_frescos___completo",
        "components": [
          {
            "component": "Cuvete",
            "iconId": "cuvete_de_legumes___cuvete",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Filme de selagem",
            "iconId": "filme_de_selagem",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Os filmes de selagem são recicláveis desde que sejam depositados isoladamente no ecoponto. Separa-os da restante embalagem e coloca-os no ecoponto amarelo."
          }
        ]
      },
      {
        "package": "Tabuleiro metálico de pronto-a-comer",
        "iconId": "tabuleiro_met_lico_de_pronto_a_comer",
        "components": [
          {
            "component": "Tabuleiro",
            "iconId": "tabuleiro_met_lico_de_pronto_a_comer",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de metal e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          },
          {
            "component": "Filme de selagem",
            "iconId": "filme_de_selagem",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Os filmes de selagem são recicláveis desde que sejam depositados isoladamente no ecoponto. Separa-os da restante embalagem e coloca-os no ecoponto amarelo."
          }
        ]
      },
      {
        "package": "Tubo de creme hidratante",
        "iconId": "tubo_de_creme_hidratante___completo",
        "components": [
          {
            "component": "Tubo",
            "iconId": "tubo_de_creme_hidratante___tubo",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_garrafa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
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
        "package": "Frasco de molho de tempero",
        "iconId": "frasco_de_molho_de_tempero___completo",
        "components": [
          {
            "component": "Frasco",
            "iconId": "frasco_de_molho_de_tempero___frasco",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_boiao___frasco",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          }
        ]
      },
      {
        "package": "Frasco de desodorizante roll-on",
        "iconId": "frasco_de_desodorizante_roll_on___completo",
        "components": [
          {
            "component": "Frasco",
            "iconId": "frasco_de_desodorizante_roll_on___frasco",
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
            "where": "recolhaVidro",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e por isso deve ir para o contentor verde!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "frasco_de_desodorizante_roll_on___tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "As tampas de plástico também são recicláveis. Separa-as da embalagem e deposita-as no ecoponto amarelo."
          }
        ]
      },
      {
        "package": "Frasco de café ou outras misturas solúveis",
        "iconId": "frasco_de_cafe___completo",
        "components": [
          {
            "component": "Frasco",
            "iconId": "frasco_de_cafe___frasco",
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
            "where": "recolhaVidro",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e por isso deve ir para o contentor verde!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "frasco_de_cafe___tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "As tampas de plástico também são recicláveis. Separa-as da embalagem e deposita-as no ecoponto amarelo."
          },
          {
            "component": "Película de selagem",
            "iconId": "pelicula_de_selagem",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "As películas de selagem são recicláveis desde que sejam depositadas isoladamente no ecoponto. Separa-as da restante embalagem e coloca-as no ecoponto amarelo."
          }
        ]
      },
      {
        "package": "Frasco de champô ou amaciador",
        "iconId": "frasco_de_champo_ou_amaciador___completo",
        "components": [
          {
            "component": "Frasco",
            "iconId": "frasco_de_champo_ou_amaciador___frasco",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "frasco_de_champo_ou_amaciador___tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          }
        ]
      },
      {
        "package": "Frasco de produto de limpeza com dispensador",
        "iconId": "frasco_de_produto_de_limpeza_com_dispensador___completo",
        "components": [
          {
            "component": "Frasco",
            "iconId": "frasco_de_produto_de_limpeza_com_dispensador___frasco",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa com dispensador",
            "iconId": "frasco_de_produto_de_limpeza_com_dispensador___tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Separa o dispensador da embalagem e deposita tudo no ecoponto amarelo separadamente. Desta forma estás a facilitar a reciclagem de todos os componentes da embalagem."
          }
        ]
      },
      {
        "package": "Frasco de sal",
        "iconId": "frasco_sal___completo",
        "components": [
          {
            "component": "Frasco",
            "iconId": "frasco_sal___frasco",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "frasco_sal___tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na garrafa/embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          }
        ]
      },
      {
        "package": "Frasco de perfume",
        "iconId": "frasco_de_perfume___completo",
        "components": [
          {
            "component": "Frasco",
            "iconId": "frasco_de_perfume___frasco",
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
            "where": "recolhaVidro",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de vidro e por isso deve ir para o contentor verde!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "tampa_garrafa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "As tampas de plástico também são recicláveis. Separa-as da embalagem e deposita-as no ecoponto amarelo."
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
        "package": "Lata de peixe em conserva",
        "iconId": "lata_conserva___completo",
        "components": [
          {
            "component": "Lata",
            "iconId": "lata_conserva___lata",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de metal e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa metálica\n(com anilha)",
            "iconId": "lata_conserva___tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de metal e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Não separes as anilhas do resto da embalagem. Por serem pequenas perdem-se facilmente no processo de recolha e podem acabar a poluir o meio natural."
          }
        ]
      },
      {
        "package": "Lata de refrigerante",
        "iconId": "lata_de_refrigerante___completo",
        "components": [
          {
            "component": "Lata",
            "iconId": "lata_de_refrigerante___lata",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de metal e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          },
          {
            "component": "Anilha",
            "iconId": "lata_de_refrigerante___anilha",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de metal e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Não separes as anilhas do resto da embalagem. Por serem pequenas perdem-se facilmente no processo de recolha e podem acabar a poluir o meio natural."
          }
        ]
      },
      {
        "package": "Lata de espuma de barbear",
        "iconId": "lata_de_espuma_barbear___completo",
        "components": [
          {
            "component": "Lata",
            "iconId": "lata_de_espuma_barbear___lata",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de metal e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa",
            "iconId": "lata_de_espuma_barbear___tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "As tampas de plástico são recicláveis desde que depositadas isoladamente no ecoponto. Separa-as da restante embalagem e coloca-as no ecoponto amarelo."
          }
        ]
      },
      {
        "package": "Lata de ração para animal",
        "iconId": "lata_de_ra_ao_para_animal___completo",
        "components": [
          {
            "component": "Lata",
            "iconId": "lata_de_ra_ao_para_animal___lata",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de metal e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Tampa metálica\n(com anilha)",
            "iconId": "lata_de_ra_ao_para_animal___tampa",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de metal e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Não separes as anilhas do resto da embalagem. Por serem pequenas perdem-se facilmente no processo de recolha e podem acabar a poluir o meio natural."
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
        "package": "Pacote flexível de açúcar e semelhantes (papel)",
        "iconId": "pacote_flex_vel_de_a_ucar___papel",
        "components": [
          {
            "component": "Pacote flexível",
            "iconId": "pacote_flex_vel_de_a_ucar___papel",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Pacote flexível de açúcar e semelhantes (plástico)",
        "iconId": "pacote_flex_vel_de_a_ucar___plastico",
        "components": [
          {
            "component": "Pacote flexível",
            "iconId": "pacote_flex_vel_de_a_ucar___plastico",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Pacote flexível de manteiga e semelhantes",
        "iconId": "pacote_flex_vel_manteiga",
        "components": [
          {
            "component": "Pacote flexível",
            "iconId": "pacote_flex_vel_manteiga",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Pacote flexível de pão",
        "iconId": "pacote_flexivel_pao___completo",
        "components": [
          {
            "component": "Pacote flexível",
            "iconId": "pacote_flexivel_pao___pacote",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Saco para padaria e pastelaria (com janela de plástico)",
        "iconId": "pacote_padaria_com_janela___completo",
        "components": [
          {
            "component": "Saco para padaria e pastelaria",
            "iconId": "pacote_padaria_com_janela___pacote",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          },
          {
            "component": "Janela de plástico",
            "iconId": "pacote_padaria_com_janela___janela",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "A janela de plástico deve ser separada do saco e colocada no ecoponto amarelo."
          }
        ]
      },
      {
        "package": "Pacote flexível de esparguete e massas secas",
        "iconId": "pacote_flexivel_esparguete",
        "components": [
          {
            "component": "Pacote flexível",
            "iconId": "pacote_flexivel_esparguete",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Pacote flexível de papel higiénico (plástico)",
        "iconId": "pacote_flexivel_papel_higienico___plastico",
        "components": [
          {
            "component": "Pacote flexível",
            "iconId": "pacote_flexivel_papel_higienico___plastico",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Pacote flexível de papel higiénico (papel)",
        "iconId": "pacote_flexivel_papel_higienico___papel",
        "components": [
          {
            "component": "Pacote flexível",
            "iconId": "pacote_flexivel_papel_higienico___papel",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Saco de asas para as compras (plástico)",
        "iconId": "saco_compras_plastico",
        "components": [
          {
            "component": "Saco de asas\npara as compras",
            "iconId": "saco_compras_plastico",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          }
        ]
      },
      {
        "package": "Saco de asas para as compras (papel)",
        "iconId": "saco_compras_papel",
        "components": [
          {
            "component": "Saco de asas\npara as compras",
            "iconId": "saco_compras_papel",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
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
        "package": "Caixa de pasta de dentes",
        "iconId": "caixa_de_pasta_de_dentes___completo",
        "components": [
          {
            "component": "Caixa",
            "iconId": "caixa_de_pasta_de_dentes___caixa",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "A caixa de cartão que envolve a tua embalagem é reciclável se depositada no ecoponto correto. Espalma-a e coloca-a no ecoponto azul."
          },
          {
            "component": "Tubo da pasta de dentes",
            "iconId": "caixa_de_pasta_de_dentes___tubo",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a tampa na embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          }
        ]
      },
      {
        "package": "Caixa de peixe congelado",
        "iconId": "caixa_de_peixe_congelado___caixa",
        "components": [
          {
            "component": "Caixa",
            "iconId": "caixa_de_peixe_congelado___caixa",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          },
          {
            "component": "Invólucros de plástico",
            "iconId": "caixa_de_peixe_congelado___involucro_plastico",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Separa os invólucros de plástico e deposita-os no ecoponto amarelo."
          }
        ]
      },
      {
        "package": "Caixa de cereais",
        "iconId": "caixa_de_cereais___caixa",
        "components": [
          {
            "component": "Caixa",
            "iconId": "caixa_de_cereais___caixa",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar e espalmar a embalagem."
          },
          {
            "component": "Bolsa de plástico",
            "iconId": "caixa_de_cereais___bolsa_plastico",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Depois de vazia, coloca a bolsa de plástico no ecoponto amarelo."
          }
        ]
      },
      {
        "package": "Cuvete de pronto-a-comer",
        "iconId": "cuvete_de_pronto_a_comer___completa",
        "components": [
          {
            "component": "Cuvete",
            "iconId": "cuvete_de_pronto_a_comer___cuvete",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste a embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Esta embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Antes de colocar no ecoponto, esvaziar a embalagem."
          },
          {
            "component": "Película de selagem",
            "iconId": "cuvete_de_pronto_a_comer___pelicula",
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
            "where": "recolhaPlasticoMetal",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de plástico e por isso deve ir para o contentor amarelo!",
            "recomendacoes":
                "Mantém a película de selagem na embalagem quando a depositas no ecoponto. Evitas que se perca no processo de recolha e que acabe abandonada no meio natural."
          },
          {
            "component": "Rótulo",
            "iconId": "cuvete_de_pronto_a_comer___rotulo",
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
            "where": "recolhaPapelCartao",
            "if_true":
                "Muito bem! Depositaste o componente de embalagem no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.",
            "if_false":
                "O destino selecionado não está correto. Este componente de embalagem é de papel ou cartão, e por isso deve ir para o contentor azul!",
            "recomendacoes":
                "O rótulo de papel também é reciclável. Separa-o da embalagem e deposita-o no ecoponto azul."
          }
        ]
      }
    ]
  }
];
