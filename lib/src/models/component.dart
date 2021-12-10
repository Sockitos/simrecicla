import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/src/models/enums.dart';

part 'component.freezed.dart';
part 'component.g.dart';

@freezed
class Component with _$Component {
  const factory Component({
    required String component,
    @JsonKey(defaultValue: 'assets/svgs/lid.svg') required String svgPath,
    required double? papel,
    required double? cartao,
    required double? ecal,
    required double? pebd,
    required double? pet,
    required double? pead,
    @JsonKey(name: 'plasticos_mistos') required double? plasticosMistos,
    @JsonKey(name: 'metais_ferrosos') required double? metaisFerrosos,
    @JsonKey(name: 'metais_nao_ferrosos') required double? metaisNaoFerrosos,
    required double? vidro,
    required double? eps,
    @JsonKey(name: 'fracao_resto') required double? fracaoResto,
    required Where where,
    @JsonKey(name: 'if_true') required String ifTrue,
    @JsonKey(name: 'if_false') required String ifFalse,
    required String recomendacoes,
  }) = _Component;
  const Component._();

  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
}
