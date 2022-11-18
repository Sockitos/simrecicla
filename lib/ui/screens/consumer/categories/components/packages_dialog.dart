import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/consumer/category.dart';
import 'package:simtech/ui/widgets/app_dialog.dart';

class PackagesDialog extends HookWidget {
  const PackagesDialog({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 880),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacings.big(context.layout),
            vertical: 30,
          ),
          children: [
            Text(
              category.category,
              textAlign: TextAlign.center,
              style: AppTextStyles.h2(context.layout),
            ),
            SizedBox(height: AppSpacings.big(context.layout)),
            Wrap(
              spacing: AppSpacings.big(context.layout),
              runSpacing: AppSpacings.big(context.layout),
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                for (final package in category.packages)
                  SizedBox(
                    width: 190,
                    height: 190,
                    child: Material(
                      color: AppColors.grey3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: InkWell(
                        onTap: () => context.push(
                          '/consumer/bin_selection?package=${package.id}',
                        ),
                        borderRadius: BorderRadius.circular(34),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 5),
                              Icon(
                                package.icon,
                                size: 90,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    package.name,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.bodyS(
                                      context.layout,
                                    ).copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}