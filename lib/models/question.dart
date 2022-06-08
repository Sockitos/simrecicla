import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/models/answer.dart';
import 'package:simtech/models/enums.dart';
import 'package:simtech/models/question_requirement.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required int id,
    required String question,
    required List<Answer> answers,
    required QuestionRequirement? requirement,
    required String? info,
  }) = _Question;
  const Question._();

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  List<Answer> getFilteredAnswers(PMaterial? material) => material == null
      ? <Answer>[]
      : answers.where((a) => a.isRelevant(material)).toList();
}