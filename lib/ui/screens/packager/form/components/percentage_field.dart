import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/ui/screens/packager/form/components/app_form_field.dart';

class PercentageField extends AppFormField {
  const PercentageField({
    super.key,
    this.value = 0,
    this.onChanged,
    required this.hint,
    super.info,
  });

  final double value;
  final ValueChanged<double>? onChanged;
  final String hint;

  @override
  Widget? buildBottom(BuildContext context) => Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Slider(
              value: value,
              onChanged: onChanged,
              divisions: 100,
              activeColor: AppColors.lightGreen,
              thumbColor: AppColors.lightGreen,
              inactiveColor: AppColors.lightGreen,
            ),
          ),
          SizedBox(
            width: 50,
            child: Text(
              '${(value * 100).round()}',
              style: AppTextStyles.h3(context.layout)
                  .withColor(AppColors.lightGreen),
            ),
          ),
          const SizedBox(width: 15),
        ],
      );

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          hint,
          style: AppTextStyles.h4(context.layout),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
