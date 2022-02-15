import 'package:simtech/src/data/consumer_data.dart';
import 'package:simtech/src/models/category.dart';
import 'package:simtech/src/models/component.dart';
import 'package:simtech/src/models/line.dart';
import 'package:simtech/src/models/matrix.dart';

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
      fracaoResto: fracaoResto ?? 0,
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

  static final coeficientesTriagemPC = MatrixCoeficiente(
    reciclagem: const Line(
      papel: 0.844802426423779,
      cartao: 0.731710809985242,
    ),
  );

  static final coeficientesTriagemPM = MatrixCoeficiente(
    reciclagem: const Line(
      ecal: 0.65,
      filmePlastico: 0.452,
      pet: 0.615,
      pead: 0.672,
      plasticosMistos: 0.137,
      metaisFerrosos: 0.628,
      metaisNaoFerrosos: 0.536,
    ),
  );

  static const coeficientesTriagemVidro = Matrix(reciclagem: Line(vidro: 1));

  static final coeficientesTratamentoMecanico = MatrixCoeficiente(
    reciclagem: const Line(
      cartao: 0.0976139009896262,
      filmePlastico: 0.0830280483357254,
      pet: 0.0945477323669503,
      pead: 0.0727384095137607,
      metaisFerrosos: 0.486816103415331,
      metaisNaoFerrosos: 0.147942003542171,
      vidro: 0.264189935230159,
    ),
  );

  static final origemTriagem = Line.fromValue(1);

  static final origemTMTMB = Line.fromValue(1);

  static const eficienciaReciclagem = Line(
    papel: 1.34770889487871,
    cartao: 0.915674864130359,
    ecal: 0.685,
    filmePlastico: 0.872366556447804,
    pet: 0.8,
    pead: 0.944733112895607,
    plasticosMistos: 0.872366556447804,
    metaisFerrosos: 0.883866904134097,
    metaisNaoFerrosos: 0.991099999999996,
    vidro: 1.19760479041916,
  );

  static final substituicaoMateriais = Line.fromValue(-1);

  static Impacts _calculateImpacts(Map<Component, Where> components) {
    final io = calculateMatrixIO(components);

    final custosCapital = Matrix(
      recolhaIndiferenciada: Line.fromValue(0.00171988800874197),
      recolhaPapelCartao: Line.fromValue(0.062364167852818),
      recolhaPlasticoMetal: Line.fromValue(0.0828409688366877),
      recolhaVidro: Line.fromValue(0.0631716120932816),
      triagemPC: Line.fromValue(0.0257289079416138),
      triagemPM: Line.fromValue(0.0257289079416138),
      tratamentoMecanico: Line.fromValue(0.00017),
      valorizacaoEnergetica: Line.fromValue(0.00881629926442008),
    );

    final custosOperacionais = Matrix(
      recolhaIndiferenciada: Line.fromValue(0.00295841259309355),
      recolhaPapelCartao: Line.fromValue(0.090428987111979),
      recolhaPlasticoMetal: Line.fromValue(0.129933362029843),
      recolhaVidro: Line.fromValue(0.0779251540514413),
      triagemPC: Line.fromValue(0.0107568862628764),
      triagemPM: Line.fromValue(0.013895149256976),
      tratamentoMecanico: Line.fromValue(0.00023),
      valorizacaoEnergetica: Line.fromValue(0.0015727069123326),
      aterro: Line.fromValue(0.06776),
    );

    final custosRH = Matrix(
      recolhaIndiferenciada: Line.fromValue(0.00241174172399602),
      recolhaPapelCartao: Line.fromValue(0.0667386506945778),
      recolhaPlasticoMetal: Line.fromValue(0.0891203652353246),
      recolhaVidro: Line.fromValue(0.0274024702194357),
      triagemPC: Line.fromValue(0.00883378632742923),
      triagemPM: Line.fromValue(0.0747091604552328),
      tratamentoMecanico: Line.fromValue(0.00045),
      valorizacaoEnergetica: Line.fromValue(0.0011208),
    );

    final custosTratamento = Matrix(
      valorizacaoEnergetica: Line.fromValue(0.002166013248),
    );

    // ignore: unused_local_variable
    const receitasRecuperaveis = Matrix(
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
        fracaoResto: 0.00720431096736,
      ),
    );

    final emissoes = Matrix(
      recolhaIndiferenciada: Line.fromValue(0.0136623514404446),
      recolhaPapelCartao: Line.fromValue(0.047327167),
      recolhaPlasticoMetal: Line.fromValue(0.063852493),
      recolhaVidro: Line.fromValue(0.020903692),
      triagemPC: Line.fromValue(0.013966866),
      triagemPM: Line.fromValue(0.027895541),
      tratamentoMecanico: Line.fromValue(0.00455646),
      reciclagem: const Line(
        papel: 1.042240371,
        cartao: 0.72498961,
        ecal: 0.677353573,
        filmePlastico: 0.5157072885,
        pet: 0.747955905,
        pead: 0.283458672,
        plasticosMistos: 0.5157072885,
        metaisFerrosos: 0.525241982,
        metaisNaoFerrosos: 0.491350856,
        vidro: 0.820031838,
      ),
      valorizacaoEnergetica: const Line(
        papel: 0.00700696156884493,
        cartao: 0.00700696156884493,
        ecal: 0.00700696156884493,
        filmePlastico: 2.70142960393549,
        pet: 2.70142960393549,
        pead: 2.70142960393549,
        plasticosMistos: 2.70142960393549,
        eps: 2.70142960393549,
        fracaoResto: 0.271876081813333,
      ),
      aterro: const Line(
        papel: 1.283095,
        cartao: 1.283095,
        ecal: 0.960741,
      ),
      substituicao: const Line(
        papel: 1.374576611,
        cartao: 0.653545797,
        ecal: 0.536670208,
        filmePlastico: 2.045467888,
        pet: 2.814709608,
        pead: 1.992255357,
        plasticosMistos: 0.255034653,
        metaisFerrosos: 2.130689884,
        metaisNaoFerrosos: 19.59503405,
        vidro: 1.270669651,
      ),
    );

    final economical = (io * custosCapital).sum() +
        (io * custosOperacionais).sum() +
        (io * custosRH).sum() +
        (io * custosTratamento).sum();

    final environmental = (io * emissoes).sum();
    return Impacts(economical: economical, environmental: environmental);
  }

  static Matrix calculateMatrixIO(Map<Component, Where> components) {
    var recolhaIndiferenciada = Line.zero;
    var recolhaPapelCartao = Line.zero;
    var recolhaPlasticoMetal = Line.zero;
    var recolhaVidro = Line.zero;
    var recolhaEcocentro = Line.zero;

    for (final entry in components.entries) {
      recolhaIndiferenciada += entry.value == Where.recolhaIndiferenciada
          ? entry.key.toLine()
          : Line.zero;
      recolhaPapelCartao += entry.value == Where.recolhaPapelCartao
          ? entry.key.toLine()
          : Line.zero;
      recolhaPlasticoMetal += entry.value == Where.recolhaPlasticoMetal
          ? entry.key.toLine()
          : Line.zero;
      recolhaVidro +=
          entry.value == Where.recolhaVidro ? entry.key.toLine() : Line.zero;
      recolhaEcocentro = entry.value == Where.recolhaEcocentro
          ? entry.key.toLine()
          : Line.zero;
    }

    final triagemPC = recolhaPapelCartao;
    final triagemPM = recolhaPlasticoMetal;
    final triagemVidro = recolhaVidro;
    final tratamentoMecanico = recolhaIndiferenciada;

    final reciclagem =
        ((triagemPC * origemTriagem * coeficientesTriagemPC.reciclagem) +
                (triagemPM * origemTriagem * coeficientesTriagemPM.reciclagem) +
                (triagemVidro *
                    origemTriagem *
                    coeficientesTriagemVidro.reciclagem) +
                (tratamentoMecanico *
                    origemTMTMB *
                    coeficientesTratamentoMecanico.reciclagem)) *
            eficienciaReciclagem;

    final valorizacaoEnergetica =
        (triagemPC * coeficientesTriagemPC.valorizacaoEnergetica) +
            (triagemPM * coeficientesTriagemPM.valorizacaoEnergetica) +
            (triagemVidro * coeficientesTriagemVidro.valorizacaoEnergetica) +
            (tratamentoMecanico *
                coeficientesTratamentoMecanico.valorizacaoEnergetica);

    final aterro = (triagemPC * coeficientesTriagemPC.aterro) +
        (triagemPM * coeficientesTriagemPM.aterro) +
        (triagemVidro * coeficientesTriagemVidro.aterro) +
        (tratamentoMecanico * coeficientesTratamentoMecanico.aterro);

    final substituicao = reciclagem * substituicaoMateriais;

    return Matrix(
      recolhaIndiferenciada: recolhaIndiferenciada,
      recolhaPapelCartao: recolhaPapelCartao,
      recolhaPlasticoMetal: recolhaPlasticoMetal,
      recolhaVidro: recolhaVidro,
      recolhaEcocentro: recolhaEcocentro,
      triagemPC: triagemPC,
      triagemPM: triagemPM,
      triagemVidro: triagemVidro,
      tratamentoMecanico: tratamentoMecanico,
      reciclagem: reciclagem,
      valorizacaoEnergetica: valorizacaoEnergetica,
      aterro: aterro,
      substituicao: substituicao,
    );
  }
}
