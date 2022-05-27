import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/custom_icons.dart';
import 'package:simtech/src/constants/spacings.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/category.dart';
import 'package:simtech/src/router/router.gr.dart';

class PackagesDialog extends HookWidget {
  const PackagesDialog({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: AppSpacings.big(context.layout),
        vertical: screenHeight / 8,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 3),
              blurRadius: 20,
            )
          ],
        ),
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
          color: AppColors.white,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 880),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacings.big(context.layout),
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
                            onTap: () => AutoRouter.of(context).push(
                              BinSelectionScreenRoute(package: package),
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
                                    CustomIcons.getIcon(package.iconId),
                                    size: 90,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        package.name,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.paragraph(
                                          context.layout,
                                        ).copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
