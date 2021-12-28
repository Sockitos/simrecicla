// ignore_for_file: prefer_single_quotes

import 'dart:developer';

import 'package:simtech/src/models/category.dart';
import 'package:simtech/src/models/component.dart';
import 'package:simtech/src/models/enums.dart';
import 'package:simtech/src/models/line.dart';
import 'package:simtech/src/models/matrix.dart';
import 'package:simtech/src/models/package.dart';

class ConsumerService {
  static List<Category> getCategories() {
    return categories.map((d) => Category.fromJson(d)).toList();
  }

  static Package getTestPackage() {
    return const Package(
      package: "Garrafa de iogurte líquido",
      svgPath: "assets/svgs/test_package.svg",
      components: [
        Component(
          component: "Corpo da garrafa",
          svgPath: "assets/svgs/body.svg",
          pead: 0.027,
          where: Where.recolhaPlasticoMetal,
          ifTrue: '',
          ifFalse: '',
          recomendacoes: '',
        ),
        Component(
          component: "Tampa",
          svgPath: "assets/svgs/lid.svg",
          pead: 0.003,
          where: Where.recolhaPlasticoMetal,
          ifTrue: '',
          ifFalse: '',
          recomendacoes: '',
        ),
        Component(
          component: "Manga de plástico",
          svgPath: "assets/svgs/label.svg",
          plasticosMistos: 0.001,
          where: Where.recolhaPlasticoMetal,
          ifTrue: '',
          ifFalse: '',
          recomendacoes: '',
        ),
      ],
    );
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
    "icon": 'assets/svgs/cat_bottles.svg',
    "packages": [
      {
        "package": "Garrafa de iogurte líquido (grande)",
        "components": [
          {
            "component": "Corpo da garrafa",
            "svgPath": "assets/svgs/body.svg",
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
            "svgPath": "assets/svgs/lid.svg",
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
            "svgPath": "assets/svgs/label.svg",
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
        "components": [
          {
            "component": "Corpo do garrafão",
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
        "components": [
          {
            "component": "Corpo da garrafa",
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
        "components": [
          {
            "component": "Corpo da garrafa",
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
        "components": [
          {
            "component": "Corpo da garrafa",
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
    "icon": 'assets/svgs/cat_boios.svg',
    "packages": [
      {
        "package": "Boião de doce ou de conservas (vidro)",
        "components": [
          {
            "component": "Boião",
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
        "components": [
          {
            "component": "Boião",
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
        "components": [
          {
            "component": "Boião",
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
    "icon": 'assets/svgs/cat_cups.svg',
    "packages": [
      {
        "package": "Copos de iogurte sólido",
        "components": [
          {
            "component": "Copo",
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
        "components": [
          {
            "component": "Balde",
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
        "components": [
          {
            "component": "Copo",
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
    "icon": 'assets/svgs/cat_packets.svg',
    "packages": [
      {
        "package": "Pacote de leite sem tampa",
        "components": [
          {
            "component": "Pacote para bebidas",
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
        "components": [
          {
            "component": "Pacote para bebidas",
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
        "components": [
          {
            "component": "Pacote para bebidas",
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
    "icon": 'assets/svgs/cat_boxes.svg',
    "packages": [
      {
        "package": "Caixa de sobremesa refrigerada",
        "components": [
          {
            "component": "Caixa",
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
        "components": [
          {
            "component": "Caixa",
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
        "components": [
          {
            "component": "Caixa",
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
        "components": [
          {
            "component": "Caixa",
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
        "components": [
          {
            "component": "Caixa",
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
        "components": [
          {
            "component": "Caixa",
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
        "components": [
          {
            "component": "Caixa",
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
        "components": [
          {
            "component": "Caixa",
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
    "icon": 'assets/svgs/cat_circle.svg',
    "packages": [
      {
        "package": "Cuvete de legumes frescos",
        "components": [
          {
            "component": "Cuvete",
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
        "components": [
          {
            "component": "Cuvete",
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
        "components": [
          {
            "component": "Tabuleiro",
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
        "components": [
          {
            "component": "Tubo",
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
    "icon": 'assets/svgs/cat_cups.svg',
    "packages": [
      {
        "package": "Frasco de molho de tempero",
        "components": [
          {
            "component": "Frasco",
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
        "components": [
          {
            "component": "Frasco",
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
        "components": [
          {
            "component": "Frasco",
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
        "components": [
          {
            "component": "Frasco",
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
        "components": [
          {
            "component": "Frasco",
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
        "components": [
          {
            "component": "Frasco",
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
        "components": [
          {
            "component": "Frasco",
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
    "icon": 'assets/svgs/cat_packets.svg',
    "packages": [
      {
        "package": "Lata de peixe em conserva",
        "components": [
          {
            "component": "Lata",
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
            "component": "Tampa metálica removível (com anilha)",
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
        "components": [
          {
            "component": "Lata",
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
        "components": [
          {
            "component": "Lata",
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
        "components": [
          {
            "component": "Lata",
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
            "component": "Tampa metálica removível (com anilha)",
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
    "icon": 'assets/svgs/cat_boxes.svg',
    "packages": [
      {
        "package": "Pacote flexível de açúcar e semelhantes (papel)",
        "components": [
          {
            "component": "Pacote flexível",
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
        "components": [
          {
            "component": "Pacote flexível",
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
        "components": [
          {
            "component": "Pacote flexível",
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
        "components": [
          {
            "component": "Pacote flexível",
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
        "components": [
          {
            "component": "Saco para padaria e pastelaria",
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
        "components": [
          {
            "component": "Pacote flexível",
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
        "components": [
          {
            "component": "Pacote flexível",
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
        "components": [
          {
            "component": "Pacote flexível",
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
        "components": [
          {
            "component": "Saco de asas para as compras",
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
        "components": [
          {
            "component": "Saco de asas para as compras",
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
    "icon": 'assets/svgs/cat_boios.svg',
    "packages": [
      {
        "package": "Caixa de pasta de dentes",
        "components": [
          {
            "component": "Caixa",
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
        "components": [
          {
            "component": "Caixa",
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
        "components": [
          {
            "component": "Caixa",
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
        "components": [
          {
            "component": "Cuvete",
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
