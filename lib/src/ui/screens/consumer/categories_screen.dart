import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/custom_icons.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/services/consumer_service.dart';
import 'package:simtech/src/ui/screens/consumer/components/packages_dialog.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = ConsumerService.getCategories();
    return ScreenWrapper(
      body: Column(
        children: [
          const SizedBox(height: 80),
          Text(
            'Escolhe o tipo de embalagem que queres reciclar',
            style: AppTextStyles.h2(context.layout)
                .copyWith(color: AppColors.lightGreen),
          ),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Wrap(
              spacing: 50,
              runSpacing: 50,
              children: [
                for (final category in categories)
                  SizedBox(
                    width: 222,
                    height: 222,
                    child: Material(
                      color: AppColors.grey3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            HeroDialogRoute(
                              builder: (context) {
                                return PackagesDialog(category: category);
                              },
                            ),
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
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
