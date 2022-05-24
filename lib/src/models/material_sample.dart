import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_sample.freezed.dart';
part 'material_sample.g.dart';

@freezed
class MaterialSample with _$MaterialSample {
  const factory MaterialSample({
    required double argila,
    required double madeira,
    required double ferro,
  }) = _MaterialSample;

  factory MaterialSample.fromJson(Map<String, dynamic> json) =>
      _$MaterialSampleFromJson(json);
}
