import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_component.freezed.dart';
part 'answer_component.g.dart';

@freezed
class AnswerComponent with _$AnswerComponent {
  const factory AnswerComponent({
    required int? value,
    required String? recommendation,
  }) = _AnswerComponent;
  const AnswerComponent._();

  factory AnswerComponent.fromJson(Map<String, dynamic> json) =>
      _$AnswerComponentFromJson(json);
}
