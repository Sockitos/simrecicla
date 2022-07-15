import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/material_sample.dart';
import 'package:simtech/ui/screens/recycler/components/material_info.dart';
import 'package:simtech/ui/screens/recycler/grid_screen_notifier.dart';
import 'package:simtech/ui/widgets/my_card.dart';

class Results extends HookConsumerWidget {
  const Results({super.key});

  bool useIsScrollable(ScrollController controller) {
    final isScrollable = useState(false);
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          isScrollable.value = controller.position.maxScrollExtent > 0;
        });
        return;
      },
      [WidgetsBinding.instance],
    );

    return isScrollable.value;
  }

  bool useIsMinScrolled(ScrollController controller) {
    final isMinScrolled = useState(
      controller.position.pixels == controller.position.minScrollExtent,
    );
    useEffect(
      () {
        void listener() {
          if (controller.position.pixels ==
                  controller.position.minScrollExtent &&
              !isMinScrolled.value) {
            isMinScrolled.value = true;
          }
          if (!(controller.position.pixels ==
                  controller.position.minScrollExtent) &&
              isMinScrolled.value) {
            isMinScrolled.value = false;
          }
        }

        controller.addListener(listener);
        return () {
          controller.removeListener(listener);
        };
      },
      [controller],
    );

    return isMinScrolled.value;
  }

  bool useIsMaxScrolled(ScrollController controller) {
    final isMaxScrolled = useState(
      controller.position.pixels == controller.position.maxScrollExtent,
    );
    useEffect(
      () {
        void listener() {
          if (controller.position.pixels ==
                  controller.position.maxScrollExtent &&
              !isMaxScrolled.value) {
            isMaxScrolled.value = true;
          }
          if (!(controller.position.pixels ==
                  controller.position.maxScrollExtent) &&
              isMaxScrolled.value) {
            isMaxScrolled.value = false;
          }
        }

        controller.addListener(listener);
        return () {
          controller.removeListener(listener);
        };
      },
      [controller],
    );

    return isMaxScrolled.value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showEfficiency = useState(true);
    final selectedProduct = useState<String?>(null);

    final state = ref.watch(gridScreenSNProvider);

    final products = state.grid
        .getData()
        .where((m) => m.id == 'F')
        .map((p) => p.id0)
        .where(state.graph.graph.vertices.contains);
    final productWeights = Map.fromEntries(
      state.graph.inputs.entries.where(
        (e) => products.contains(e.key),
      ),
    );
    final productSums = Map.fromEntries(
      productWeights.entries.map(
        (e) => MapEntry(e.key, e.value.sum()),
      ),
    );
    final productCompositions = Map.fromEntries(
      productWeights.entries.map(
        (e) => MapEntry(e.key, e.value.divAll(productSums[e.key]!)),
      ),
    );
    final feed = state.feedSample.mulAll(state.feedWeight);
    final productRecovered = Map.fromEntries(
      productWeights.entries.map(
        (e) => MapEntry(e.key, e.value / feed),
      ),
    );

    final weights = productWeights[selectedProduct.value];
    final compositions = productCompositions[selectedProduct.value];
    var recovered = productRecovered[selectedProduct.value];

    MaterialSample? product;
    if (showEfficiency.value) {
      for (final p in products) {
        final filter = productCompositions[p]!.filterByValue(0.9);
        if (product == null) {
          product = filter * productWeights[p]!;
        } else {
          product += filter * productWeights[p]!;
        }
      }
      recovered = product! / feed;
      recovered = recovered.replaceNans(1);
    }

    final efficiency = product != null
        ? (product.sum() - product.naoRecuperaveis) /
            (feed.sum() - feed.naoRecuperaveis)
        : 0.0;

    return MyCard(
      child: Stack(
        children: [
          SizedBox(
            width: 1000,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: DefaultTextStyle(
                style: AppTextStyles.dropdown(context.layout),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HookBuilder(
                      builder: (context) {
                        final scrollController = useScrollController();
                        return Row(
                          children: [
                            HookBuilder(
                              builder: (context) {
                                final isScrollable =
                                    useIsScrollable(scrollController);
                                return isScrollable
                                    ? HookBuilder(
                                        builder: (context) {
                                          final isMinScrolled =
                                              useIsMinScrolled(
                                            scrollController,
                                          );
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              right: 15,
                                            ),
                                            child: IconButton(
                                              onPressed: isMinScrolled
                                                  ? null
                                                  : () {
                                                      scrollController
                                                          .animateTo(
                                                        scrollController
                                                                .offset -
                                                            100,
                                                        duration:
                                                            const Duration(
                                                          milliseconds: 250,
                                                        ),
                                                        curve: Curves.linear,
                                                      );
                                                    },
                                              iconSize: 30,
                                              splashRadius: 30,
                                              color: AppColors.lightGreen,
                                              icon: const Icon(
                                                Icons
                                                    .keyboard_double_arrow_left_rounded,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : const SizedBox();
                              },
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ListView(
                                  controller: scrollController,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    for (final product in products) ...[
                                      ElevatedButton(
                                        onPressed: () {
                                          selectedProduct.value = product;
                                          showEfficiency.value = false;
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              selectedProduct.value == product
                                                  ? AppColors.grey3
                                                  : AppColors.grey1,
                                          onPrimary: AppColors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          fixedSize: const Size.fromHeight(48),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 30,
                                          ),
                                          textStyle: selectedProduct.value ==
                                                  product
                                              ? AppTextStyles.dropdown(
                                                  context.layout,
                                                ).copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  height: 1,
                                                )
                                              : AppTextStyles.dropdown(
                                                  context.layout,
                                                ).copyWith(height: 1),
                                        ),
                                        child: const Text('Produto'),
                                      ),
                                      const SizedBox(width: 15),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                            HookBuilder(
                              builder: (context) {
                                final isScrollable =
                                    useIsScrollable(scrollController);
                                return isScrollable
                                    ? HookBuilder(
                                        builder: (context) {
                                          final isMaxScrolled =
                                              useIsMaxScrolled(
                                            scrollController,
                                          );
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              right: 15,
                                            ),
                                            child: IconButton(
                                              onPressed: isMaxScrolled
                                                  ? null
                                                  : () {
                                                      scrollController
                                                          .animateTo(
                                                        scrollController
                                                                .offset +
                                                            100,
                                                        duration:
                                                            const Duration(
                                                          milliseconds: 250,
                                                        ),
                                                        curve: Curves.linear,
                                                      );
                                                    },
                                              iconSize: 30,
                                              splashRadius: 30,
                                              color: AppColors.lightGreen,
                                              icon: const Icon(
                                                Icons
                                                    .keyboard_double_arrow_right_rounded,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : const SizedBox();
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                selectedProduct.value = null;
                                showEfficiency.value = true;
                              },
                              style: ElevatedButton.styleFrom(
                                primary: showEfficiency.value
                                    ? AppColors.grey3
                                    : AppColors.grey1,
                                onPrimary: AppColors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                fixedSize: const Size.fromHeight(48),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                textStyle: showEfficiency.value
                                    ? AppTextStyles.dropdown(context.layout)
                                        .copyWith(
                                        fontWeight: FontWeight.bold,
                                        height: 1,
                                      )
                                    : AppTextStyles.dropdown(context.layout)
                                        .copyWith(height: 1),
                              ),
                              child: const Text('Eficiência'),
                            ),
                            const SizedBox(width: 60),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    if (showEfficiency.value) ...[
                      DefaultTextStyle.merge(
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
                      if (feed is MaterialSamplePM &&
                          product is MaterialSamplePM &&
                          recovered is MaterialSamplePM) ...[
                        EfficiencyMaterialInfo(
                          label: 'ECAL',
                          feed: feed.ecal,
                          product: product.ecal,
                          recovered: recovered.ecal,
                        ),
                        EfficiencyMaterialInfo(
                          label: 'Filme plástico',
                          feed: feed.filmePlastico,
                          product: product.filmePlastico,
                          recovered: recovered.filmePlastico,
                        ),
                        EfficiencyMaterialInfo(
                          label: 'PET',
                          feed: feed.pet,
                          product: product.pet,
                          recovered: recovered.pet,
                        ),
                        EfficiencyMaterialInfo(
                          label: 'PET óleo',
                          feed: feed.petOleo,
                          product: product.petOleo,
                          recovered: recovered.petOleo,
                        ),
                        EfficiencyMaterialInfo(
                          label: 'PEAD',
                          feed: feed.pead,
                          product: product.pead,
                          recovered: recovered.pead,
                        ),
                        EfficiencyMaterialInfo(
                          label: 'Plásticos Mistos',
                          feed: feed.plasticosMistos,
                          product: product.plasticosMistos,
                          recovered: recovered.plasticosMistos,
                        ),
                        EfficiencyMaterialInfo(
                          label: 'Metais Ferrosos',
                          feed: feed.metaisFerrosos,
                          product: product.metaisFerrosos,
                          recovered: recovered.metaisFerrosos,
                        ),
                        EfficiencyMaterialInfo(
                          label: 'Metais não Ferrosos',
                          feed: feed.metaisNaoFerrosos,
                          product: product.metaisNaoFerrosos,
                          recovered: recovered.metaisNaoFerrosos,
                        ),
                      ],
                      if (feed is MaterialSamplePC &&
                          product is MaterialSamplePC &&
                          recovered is MaterialSamplePC) ...[
                        EfficiencyMaterialInfo(
                          label: 'Papel',
                          feed: feed.papel,
                          product: product.papel,
                          recovered: recovered.papel,
                        ),
                        EfficiencyMaterialInfo(
                          label: 'Cartão',
                          feed: feed.cartao,
                          product: product.cartao,
                          recovered: recovered.cartao,
                        ),
                        EfficiencyMaterialInfo(
                          label: 'Jornais e Revistas',
                          feed: feed.jornaisRevistas,
                          product: product.jornaisRevistas,
                          recovered: recovered.jornaisRevistas,
                        ),
                      ],
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          const Text(
                            'Eficiência Global na Linha:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 30),
                          CircularPercentIndicator(
                            radius: 50,
                            lineWidth: 20,
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
                                .copyWith(color: AppColors.lightGreen),
                          )
                        ],
                      ),
                    ] else ...[
                      DefaultTextStyle.merge(
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
                      if (weights is MaterialSamplePM &&
                          compositions is MaterialSamplePM &&
                          recovered is MaterialSamplePM) ...[
                        MaterialInfo(
                          label: 'ECAL',
                          weight: weights.ecal,
                          composition: compositions.ecal,
                          recovered: recovered.ecal,
                        ),
                        MaterialInfo(
                          label: 'Filme plástico',
                          weight: weights.filmePlastico,
                          composition: compositions.filmePlastico,
                          recovered: recovered.filmePlastico,
                        ),
                        MaterialInfo(
                          label: 'PET',
                          weight: weights.pet,
                          composition: compositions.pet,
                          recovered: recovered.pet,
                        ),
                        MaterialInfo(
                          label: 'PET óleo',
                          weight: weights.petOleo,
                          composition: compositions.petOleo,
                          recovered: recovered.petOleo,
                        ),
                        MaterialInfo(
                          label: 'PEAD',
                          weight: weights.pead,
                          composition: compositions.pead,
                          recovered: recovered.pead,
                        ),
                        MaterialInfo(
                          label: 'Plásticos Mistos',
                          weight: weights.plasticosMistos,
                          composition: compositions.plasticosMistos,
                          recovered: recovered.plasticosMistos,
                        ),
                        MaterialInfo(
                          label: 'Metais Ferrosos',
                          weight: weights.metaisFerrosos,
                          composition: compositions.metaisFerrosos,
                          recovered: recovered.metaisFerrosos,
                        ),
                        MaterialInfo(
                          label: 'Metais não Ferrosos',
                          weight: weights.metaisNaoFerrosos,
                          composition: compositions.metaisNaoFerrosos,
                          recovered: recovered.metaisNaoFerrosos,
                        ),
                      ],
                      if (weights is MaterialSamplePC &&
                          compositions is MaterialSamplePC &&
                          recovered is MaterialSamplePC) ...[
                        MaterialInfo(
                          label: 'Papel',
                          weight: weights.papel,
                          composition: compositions.papel,
                          recovered: recovered.papel,
                        ),
                        MaterialInfo(
                          label: 'Cartão',
                          weight: weights.cartao,
                          composition: compositions.cartao,
                          recovered: recovered.cartao,
                        ),
                        MaterialInfo(
                          label: 'Jornais e Revistas',
                          weight: weights.jornaisRevistas,
                          composition: compositions.jornaisRevistas,
                          recovered: recovered.jornaisRevistas,
                        ),
                      ],
                      const SizedBox(height: 20),
                      MaterialInfo(
                        label: 'Não recuperáveis',
                        weight: weights!.naoRecuperaveis,
                        composition: compositions!.naoRecuperaveis,
                        recovered: recovered!.naoRecuperaveis,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: IconButton(
              onPressed: () {
                final notifier = ref.read(gridScreenSNProvider.notifier);
                notifier.hideResults();
              },
              iconSize: 44,
              color: AppColors.lightGreen,
              icon: const Icon(Icons.close_outlined),
            ),
          ),
        ],
      ),
    );
  }
}

class EfficiencyMaterialInfo extends StatelessWidget {
  const EfficiencyMaterialInfo({
    super.key,
    required this.label,
    this.labelStyle,
    this.feed = 0,
    this.product = 0,
    this.recovered = 0,
  });

  final String label;
  final TextStyle? labelStyle;
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
              child: Text(
                label,
                style: labelStyle,
              ),
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
