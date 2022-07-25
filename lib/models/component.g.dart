// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Component _$$_ComponentFromJson(Map<String, dynamic> json) => _$_Component(
      name: json['name'] as String,
      iconId: json['iconId'] as String,
      papel: (json['papel'] as num?)?.toDouble(),
      cartao: (json['cartao'] as num?)?.toDouble(),
      ecal: (json['ecal'] as num?)?.toDouble(),
      pebd: (json['pebd'] as num?)?.toDouble(),
      pet: (json['pet'] as num?)?.toDouble(),
      pead: (json['pead'] as num?)?.toDouble(),
      plasticosMistos: (json['plasticos_mistos'] as num?)?.toDouble(),
      metaisFerrosos: (json['metais_ferrosos'] as num?)?.toDouble(),
      metaisNaoFerrosos: (json['metais_nao_ferrosos'] as num?)?.toDouble(),
      vidro: (json['vidro'] as num?)?.toDouble(),
      eps: (json['eps'] as num?)?.toDouble(),
      fracaoResto: (json['fracao_resto'] as num?)?.toDouble(),
      where: $enumDecode(_$WhereEnumMap, json['where']),
      ifTrue: json['if_true'] as String,
      ifFalse: json['if_false'] as String,
      recomendacoes: json['recomendacoes'] as String,
    );

Map<String, dynamic> _$$_ComponentToJson(_$_Component instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iconId': instance.iconId,
      'papel': instance.papel,
      'cartao': instance.cartao,
      'ecal': instance.ecal,
      'pebd': instance.pebd,
      'pet': instance.pet,
      'pead': instance.pead,
      'plasticos_mistos': instance.plasticosMistos,
      'metais_ferrosos': instance.metaisFerrosos,
      'metais_nao_ferrosos': instance.metaisNaoFerrosos,
      'vidro': instance.vidro,
      'eps': instance.eps,
      'fracao_resto': instance.fracaoResto,
      'where': _$WhereEnumMap[instance.where]!,
      'if_true': instance.ifTrue,
      'if_false': instance.ifFalse,
      'recomendacoes': instance.recomendacoes,
    };

const _$WhereEnumMap = {
  Where.recolhaIndiferenciada: 'Contentor Indiferenciado',
  Where.recolhaPapelCartao: 'Contentor Azul',
  Where.recolhaPlasticoMetal: 'Contentor Amarelo',
  Where.recolhaVidro: 'Contentor Verde',
  Where.recolhaEcocentro: 'recolhaEcocentro',
  Where.recolhaBiorresiduos: 'recolhaBiorresiduos',
};
