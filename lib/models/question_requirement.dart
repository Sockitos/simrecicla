import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_requirement.freezed.dart';
part 'question_requirement.g.dart';

@freezed
class QuestionRequirement with _$QuestionRequirement {
  const factory QuestionRequirement({
    required int question,
    required List<int> answers,
  }) = _QuestionRequirement;
  const QuestionRequirement._();

  factory QuestionRequirement.fromJson(Map<String, dynamic> json) =>
      _$QuestionRequirementFromJson(json);
}
