import 'package:freezed_annotation/freezed_annotation.dart';

part 'component.freezed.dart';
part 'component.g.dart';

enum Where {
  @JsonValue('Contentor Indiferenciado')
  recolhaIndiferenciada,
  @JsonValue('Contentor Azul')
  recolhaPapelCartao,
  @JsonValue('Contentor Amarelo')
  recolhaPlasticoMetal,
  @JsonValue('Contentor Verde')
  recolhaVidro,
}

@freezed
class Component with _$Component {
  const factory Component({
    required String name,
    required String iconId,
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
    @JsonKey(name: 'if_true') required String ifTrue,
    @JsonKey(name: 'if_false') required String ifFalse,
    required String recomendacoes,
  }) = _Component;
  const Component._();

  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);

  List<String> get recommendations => recomendacoes.split('; ');
}
