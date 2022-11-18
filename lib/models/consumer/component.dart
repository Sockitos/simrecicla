import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'component.freezed.dart';

enum Where {
  recolhaIndiferenciada,
  recolhaPapelCartao,
  recolhaPlasticoMetal,
  recolhaVidro,
}

@freezed
class Component with _$Component {
  const factory Component({
    required String name,
    required IconData icon,
    double? papel,
    double? cartao,
    double? ecal,
    double? pebd,
    double? pet,
    double? pead,
    @JsonKey(name: 'plasticos_mistos') double? plasticosMistos,
    @JsonKey(name: 'metais_ferrosos') double? metaisFerrosos,
    @JsonKey(name: 'metais_nao_ferrosos') double? metaisNaoFerrosos,
    double? vidro,
    double? eps,
    @JsonKey(name: 'fracao_resto') double? fracaoResto,
    required Where where,
    required bool reciclavel,
    @JsonKey(name: 'if_true') required String ifTrue,
    @JsonKey(name: 'if_false') required String ifFalse,
    required String recomendacoes,
  }) = _Component;
  const Component._();
  List<String> get recommendations => recomendacoes.split('; ');
}
