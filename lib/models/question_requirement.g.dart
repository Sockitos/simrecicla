// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_requirement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionRequirement _$$_QuestionRequirementFromJson(
        Map<String, dynamic> json) =>
    _$_QuestionRequirement(
      question: json['question'] as int,
      answers: (json['answers'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_QuestionRequirementToJson(
        _$_QuestionRequirement instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
    };
