import 'package:freezed_annotation/freezed_annotation.dart';

part 'bin_selection_state.freezed.dart';

@freezed
class BinSelectionState with _$BinSelectionState {
  const factory BinSelectionState.packageResults() = PackageResults;
  const factory BinSelectionState.componentResults({
    required String componentId,
  }) = ComponentResults;
}
