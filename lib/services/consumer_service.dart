import 'package:simtech/data/consumer_data.dart';
import 'package:simtech/models/category.dart';
import 'package:simtech/models/component.dart';
import 'package:simtech/models/line.dart';
import 'package:simtech/models/matrix.dart';

class ConsumerResults {
  const ConsumerResults({
    required this.isCorrect,
    required this.userImpacts,
    required this.alternativeImpacts,
  });

  final bool isCorrect;
  final Impacts userImpacts;
  final Impacts alternativeImpacts;
}

class Impacts {
  const Impacts({
    required this.economical,
    required this.environmental,
  });

  final double economical;
  final double environmental;
}

extension ComponentLine on Component {
  Line toLine() {
    return Line(
      papel: papel ?? 0,
      cartao: cartao ?? 0,
      ecal: ecal ?? 0,
      filmePlastico: pebd ?? 0,
      pet: pet ?? 0,
      pead: pead ?? 0,
      plasticosMistos: plasticosMistos ?? 0,
      metaisFerrosos: metaisFerrosos ?? 0,
      metaisNaoFerrosos: metaisNaoFerrosos ?? 0,
      vidro: vidro ?? 0,
      eps: eps ?? 0,
    );
  }
}

class ConsumerService {
  static List<Category> getCategories() {
    return categories.map(Category.fromJson).toList();
  }

  static ConsumerResults getResults(Map<Component, Where> components) {
    var isCorrect = true;
    for (final entry in components.entries) {
      if (entry.key.where != entry.value) {
        isCorrect = false;
        break;
      }
    }

    final alternative = isCorrect
        ? {for (final c in components.keys) c: Where.recolhaIndiferenciada}
        : {for (final c in components.keys) c: c.where};

    final userImpacts = _calculateImpacts(components);

    final alternativeImpacts = _calculateImpacts(alternative);

    return ConsumerResults(
      isCorrect: isCorrect,
      userImpacts: userImpacts,
      alternativeImpacts: alternativeImpacts,
    );
  }

  // COEFICIENTES //

  static const cTriagemPC = Line(
    papel: 0.887,
    cartao: 0.745,
  );

  static const cTriagemPM = Line(
    ecal: 0.350,
    filmePlastico: 0.210,
    pet: 0.7588,
    pead: 0.3396,
    plasticosMistos: 0.2091,
    metaisFerrosos: 0.8099,
    metaisNaoFerrosos: 0.6119,
  );

  static const cTriagemVidro = Matrix(reciclagem: Line(vidro: 1));

  static const cTratamentoMecanico = Line(
    cartao: 0.0976139009896262,
    filmePlastico: 0.0830280483357254,
    pet: 0.110089825358778,
    pead: 0.0727384095137607,
    metaisFerrosos: 0.486816103415331,
    metaisNaoFerrosos: 0.147942003542171,
    vidro: 0.264189935230159,
  );

  static const cDigestaoAnaerobia = Line(
    metaisFerrosos: 0.146592792756863,
    metaisNaoFerrosos: 0.0886936111142914,
  );

  static const cAlocaoImpactes = Line(papel: 1, cartao: 1);

  static const cOrigemTriagem = Line.fromValue(1);

  static const cOrigemTMTMBDA = Line.fromValue(1);

  static const cAlocacaoFluxoResiduos = Line(
    papel: 1.34770889487871,
    cartao: 0.925583117363939,
    ecal: 1,
    filmePlastico: 0.872143531633617,
    pet: 0.8,
    pead: 0.944287063267233,
    plasticosMistos: 0.872143531633617,
    metaisFerrosos: 0.884173297966401,
    metaisNaoFerrosos: 0.991080277502478,
    vidro: 1.1981554569275,
    eps: 0.872143531633617,
  );

  static const cSubstituicaoMateriais = Line(
    papel: -1.34770889487871,
    cartao: -0.925583117363939,
    ecal: -0.685,
    filmePlastico: -0.872143531633617,
    pet: -0.8,
    pead: -0.944287063267233,
    plasticosMistos: -0.872143531633617,
    metaisFerrosos: -0.884173297966401,
    metaisNaoFerrosos: -0.991080277502478,
    vidro: -1.1981554569275,
    eps: -0.872143531633617,
  );

