import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_impact.freezed.dart';

@freezed
class PackageImpact with _$PackageImpact {
  const factory PackageImpact({
    required double producao,
    required double incorporacao,
    required double eol,
    required double impacteTotal,
  }) = _PackageImpact;
  const PackageImpact._();
}
