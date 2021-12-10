// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Machine _$$_MachineFromJson(Map<String, dynamic> json) => _$_Machine(
      name: json['name'] as String,
      description: json['description'] as String,
      inputCount: json['input_count'] as int,
      outputs: (json['outputs'] as List<dynamic>)
          .map((e) => MachineOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MachineToJson(_$_Machine instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'input_count': instance.inputCount,
      'outputs': instance.outputs.map((e) => e.toJson()).toList(),
    };