  static const cValorizacaoEnergetica = Line(
    papel: 0.2474749528310781,
    cartao: 0.2474749528310781,
    ecal: 0.2474749528310781,
    filmePlastico: 0.2474749528310781,
    pet: 0.2474749528310781,
    pead: 0.2474749528310781,
    plasticosMistos: 0.2474749528310781,
    eps: 0.2474749528310781,
  );

  static const cAterro = Line(
    papel: 0.752525047168922,
    cartao: 0.752525047168922,
    ecal: 0.752525047168922,
    filmePlastico: 0.752525047168922,
    pet: 0.752525047168922,
    pead: 0.752525047168922,
    plasticosMistos: 0.752525047168922,
    metaisFerrosos: 1,
    metaisNaoFerrosos: 1,
    vidro: 1,
    eps: 0.752525047168922,
  );

  // MATRIZES //

  static const mCustosCapital = Matrix(
    recolhaIndiferenciada: Line.fromValue(0.00171988800874197),
    recolhaPapelCartao: Line.fromValue(0.0625035505185231),
    recolhaPlasticoMetal: Line.fromValue(0.0828755149978058),
    recolhaVidro: Line.fromValue(0.0631779349229367),
    triagemPC: Line.fromValue(0.0257289079416138),
    triagemPM: Line.fromValue(0.0257289079416138),
    tratamentoMecanico: Line.fromValue(0.00438374818965225),
    digestaoAnaerobia: Line.fromValue(0.046194627189554),
    reciclagem: Line(
      papel: 0.01042,
      cartao: 0.01042,
      ecal: 0.05029,
      filmePlastico: 0.04581,
      pet: 0.04581,
      pead: 0.04581,
      plasticosMistos: 0.04777,
      metaisFerrosos: 0.02042,
      metaisNaoFerrosos: 0.02042,
      vidro: 0.02553,
      eps: 0.05363,
    ),
  );

  static const mCustosOperacionais = Matrix(
    recolhaIndiferenciada: Line.fromValue(0.00295841259309355),
    recolhaPapelCartao: Line.fromValue(0.0910883772161662),
    recolhaPlasticoMetal: Line.fromValue(0.130096792659209),
    recolhaVidro: Line.fromValue(0.0779550660299788),
    triagemPC: Line.fromValue(0.0107568862628764),
    triagemPM: Line.fromValue(0.013895149256976),
    tratamentoMecanico: Line.fromValue(0.00182577529703806),
    digestaoAnaerobia: Line.fromValue(0.0627800058890157),
    reciclagem: Line(
      papel: 0.01726,
      cartao: 0.01726,
      ecal: 0.02506,
      filmePlastico: 0.0358,
      pet: 0.03504,
      pead: 0.03542,
      plasticosMistos: 0.04114,
      metaisFerrosos: 0.03202,
      metaisNaoFerrosos: 0.03202,
      vidro: 0.029,
      eps: 0.0358,
    ),
  );

  static const mCustosRecursosHumanos = Matrix(
    recolhaIndiferenciada: Line.fromValue(0.00241174172399602),
    recolhaPapelCartao: Line.fromValue(0.0670180814098054),
    recolhaPlasticoMetal: Line.fromValue(0.0891896224737391),
    recolhaVidro: Line.fromValue(0.027415146062618),
    triagemPC: Line.fromValue(0.00883378632742923),
    triagemPM: Line.fromValue(0.0747091604552328),
    tratamentoMecanico: Line.fromValue(0.00359729367411351),
    digestaoAnaerobia: Line.fromValue(0.0137322501472631),
    reciclagem: Line(
      papel: 0.02864,
      cartao: 0.02864,
      ecal: 0.04317,
      filmePlastico: 0.06247,
      pet: 0.06247,
      pead: 0.06247,
      plasticosMistos: 0.07153,
      metaisFerrosos: 0.05188,
      metaisNaoFerrosos: 0.05188,
      vidro: 0.05188,
      eps: 0.06247,
    ),
  );

  static const mCustosTratementoRefugosTarifa = Matrix(
    valorizacaoEnergetica: Line.fromValue(0.0353),
    aterro: Line.fromValue(0.0142710014320122),
  );

  static const mCustosTratementoRefugosTGR = Matrix(
    valorizacaoEnergetica: Line.fromValue(0.0000061512),
    aterro: Line.fromValue(0.022),
  );

