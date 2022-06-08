import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/models/package.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String category,
    required String iconId,
    required List<Package> packages,
  }) = _Category;
  const Category._();

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
