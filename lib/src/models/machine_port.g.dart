// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_port.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MachineInput _$$MachineInputFromJson(Map<String, dynamic> json) =>
    _$MachineInput(
      id: json['id'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MachineInputToJson(_$MachineInput instance) =>
    <String, dynamic>{
      'id': instance.id,
      'runtimeType': instance.$type,
    };

_$MachineOutput _$$MachineOutputFromJson(Map<String, dynamic> json) =>
    _$MachineOutput(
      id: json['id'] as String,
      materialConversion: json['materialConversion'] == null
          ? const MaterialSample(argila: 0, madeira: 0, ferro: 0)
          : MaterialSample.fromJson(
              json['materialConversion'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MachineOutputToJson(_$MachineOutput instance) =>
    <String, dynamic>{
      'id': instance.id,
      'materialConversion': instance.materialConversion.toJson(),
      'runtimeType': instance.$type,
    };
