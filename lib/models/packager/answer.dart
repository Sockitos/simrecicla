import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/models/packager/enums.dart';

part 'answer.freezed.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    required int id,
    required String answer,
    String? recommendation,
    @Default(AnswerComponent()) AnswerComponent vidro,
    @Default(AnswerComponent()) AnswerComponent aco,
    @Default(AnswerComponent()) AnswerComponent aluminio,
    @Default(AnswerComponent()) AnswerComponent pet,
    @Default(AnswerComponent()) AnswerComponent pead,
    @Default(AnswerComponent()) AnswerComponent pebd,
    @Default(AnswerComponent()) AnswerComponent eps,
    @Default(AnswerComponent()) AnswerComponent pp,
    @Default(AnswerComponent()) AnswerComponent outrosPlasticos,
    @Default(AnswerComponent()) AnswerComponent ecal,
    @Default(AnswerComponent()) AnswerComponent papel,
    @Default(AnswerComponent()) AnswerComponent cartao,
  }) = _Answer;
  const Answer._();

  bool isRelevant(PMaterial material) {
    switch (material) {
      case PMaterial.vidro:
        return vidro.value != null;
      case PMaterial.aco:
        return aco.value != null;
      case PMaterial.aluminio:
        return aluminio.value != null;
      case PMaterial.pet:
        return pet.value != null;
      case PMaterial.pead:
        return pead.value != null;
      case PMaterial.pebd:
        return pead.value != null;
      case PMaterial.eps:
        return eps.value != null;
      case PMaterial.pp:
        return pp.value != null;
      case PMaterial.outrosPlasticos:
        return outrosPlasticos.value != null;
      case PMaterial.ecal:
        return ecal.value != null;
      case PMaterial.papel:
        return papel.value != null;
      case PMaterial.cartao:
        return cartao.value != null;
    }
  }

  int? getValue(PMaterial material) {
    switch (material) {
      case PMaterial.vidro:
        return vidro.value;
      case PMaterial.aco:
        return aco.value;
      case PMaterial.aluminio:
        return aluminio.value;
      case PMaterial.pet:
        return pet.value;
      case PMaterial.pead:
        return pead.value;
      case PMaterial.pebd:
        return pead.value;
      case PMaterial.eps:
        return eps.value;
      case PMaterial.pp:
        return pp.value;
      case PMaterial.outrosPlasticos:
        return outrosPlasticos.value;
      case PMaterial.ecal:
        return ecal.value;
      case PMaterial.papel:
        return papel.value;
      case PMaterial.cartao:
        return cartao.value;
    }
  }

  String? getRecommendation(PMaterial material) {
    switch (material) {
      case PMaterial.vidro:
        return vidro.recommendation;
      case PMaterial.aco:
        return aco.recommendation;
      case PMaterial.aluminio:
        return aluminio.recommendation;
      case PMaterial.pet:
        return pet.recommendation;
      case PMaterial.pead:
        return pead.recommendation;
      case PMaterial.pebd:
        return pead.recommendation;
      case PMaterial.eps:
        return eps.recommendation;
      case PMaterial.pp:
        return pp.recommendation;
      case PMaterial.outrosPlasticos:
        return outrosPlasticos.recommendation;
      case PMaterial.ecal:
        return ecal.recommendation;
      case PMaterial.papel:
        return papel.recommendation;
      case PMaterial.cartao:
        return cartao.recommendation;
    }
  }
}

@freezed
class AnswerComponent with _$AnswerComponent {
  const factory AnswerComponent({
    int? value,
    String? recommendation,
  }) = _AnswerComponent;
}
