import 'package:simtech/models/line.dart';

class Matrix {
  const Matrix({
    this.recolhaIndiferenciada = Line.zero,
    this.recolhaPapelCartao = Line.zero,
    this.recolhaPlasticoMetal = Line.zero,
    this.recolhaVidro = Line.zero,
    this.triagemPC = Line.zero,
    this.triagemPM = Line.zero,
    this.triagemVidro = Line.zero,
    this.tratamentoMecanico = Line.zero,
    this.digestaoAnaerobia = Line.zero,
    this.reciclagem = Line.zero,
    this.valorizacaoEnergetica = Line.zero,
    this.aterro = Line.zero,
    this.substituicao = Line.zero,
  });

  final Line recolhaIndiferenciada;
  final Line recolhaPapelCartao;
  final Line recolhaPlasticoMetal;
  final Line recolhaVidro;
  final Line triagemPC;
  final Line triagemPM;
  final Line triagemVidro;
  final Line tratamentoMecanico;
  final Line digestaoAnaerobia;
  final Line reciclagem;
  final Line valorizacaoEnergetica;
  final Line aterro;
  final Line substituicao;

  @override
  String toString() {
    return '$recolhaIndiferenciada\n$recolhaPapelCartao\n$recolhaPlasticoMetal\n$recolhaVidro\n$triagemPC\n$triagemPM\n$triagemVidro\n$tratamentoMecanico\n$digestaoAnaerobia\n$reciclagem\n$valorizacaoEnergetica\n$aterro\n$substituicao';
  }

  Matrix operator *(Matrix other) {
    return Matrix(
      recolhaIndiferenciada:
          recolhaIndiferenciada * other.recolhaIndiferenciada,
      recolhaPapelCartao: recolhaPapelCartao * other.recolhaPapelCartao,
      recolhaPlasticoMetal: recolhaPlasticoMetal * other.recolhaPlasticoMetal,
      recolhaVidro: recolhaVidro * other.recolhaVidro,
      triagemPC: triagemPC * other.triagemPC,
      triagemPM: triagemPM * other.triagemPM,
      triagemVidro: triagemVidro * other.triagemVidro,
      tratamentoMecanico: tratamentoMecanico * other.tratamentoMecanico,
      digestaoAnaerobia: digestaoAnaerobia * other.digestaoAnaerobia,
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
        triagemPC.sum() +
        triagemPM.sum() +
        triagemVidro.sum() +
        tratamentoMecanico.sum() +
        digestaoAnaerobia.sum() +
        reciclagem.sum() +
        valorizacaoEnergetica.sum() +
        aterro.sum() +
        substituicao.sum();
  }
}
