import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/src/models/answer.dart';
import 'package:simtech/src/models/enums.dart';
import 'package:simtech/src/models/question_requirement.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required int id,
    required String question,
    required List<Answer> answers,
    required QuestionRequirement? requirement,
  }) = _Question;
  const Question._();

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  List<Answer> getFilteredAnswers(PMaterial material) =>
      answers.where((a) => a.isRelevant(material)).toList();
}
