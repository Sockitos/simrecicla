import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simrecicla/models/consumer/line.dart';

part 'matrix.freezed.dart';

@freezed
class Matrix with _$Matrix {
  const factory Matrix({
    @Default(Line.zero) Line recolhaIndiferenciada,
    @Default(Line.zero) Line recolhaPapelCartao,
    @Default(Line.zero) Line recolhaPlasticoMetal,
    @Default(Line.zero) Line recolhaVidro,
    @Default(Line.zero) Line triagemPC,
    @Default(Line.zero) Line triagemPM,
    @Default(Line.zero) Line triagemVidro,
    @Default(Line.zero) Line tratamentoMecanico,
    @Default(Line.zero) Line digestaoAnaerobia,
    @Default(Line.zero) Line reciclagem,
    @Default(Line.zero) Line valorizacaoEnergetica,
    @Default(Line.zero) Line aterro,
    @Default(Line.zero) Line substituicao,
  }) = _Matrix;
  const Matrix._();

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
