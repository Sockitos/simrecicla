import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simrecicla/models/consumer/component.dart';

part 'package.freezed.dart';

@freezed
class Package with _$Package {
  const factory Package({
    required int id,
    required String name,
    required IconData icon,
    required List<Component> components,
  }) = _Package;
}
