import 'package:simtech/src/models/line.dart';

class Matrix {
  const Matrix({
    this.recolhaIndiferenciada = Line.zero,
    this.recolhaPapelCartao = Line.zero,
    this.recolhaPlasticoMetal = Line.zero,
    this.recolhaVidro = Line.zero,
    this.recolhaEcocentro = Line.zero,
    this.recolhaBiorresiduos = Line.zero,
    this.triagemPC = Line.zero,
    this.triagemPM = Line.zero,
    this.triagemVidro = Line.zero,
    this.tratamentoMecanico = Line.zero,
    this.valorizacaoMaterial = Line.zero,
    this.valorizacaoOrganica = Line.zero,
    this.valorizacaoEnergetica = Line.zero,
    this.aterro = Line.zero,
  });

  final Line recolhaIndiferenciada;
  final Line recolhaPapelCartao;
  final Line recolhaPlasticoMetal;
  final Line recolhaVidro;
  final Line recolhaEcocentro;
  final Line recolhaBiorresiduos;
  final Line triagemPC;
  final Line triagemPM;
  final Line triagemVidro;
  final Line tratamentoMecanico;
  final Line valorizacaoMaterial;
  final Line valorizacaoOrganica;
  final Line valorizacaoEnergetica;
  final Line aterro;

  @override
  String toString() {
    return recolhaIndiferenciada.pead.toString();
  }

  Matrix operator *(Matrix other) {
    return Matrix(
      recolhaIndiferenciada:
          recolhaIndiferenciada * other.recolhaIndiferenciada,
      recolhaPapelCartao: recolhaPapelCartao * other.recolhaPapelCartao,
      recolhaPlasticoMetal: recolhaPlasticoMetal * other.recolhaPlasticoMetal,
      recolhaVidro: recolhaVidro * other.recolhaVidro,
      recolhaEcocentro: recolhaEcocentro * other.recolhaEcocentro,
      recolhaBiorresiduos: recolhaBiorresiduos * other.recolhaBiorresiduos,
      triagemPC: triagemPC * other.triagemPC,
      triagemPM: triagemPM * other.triagemPM,
      triagemVidro: triagemVidro * other.triagemVidro,
      tratamentoMecanico: tratamentoMecanico * other.tratamentoMecanico,
      valorizacaoMaterial: valorizacaoMaterial * other.valorizacaoMaterial,
      valorizacaoOrganica: valorizacaoOrganica * other.valorizacaoOrganica,
      valorizacaoEnergetica:
          valorizacaoEnergetica * other.valorizacaoEnergetica,
      aterro: aterro * other.aterro,
    );
  }
}

class MatrixCoeficiente extends Matrix {
  MatrixCoeficiente({required Line valorizacaoMaterial})
      : super(
          valorizacaoMaterial: valorizacaoMaterial,
          valorizacaoEnergetica:
              (Line.fromValue(1) - valorizacaoMaterial).mulAll(kVE),
          aterro: (Line.fromValue(1) - valorizacaoMaterial).mulAll(kAterro),
        );

  static const kAterro = 0.732;
  static const kVE = 9.268;
}
