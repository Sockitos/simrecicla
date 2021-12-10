import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/src/models/component.dart';

part 'package.freezed.dart';
part 'package.g.dart';

@freezed
class Package with _$Package {
  const factory Package({
    required String package,
    @JsonKey(defaultValue: 'assets/svgs/milk.svg') required String svgPath,
    required List<Component> components,
  }) = _Package;
  const Package._();

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
}