  static const mReceitasRecuperaveis = Matrix(
    triagemPC: Line(
      papel: 0.04922,
      cartao: 0.15903,
    ),
    triagemPM: Line(
      ecal: 0.548,
      filmePlastico: 0.48902,
      pet: 0.52493,
      pead: 0.531,
      plasticosMistos: 0.47346,
      metaisFerrosos: 0.631,
      metaisNaoFerrosos: 0.73701,
      eps: 0.531,
    ),
    triagemVidro: Line(vidro: 0.03192),
    tratamentoMecanico: Line(
      cartao: 0.112,
      filmePlastico: 0.136,
      pet: 0.136,
      pead: 0.136,
      metaisFerrosos: 0.131,
      metaisNaoFerrosos: 0.79004,
    ),
    digestaoAnaerobia: Line(cartao: 0.0637122634345201),
    reciclagem: Line(
      papel: 0.1266,
      cartao: 0.1266,
      ecal: 0.1266,
      filmePlastico: 0.705,
      pet: 1.06,
      pead: 0.715,
      plasticosMistos: 0.192,
      metaisFerrosos: 0.14531,
      metaisNaoFerrosos: 0.93981,
      vidro: 0.08083,
      eps: 0.3,
    ),
    valorizacaoEnergetica: Line(
      papel: 0.000612606917270245,
      cartao: 0.000612606917270245,
      ecal: 0.00330286173051334,
      filmePlastico: 0.00330286173051334,
      pet: 0.00330286173051334,
      pead: 0.00330286173051334,
      plasticosMistos: 0.00330286173051334,
      metaisFerrosos: 0.00093,
      metaisNaoFerrosos: 0.00093,
      eps: 0.00330286173051334,
    ),
  );

  static const mEmissoes = Matrix(
    recolhaIndiferenciada: Line.fromValue(0.00199575701377748),
    recolhaPapelCartao: Line.fromValue(0.0480031266949336),
    recolhaPlasticoMetal: Line.fromValue(0.0640622236285195),
    recolhaVidro: Line.fromValue(0.0210119449727451),
    triagemPC: Line.fromValue(0.011715536),
    triagemPM: Line.fromValue(0.022748637),
    tratamentoMecanico: Line.fromValue(0.003885989),
    digestaoAnaerobia: Line.fromValue(0.112748203),
    reciclagem: Line(
      papel: 1.005486866,
      cartao: 0.3637349005,
      ecal: 1.06831129593621,
      filmePlastico: 0.4947713185,
      pet: 0.721965485,
      pead: 0.267577152,
      plasticosMistos: 0.4947713185,
      metaisFerrosos: 0.511741939,
      metaisNaoFerrosos: 0.487985082,
      vidro: 0.811708426,
      eps: 0.4947713185,
    ),
    valorizacaoEnergetica: Line(
      papel: -0.0769341171337302,
      cartao: -0.0769341171337302,
      ecal: 0.385936547143893,
      filmePlastico: 2.75660079206757,
      pet: 2.75660079206757,
      pead: 2.75660079206757,
      plasticosMistos: 2.10949828606757,
      metaisFerrosos: 0.010405127,
      metaisNaoFerrosos: 0.016062373,
      vidro: 0.012794828,
      eps: 2.93761554306757,
    ),
    aterro: Line(
      papel: 1.80367250081299,
      cartao: 1.80367250081299,
      ecal: 1.80367250081299,
      filmePlastico: 0.143176799,
      pet: 0.143176799,
      pead: 0.143176799,
      plasticosMistos: 0.112142798,
      metaisFerrosos: 0.008644353,
      metaisNaoFerrosos: 0.013059245,
      vidro: 0.008041557,
      eps: 0.112142798,
    ),
    substituicao: Line(
      papel: 1.306372826,
      cartao: 0.4701238615,
      ecal: 0.431366677,
      filmePlastico: 2.023176932,
      pet: 3.003695266,
      pead: 1.981628608,
      plasticosMistos: 0.259371186,
      metaisFerrosos: 2.094923282,
      metaisNaoFerrosos: 19.61101644,
      vidro: 1.262072422,
      eps: 3.725643506,
    ),
  );

