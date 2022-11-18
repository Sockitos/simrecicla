import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/data/consumer_data.dart';
import 'package:simtech/models/consumer/category.dart';
import 'package:simtech/ui/screens/consumer/categories/components/category_card.dart';
import 'package:simtech/ui/widgets/app_screen.dart';

final categoriesProvider = Provider<List<Category>>(
  (ref) => ConsumerData.categories,
);

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    final textAlign = context.breakpoint < LayoutBreakpoint.md
        ? TextAlign.center
        : TextAlign.start;
    return AppScreen(
      body: Column(
        children: [
          SizedBox(height: AppSpacings.big(context.layout)),
          Text(
            'Escolhe o tipo de embalagem que queres reciclar',
            style: AppTextStyles.h2(context.layout)
                .withColor(AppColors.lightGreen),
            textAlign: textAlign,
          ),
          SizedBox(height: AppSpacings.big(context.layout)),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1500),
            child: Wrap(
              spacing: AppSpacings.big(context.layout),
              runSpacing: AppSpacings.big(context.layout),
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                for (final category in categories)
                  CategoryCard(category: category)
              ],
            ),
          ),
          SizedBox(height: AppSpacings.big(context.layout)),
        ],
      ),
    );
  }
}
