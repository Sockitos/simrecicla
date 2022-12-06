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
    final size = context.layout.value<double>(xs: 146, sm: 170, md: 190);
    return AppDialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 880),
        child: ListView(
          shrinkWrap: true,
          padding: AppSpacings.dialogPadding(context.layout),
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
                    width: size,
                    height: size,
                    child: Material(
                      color: AppColors.grey3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: InkWell(
                        onTap: () => context.go(
                          '/consumer/bin_selection?package=${package.id}',
                        ),
                        borderRadius: BorderRadius.circular(34),
                        child: Padding(
                          padding: EdgeInsets.all(
                            context.layout.value(
                              xs: 12,
                              sm: 15,
                              md: 20,
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 5),
                              Icon(
                                package.icon,
                                size: context.layout.value(
                                  xs: 60,
                                  sm: 80,
                                  md: 90,
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    package.name,
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
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