  static Impacts _calculateImpacts(Map<Component, Where> components) {
    final io = calculateMatrixIO(components);

    final economical = ((io * mCustosCapital).sum() * 0) +
        ((io * mCustosOperacionais).sum() * 0.72) +
        ((io * mCustosRecursosHumanos).sum() * 1.775) +
        ((io * mCustosTratementoRefugosTarifa).sum() * 0.658) +
        ((io * mCustosTratementoRefugosTGR).sum() * 0) +
        ((io * mReceitasRecuperaveis).sum() * 0);

    final environmental = (io * mEmissoes).sum() * 1000;

    return Impacts(economical: economical, environmental: environmental);
  }

  static Matrix calculateMatrixIO(Map<Component, Where> components) {
    var recolhaIndiferenciada = Line.zero;
    var recolhaPapelCartao = Line.zero;
    var recolhaPlasticoMetal = Line.zero;
    var recolhaVidro = Line.zero;

    var recolhaReciclavelPapelCartao = Line.zero;
    var recolhaReiclavelPlasticoMetal = Line.zero;
    var recolhaReiclavelVidro = Line.zero;

    for (final entry in components.entries) {
      recolhaIndiferenciada += entry.value == Where.recolhaIndiferenciada
          ? entry.key.toLine()
          : Line.zero;
      recolhaPapelCartao += entry.value == Where.recolhaPapelCartao
          ? entry.key.toLine()
          : Line.zero;
      recolhaReciclavelPapelCartao +=
          (entry.value == Where.recolhaPapelCartao && entry.key.reciclavel)
              ? entry.key.toLine()
              : Line.zero;
      recolhaPlasticoMetal += entry.value == Where.recolhaPlasticoMetal
          ? entry.key.toLine()
          : Line.zero;
      recolhaReiclavelPlasticoMetal +=
          (entry.value == Where.recolhaPlasticoMetal && entry.key.reciclavel)
              ? entry.key.toLine()
              : Line.zero;
      recolhaVidro +=
          entry.value == Where.recolhaVidro ? entry.key.toLine() : Line.zero;
      recolhaReiclavelVidro +=
          (entry.value == Where.recolhaVidro && entry.key.reciclavel)
              ? entry.key.toLine()
              : Line.zero;
    }

    final triagemPC = recolhaPapelCartao;
    final triagemPM = recolhaPlasticoMetal;
    final triagemVidro = recolhaVidro;
    final tratamentoMecanico = recolhaIndiferenciada;
    final digestaoAnaerobia = recolhaIndiferenciada * cAlocaoImpactes;

    final reciclagem =
        ((recolhaReciclavelPapelCartao * cOrigemTriagem * cTriagemPC) +
                (recolhaReiclavelPlasticoMetal * cOrigemTriagem * cTriagemPM) +
                (recolhaReiclavelVidro *
                    cOrigemTriagem *
                    cTriagemVidro.reciclagem) +
                (tratamentoMecanico * cOrigemTMTMBDA * cTratamentoMecanico) +
                (digestaoAnaerobia * cOrigemTMTMBDA * cDigestaoAnaerobia)) *
            cAlocacaoFluxoResiduos;

    final valorizacaoEnergetica = (recolhaPapelCartao +
            recolhaPlasticoMetal +
            recolhaVidro +
            recolhaIndiferenciada -
            (reciclagem / cAlocacaoFluxoResiduos)) *
        cValorizacaoEnergetica;

    final aterro = (recolhaPapelCartao +
            recolhaPlasticoMetal +
            recolhaVidro +
            recolhaIndiferenciada -
            (reciclagem / cAlocacaoFluxoResiduos)) *
        cAterro;

    final substituicao =
        reciclagem / cAlocacaoFluxoResiduos * cSubstituicaoMateriais;

    return Matrix(
      recolhaIndiferenciada: recolhaIndiferenciada,
      recolhaPapelCartao: recolhaPapelCartao,
      recolhaPlasticoMetal: recolhaPlasticoMetal,
      recolhaVidro: recolhaVidro,
      triagemPC: triagemPC,
      triagemPM: triagemPM,
      triagemVidro: triagemVidro,
      tratamentoMecanico: tratamentoMecanico,
      digestaoAnaerobia: digestaoAnaerobia,
      reciclagem: reciclagem,
      valorizacaoEnergetica: valorizacaoEnergetica,
      aterro: aterro,
      substituicao: substituicao,
    );
  }
}
