import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simrecicla/data/packager_data.dart';
import 'package:simrecicla/models/packager/answer.dart';
import 'package:simrecicla/models/packager/enums.dart';
import 'package:simrecicla/models/packager/question.dart';
import 'package:simrecicla/services/packager_service.dart';
import 'package:tuple/tuple.dart';

part 'form_screen_model.freezed.dart';

final formScreenSNProvider =
    StateNotifierProvider.autoDispose<FormScreenNotifier, FormScreenModel>(
  (ref) => FormScreenNotifier(),
);

@freezed
class FormScreenModel with _$FormScreenModel {
  const factory FormScreenModel({
    PMaterial? material,
    int? weight,
    @Default(0) double recycledPercentage,
    @Default(<int, Answer>{}) Map<int, Answer> answers,
  }) = _FormScreenModel;
  const FormScreenModel._();

  Rating get rating => material != null
      ? PackagerService.calculateRating(
          material: material!,
          answers: answers.values.toList(),
        )
      : Rating.a;

  List<Tuple2<String, String>> get recommendations {
    final recommendations = <Tuple2<String, String>>[];
    for (final a in answers.values) {
      final critical = a.recommendation;
      final alternative = a.getRecommendation(material!);
      if (critical != null && alternative != null) {
        recommendations.add(Tuple2(critical, alternative));
      }
    }
    return recommendations;
  }

  List<Question> get requiredQuestions =>
      PackagerData.questions.where(isQuestionRequired).toList();

  bool get isSubmittable {
    if (material == null) return false;
    if (weight == null) return false;
    for (final q in requiredQuestions) {
      if (!answers.containsKey(q.id)) return false;
    }
    return true;
  }

  bool isQuestionRequired(Question q) {
    final requirement = q.requirement;
    if (requirement == null) return true;
    final answer = answers[requirement.question];
    if (answer == null) return false;
    return requirement.answers.contains(answer.id);
  }
}

class FormScreenNotifier extends StateNotifier<FormScreenModel> {
  FormScreenNotifier() : super(const FormScreenModel());

  void setMaterial(PMaterial? material) => state = state.copyWith(
        material: material,
        answers: {},
      );

  void setWeight(int? weight) => state = state.copyWith(weight: weight);

  void setRecycledPercentage(double recycledPercentage) =>
      state = state.copyWith(
        recycledPercentage: recycledPercentage,
      );

  void setAnswer(Answer answer, {required int questionId}) {
    final newState = state.copyWith(
      answers: {
        ...state.answers,
        questionId: answer,
      },
    );
    final answers = {...newState.answers};
    final requiredQuestionsIds = newState.requiredQuestions.map((q) => q.id);
    answers.removeWhere((key, value) => !requiredQuestionsIds.contains(key));
    state = newState.copyWith(answers: {...answers});
  }
}
