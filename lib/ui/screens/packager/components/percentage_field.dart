import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/ui/screens/packager/components/form_field.dart';

class PercentageField extends MyFormField {
  const PercentageField({
    super.key,
    this.value = 0,
    this.onChanged,
    required this.hint,
    this.info,
  });

  final double value;
  final ValueChanged<double>? onChanged;
  final String hint;
  final String? info;

  @override
  Widget build(BuildContext context) {
    final child = Material(
      color: AppColors.grey3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(34),
      ),
      child: SizedBox(
        height: 88,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              hint,
              style: AppTextStyles.h4(context.layout),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
    );
    return SizedBox(
      height: MyFormField.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (info == null)
            child
          else
            Tooltip(
              verticalOffset: 50,
              message: info,
              child: child,
            ),
          Row(
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
                  style: AppTextStyles.h3(context.layout).copyWith(
                    color: AppColors.lightGreen,
                  ),
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
