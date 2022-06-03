import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/custom_icons.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/category.dart';
import 'package:simtech/services/consumer_service.dart';
import 'package:simtech/ui/screens/consumer/components/packages_dialog.dart';
import 'package:simtech/ui/widgets/screen_wrapper.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textAlign = context.breakpoint < LayoutBreakpoint.md
        ? TextAlign.center
        : TextAlign.start;
    final categories = ConsumerService.getCategories();
    return ScreenWrapper(
      body: Column(
        children: [
          SizedBox(height: 2 * AppSpacings.big(context.layout)),
          Text(
            'Escolhe o tipo de embalagem que queres reciclar',
            style: AppTextStyles.h2(context.layout)
                .copyWith(color: AppColors.lightGreen),
            textAlign: textAlign,
          ),
          SizedBox(height: 2 * AppSpacings.big(context.layout)),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1500),
            child: Wrap(
              spacing: AppSpacings.big(context.layout),
              runSpacing: AppSpacings.big(context.layout),
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                for (final category in categories)
                  _CategoryCard(category: category)
              ],
            ),
          ),
          SizedBox(height: 2 * AppSpacings.big(context.layout)),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 222,
      height: 222,
      child: Material(
        color: AppColors.grey3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(34),
        ),
        child: InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              barrierColor: Colors.black12,
              builder: (_) => PackagesDialog(category: category),
            );
          },
          borderRadius: BorderRadius.circular(34),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Icon(
                  CustomIcons.getIcon(category.iconId),
                  size: 110,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      category.category,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h4(context.layout),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
