// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Package _$$_PackageFromJson(Map<String, dynamic> json) => _$_Package(
      package: json['package'] as String,
      svgPath: json['svgPath'] as String? ?? 'assets/svgs/test_package.svg',
      components: (json['components'] as List<dynamic>)
          .map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PackageToJson(_$_Package instance) =>
    <String, dynamic>{
      'package': instance.package,
      'svgPath': instance.svgPath,
      'components': instance.components.map((e) => e.toJson()).toList(),
    };
