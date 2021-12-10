import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/src/models/enums.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    required int id,
    required String answer,
    required int? vidro,
    required int? aco,
    required int? aluminio,
    required int? pet,
    required int? pead,
    required int? pebd,
    required int? eps,
    required int? pp,
    @JsonKey(name: 'outros_plasticos') required int? outrosPlasticos,
    required int? ecal,
    required int? papel,
    required int? cartao,
  }) = _Answer;
  const Answer._();

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  bool isRelevant(PMaterial material) {
    switch (material) {
      case PMaterial.vidro:
        return vidro != null;
      case PMaterial.aco:
        return aco != null;
      case PMaterial.aluminio:
        return aluminio != null;
      case PMaterial.pet:
        return pet != null;
      case PMaterial.pead:
        return pead != null;
      case PMaterial.pebd:
        return pead != null;
      case PMaterial.eps:
        return eps != null;
      case PMaterial.pp:
        return pp != null;
      case PMaterial.outrosPlasticos:
        return outrosPlasticos != null;
      case PMaterial.ecal:
        return ecal != null;
      case PMaterial.papel:
        return papel != null;
      case PMaterial.cartao:
        return cartao != null;
    }
  }
}
