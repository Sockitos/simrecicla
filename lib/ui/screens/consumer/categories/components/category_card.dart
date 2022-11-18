import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/consumer/category.dart';
import 'package:simtech/ui/screens/consumer/categories/components/packages_dialog.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
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
              barrierColor: AppColors.blackShadow,
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
                  category.icon,
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
