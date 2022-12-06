import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout/layout.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/recycler/material_sample.dart';
import 'package:simtech/ui/widgets/app_dialog.dart';
import 'package:simtech/utils/hooks.dart';

part 'results.freezed.dart';

@freezed
class ResultsModel with _$ResultsModel {
  const factory ResultsModel.efficiency() = _Efficiency;
  const factory ResultsModel.product({
    required int productId,
  }) = _Product;
  const ResultsModel._();

  bool get showEfficiency => map(
        efficiency: (_) => true,
        product: (_) => false,
      );

  int? get selectedProduct => when(
        efficiency: () => null,
        product: (productId) => productId,
      );
}

class Results extends HookWidget {
  const Results({
    super.key,
    required this.products,
    required this.feed,
    required this.product,
  });

  final Map<int, MaterialSample> products;
  final MaterialSample feed;
  final MaterialSample product;

  @override
  Widget build(BuildContext context) {
    final state = useState(const ResultsModel.efficiency());
    var efficiency = (product.sum() - product.naoRecuperaveis) /
        (feed.sum() - feed.naoRecuperaveis);
    efficiency = efficiency.isNaN ? 0 : efficiency;
    return AppDialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 850),
        child: Padding(
          padding: AppSpacings.dialogPadding(context.layout),
          child: DefaultTextStyle(
            style: AppTextStyles.bodyM(context.layout),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (context.layout.breakpoint < LayoutBreakpoint.sm) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        state.value = const ResultsModel.efficiency();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state.value.showEfficiency
                            ? AppColors.grey3
                            : AppColors.grey1,
                        foregroundColor: AppColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        fixedSize: const Size.fromHeight(48),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        textStyle: state.value.showEfficiency
                            ? AppTextStyles.smallButton(context.layout)
                                .copyWith(fontWeight: FontWeight.bold)
                            : AppTextStyles.smallButton(context.layout),
                      ),
                      child: const Text('Eficiência'),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
                HookBuilder(
                  builder: (context) {
                    final scrollController = useScrollController();
                    final isScrollable = useIsScrollable(
                      scrollController,
                      mediaQueryData: MediaQuery.of(context),
                    );
                    return Row(
                      children: [
                        if (isScrollable)
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 15,
                            ),
                            child: IconButton(
                              onPressed: () {
                                scrollController.animateTo(
                                  scrollController.offset - 100,
                                  duration: const Duration(
                                    milliseconds: 250,
                                  ),
                                  curve: Curves.linear,
                                );
                              },
                              iconSize: 30,
                              splashRadius: 30,
                              color: AppColors.lightGreen,
                              icon: const Icon(
                                Icons.keyboard_double_arrow_left_rounded,
                              ),
                            ),
                          ),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ListView(
                              controller: scrollController,
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (final productId in products.keys.toList()
                                  ..sort((a, b) => a.compareTo(b))) ...[
                                  ElevatedButton(
                                    onPressed: () {
                                      state.value = ResultsModel.product(
                                        productId: productId,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          state.value.selectedProduct ==
                                                  productId
                                              ? AppColors.grey3
                                              : AppColors.grey1,
                                      foregroundColor: AppColors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      fixedSize: const Size.fromHeight(48),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                      ),
                                      textStyle: state.value.selectedProduct ==
                                              productId
                                          ? AppTextStyles.smallButton(
                                              context.layout,
                                            ).copyWith(
                                              fontWeight: FontWeight.bold,
                                            )
                                          : AppTextStyles.smallButton(
                                              context.layout,
                                            ),
                                    ),
                                    child: Text('Produto $productId'),
                                  ),
                                  const SizedBox(width: 15),
                                ],
                              ],
                            ),
                          ),
                        ),
                        if (isScrollable)
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 15,
                            ),
                            child: IconButton(
                              onPressed: () {
                                scrollController.animateTo(
                                  scrollController.offset + 100,
                                  duration: const Duration(
                                    milliseconds: 250,
                                  ),
                                  curve: Curves.linear,
                                );
                              },
                              iconSize: 30,
                              splashRadius: 30,
                              color: AppColors.lightGreen,
                              icon: const Icon(
                                Icons.keyboard_double_arrow_right_rounded,
                              ),
                            ),
                          ),
                        if (context.layout.breakpoint >
                            LayoutBreakpoint.xs) ...[
                          ElevatedButton(
                            onPressed: () {
                              state.value = const ResultsModel.efficiency();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: state.value.showEfficiency
                                  ? AppColors.grey3
                                  : AppColors.grey1,
                              foregroundColor: AppColors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              fixedSize: const Size.fromHeight(48),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              textStyle: state.value.showEfficiency
                                  ? AppTextStyles.smallButton(context.layout)
                                      .copyWith(fontWeight: FontWeight.bold)
                                  : AppTextStyles.smallButton(context.layout),
                            ),
                            child: const Text('Eficiência'),
                          ),
                          const SizedBox(width: 50),
                        ],
                      ],
                    );
                  },
                ),
                const SizedBox(height: 30),
                ...state.value.when(
                  efficiency: () => [
                    DefaultTextStyle.merge(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Materiais',
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Alimentação',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Produto',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Recuperação',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    for (final m in feed.materials.keys)
                      _EfficiencyMaterialInfo(
                        label: m.name,
                        feed: feed.getValue(m),
                        product: product.getValue(m),
                        recovered: product.getValue(m) / feed.getValue(m),
                      ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        const Flexible(
                          child: Text(
                            'Eficiência Global na Linha:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 30),
                        CircularPercentIndicator(
                          addAutomaticKeepAlive: false,
                          radius: context.layout.value(xs: 30, sm: 40, md: 50),
                          lineWidth:
                              context.layout.value(xs: 10, sm: 15, md: 20),
                          percent: efficiency,
                          progressColor: AppColors.lightGreen,
                          backgroundColor: AppColors.grey4,
                          circularStrokeCap: CircularStrokeCap.round,
                          startAngle: 180,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          '${(efficiency * 100).round()}%',
                          style: AppTextStyles.h2(context.layout)
                              .withColor(AppColors.lightGreen),
                        )
                      ],
                    ),
                  ],
                  product: (productId) => [
                    DefaultTextStyle.merge(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Text('Materiais'),
                          ),
                          Expanded(
                            child: Text(
                              'Massa',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Composição',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Recuperação',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    for (final m
                        in products[productId]?.materials.keys ?? <RMaterial>[])
                      _ProductMaterialInfo(
                        label: m.name,
                        weight: products[productId]?.getValue(m) ?? 0,
                        composition: (products[productId]?.getValue(m) ?? 0) /
                            (products[productId]?.sum() ?? 1),
                        recovered: (products[productId]?.getValue(m) ?? 0) /
                            feed.getValue(m),
                      ),
                    const SizedBox(height: 20),
                    _ProductMaterialInfo(
                      label: 'Não recuperáveis',
                      weight: products[productId]?.naoRecuperaveis ?? 0,
                      composition: (products[productId]?.naoRecuperaveis ?? 0) /
                          (products[productId]?.sum() ?? 1),
                      recovered: (products[productId]?.naoRecuperaveis ?? 0) /
                          feed.naoRecuperaveis,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EfficiencyMaterialInfo extends StatelessWidget {
  const _EfficiencyMaterialInfo({
    required this.label,
    this.feed = 0,
    this.product = 0,
    this.recovered = 0,
  });

  final String label;
  final double feed;
  final double product;
  final double recovered;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(label),
            ),
          ),
          Expanded(
            child: Text(
              (feed.isNaN ? 0 : feed).toStringAsFixed(2),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              (product.isNaN ? 0 : product).toStringAsFixed(2),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${((recovered.isNaN ? 0 : recovered) * 100).toStringAsFixed(2)}%',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductMaterialInfo extends StatelessWidget {
  const _ProductMaterialInfo({
    required this.label,
    this.labelStyle,
    this.weight = 0,
    this.composition = 0,
    this.recovered,
  });

  final String label;
  final TextStyle? labelStyle;
  final double weight;
  final double composition;
  final double? recovered;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                label,
                style: labelStyle,
              ),
            ),
          ),
          Expanded(
            child: Text(
              (weight.isNaN ? 0 : weight).toStringAsFixed(2),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${((composition.isNaN ? 0 : composition) * 100).toStringAsFixed(2)}%',
              textAlign: TextAlign.center,
            ),
          ),
          if (recovered != null)
            Expanded(
              child: Text(
                '${((recovered!.isNaN ? 0 : recovered!) * 100).toStringAsFixed(2)}%',
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
