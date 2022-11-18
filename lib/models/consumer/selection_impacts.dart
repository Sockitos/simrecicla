import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_impacts.freezed.dart';

@freezed
class SelectionImpacts with _$SelectionImpacts {
  const factory SelectionImpacts({
    required double economical,
    required double environmental,
  }) = _SelectionImpacts;
}
