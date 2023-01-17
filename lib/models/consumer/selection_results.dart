import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simrecicla/models/consumer/selection_impacts.dart';

part 'selection_results.freezed.dart';

@freezed
class SelectionResults with _$SelectionResults {
  const factory SelectionResults({
    required bool isCorrect,
    required SelectionImpacts userImpacts,
    required SelectionImpacts alternativeImpacts,
  }) = _SelectionResults;
}
