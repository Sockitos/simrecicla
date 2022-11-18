import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simtech/models/consumer/component.dart';
import 'package:simtech/models/consumer/package.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/bin_selection_screen.dart';

part 'bin_selection_screen_model.freezed.dart';

final binSelectionScreenSNProvider = StateNotifierProvider.autoDispose<
    BinSelectionScreenNotifier, BinSelectionScreenModel>(
  (ref) => BinSelectionScreenNotifier(package: ref.watch(packageProvider)),
  dependencies: [packageProvider],
);

@freezed
class BinSelectionScreenModel with _$BinSelectionScreenModel {
  const factory BinSelectionScreenModel({
    required Package package,
    @Default(<Component, Where>{}) Map<Component, Where> whereComponents,
    @Default(false) bool isBinning,
    @Default(false) bool showResults,
  }) = _BinSelectionScreenModel;
}

class BinSelectionScreenNotifier
    extends StateNotifier<BinSelectionScreenModel> {
  BinSelectionScreenNotifier({
    required Package package,
  }) : super(BinSelectionScreenModel(package: package));

  void placeComponent(Component component, {required Where where}) =>
      state = state.copyWith(
        whereComponents: {
          ...state.whereComponents,
          component: where,
        },
      );

  void isBinning() => state = state.copyWith(isBinning: true);
  void isNotBinning() => state = state.copyWith(isBinning: false);

  void showResults() => state = state.copyWith(showResults: true);
  void hideResults() => state = state.copyWith(showResults: false);
}
