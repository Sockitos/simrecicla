import 'dart:developer';

import 'package:simtech/src/data/packager_data.dart';
import 'package:simtech/src/models/answer.dart';
import 'package:simtech/src/models/enums.dart';
import 'package:simtech/src/models/question.dart';

enum Rating { a, b, c, d, e, f }

class PackagerService {
  static List<Question> getQuestions() {
    return questions.map((d) => Question.fromJson(d)).toList();
  }

  static Rating getRating({
    required PMaterial material,
    required List<Answer> answers,
  }) {
    var sum = 17;
    for (final a in answers) {
      sum += getValue(material: material, answer: a);
    }
    log(sum.toString());
    if (sum >= 17) {
      return Rating.a;
    } else if (sum >= 15) {
      return Rating.b;
    } else if (sum >= 13) {
      return Rating.c;
    } else if (sum >= 10) {
      return Rating.d;
    } else if (sum >= 8) {
      return Rating.e;
    } else {
      return Rating.f;
    }
  }

  static int getValue({required PMaterial material, required Answer answer}) {
    switch (material) {
      case PMaterial.vidro:
        return answer.vidro ?? 0;
      case PMaterial.aco:
        return answer.aco ?? 0;
      case PMaterial.aluminio:
        return answer.aluminio ?? 0;
      case PMaterial.pet:
        return answer.pet ?? 0;
      case PMaterial.pead:
        return answer.pead ?? 0;
      case PMaterial.pebd:
        return answer.pead ?? 0;
      case PMaterial.eps:
        return answer.eps ?? 0;
      case PMaterial.pp:
        return answer.pp ?? 0;
      case PMaterial.outrosPlasticos:
        return answer.outrosPlasticos ?? 0;
      case PMaterial.ecal:
        return answer.ecal ?? 0;
      case PMaterial.papel:
        return answer.papel ?? 0;
      case PMaterial.cartao:
        return answer.cartao ?? 0;
    }
  }

  static bool validateQuestion({
    required Map<int, Answer> answers,
    required Question question,
  }) {
    final requirement = question.requirement;
    if (requirement == null) return true;

    final answer = answers[requirement.question];
    if (answer == null) return false;

    return requirement.answers.contains(answer.id);
  }

  static bool validateAnswers({
    required Map<int, Answer> answers,
    required PMaterial? material,
  }) {
    if (material == null) return false;
    final questions = getQuestions();

    final requiredQuestions = questions
        .where((q) => validateQuestion(answers: answers, question: q))
        .toList();

    for (final q in requiredQuestions) {
      if (!answers.containsKey(q.id)) return false;
    }

    return true;
  }
}
