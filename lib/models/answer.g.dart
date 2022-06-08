// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Answer _$$_AnswerFromJson(Map<String, dynamic> json) => _$_Answer(
      id: json['id'] as int,
      answer: json['answer'] as String,
      recommendation: json['recommendation'] as String?,
      vidro: AnswerComponent.fromJson(json['vidro'] as Map<String, dynamic>),
      aco: AnswerComponent.fromJson(json['aco'] as Map<String, dynamic>),
      aluminio:
          AnswerComponent.fromJson(json['aluminio'] as Map<String, dynamic>),
      pet: AnswerComponent.fromJson(json['pet'] as Map<String, dynamic>),
      pead: AnswerComponent.fromJson(json['pead'] as Map<String, dynamic>),
      pebd: AnswerComponent.fromJson(json['pebd'] as Map<String, dynamic>),
      eps: AnswerComponent.fromJson(json['eps'] as Map<String, dynamic>),
      pp: AnswerComponent.fromJson(json['pp'] as Map<String, dynamic>),
      outrosPlasticos: AnswerComponent.fromJson(
          json['outros_plasticos'] as Map<String, dynamic>),
      ecal: AnswerComponent.fromJson(json['ecal'] as Map<String, dynamic>),
      papel: AnswerComponent.fromJson(json['papel'] as Map<String, dynamic>),
      cartao: AnswerComponent.fromJson(json['cartao'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'recommendation': instance.recommendation,
      'vidro': instance.vidro.toJson(),
      'aco': instance.aco.toJson(),
      'aluminio': instance.aluminio.toJson(),
      'pet': instance.pet.toJson(),
      'pead': instance.pead.toJson(),
      'pebd': instance.pebd.toJson(),
      'eps': instance.eps.toJson(),
      'pp': instance.pp.toJson(),
      'outros_plasticos': instance.outrosPlasticos.toJson(),
      'ecal': instance.ecal.toJson(),
      'papel': instance.papel.toJson(),
      'cartao': instance.cartao.toJson(),
    };
