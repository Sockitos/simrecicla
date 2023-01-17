import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simrecicla/models/packager/answer.dart';
import 'package:simrecicla/models/packager/enums.dart';

part 'question.freezed.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required int id,
    required String question,
    required List<Answer> answers,
    QuestionRequirement? requirement,
    String? info,
  }) = _Question;
  const Question._();

  List<Answer> getFilteredAnswers(PMaterial? material) => material == null
      ? <Answer>[]
      : answers.where((a) => a.isRelevant(material)).toList();
}

@freezed
class QuestionRequirement with _$QuestionRequirement {
  const factory QuestionRequirement({
    required int question,
    required List<int> answers,
  }) = _QuestionRequirement;
}
