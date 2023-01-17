import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simrecicla/models/consumer/package.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String category,
    required IconData icon,
    required List<Package> packages,
  }) = _Category;
}
