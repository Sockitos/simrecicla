import 'package:simtech/models/line.dart';

class Matrix {
  const Matrix({
    this.recolhaIndiferenciada = Line.zero,
    this.recolhaPapelCartao = Line.zero,
    this.recolhaPlasticoMetal = Line.zero,
    this.recolhaVidro = Line.zero,
    this.recolhaEcocentro = Line.zero,
    this.triagemPC = Line.zero,
    this.triagemPM = Line.zero,
    this.triagemVidro = Line.zero,
    this.tratamentoMecanico = Line.zero,
    this.digestaoAnaerobia = Line.zero,
    this.compostagem = Line.zero,
    this.reciclagem = Line.zero,
    this.valorizacaoEnergetica = Line.zero,
    this.aterro = Line.zero,
    this.substituicao = Line.zero,
  });

  final Line recolhaIndiferenciada;
  final Line recolhaPapelCartao;
  final Line recolhaPlasticoMetal;
  final Line recolhaVidro;
  final Line recolhaEcocentro;
  final Line triagemPC;
  final Line triagemPM;
  final Line triagemVidro;
  final Line tratamentoMecanico;
  final Line digestaoAnaerobia;
  final Line compostagem;
  final Line reciclagem;
  final Line valorizacaoEnergetica;
  final Line aterro;
  final Line substituicao;

  @override
  String toString() {
    return '$recolhaIndiferenciada\n$recolhaPapelCartao\n$recolhaPlasticoMetal\n$recolhaVidro\n$recolhaEcocentro\n$triagemPC\n$triagemPM\n$triagemVidro\n$tratamentoMecanico\n$digestaoAnaerobia\n$compostagem\n$reciclagem\n$valorizacaoEnergetica\n$aterro\n$substituicao';
  }

  Matrix operator *(Matrix other) {
    return Matrix(
      recolhaIndiferenciada:
          recolhaIndiferenciada * other.recolhaIndiferenciada,
      recolhaPapelCartao: recolhaPapelCartao * other.recolhaPapelCartao,
      recolhaPlasticoMetal: recolhaPlasticoMetal * other.recolhaPlasticoMetal,
      recolhaVidro: recolhaVidro * other.recolhaVidro,
      recolhaEcocentro: recolhaEcocentro * other.recolhaEcocentro,
      triagemPC: triagemPC * other.triagemPC,
      triagemPM: triagemPM * other.triagemPM,
      triagemVidro: triagemVidro * other.triagemVidro,
      tratamentoMecanico: tratamentoMecanico * other.tratamentoMecanico,
      digestaoAnaerobia: digestaoAnaerobia * other.digestaoAnaerobia,
      compostagem: compostagem * other.compostagem,
      reciclagem: reciclagem * other.reciclagem,
      valorizacaoEnergetica:
          valorizacaoEnergetica * other.valorizacaoEnergetica,
      aterro: aterro * other.aterro,
      substituicao: substituicao * other.substituicao,
    );
  }

  double sum() {
    return recolhaIndiferenciada.sum() +
        recolhaPapelCartao.sum() +
        recolhaPlasticoMetal.sum() +
        recolhaVidro.sum() +
        recolhaEcocentro.sum() +
        triagemPC.sum() +
        triagemPM.sum() +
        triagemVidro.sum() +
        tratamentoMecanico.sum() +
        digestaoAnaerobia.sum() +
        compostagem.sum() +
        reciclagem.sum() +
        valorizacaoEnergetica.sum() +
        aterro.sum() +
        substituicao.sum();
  }
}

class MatrixCoeficiente extends Matrix {
  MatrixCoeficiente({required super.reciclagem})
      : super(
          valorizacaoEnergetica: (Line.fromValue(1) - reciclagem).mulAll(kVE),
          aterro: (Line.fromValue(1) - reciclagem).mulAll(kAterro),
        );

  static const kAterro = 0.732282444013512;
  static const kVE = 0.267717555986488;
}