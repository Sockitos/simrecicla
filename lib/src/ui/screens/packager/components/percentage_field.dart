import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';

class PercentageField extends StatelessWidget {
  const PercentageField({
    Key? key,
    this.value = 0,
    this.onChanged,
    required this.hint,
    this.info,
  }) : super(key: key);

  final double value;
  final ValueChanged<double>? onChanged;
  final String hint;
  final String? info;

  static const double height = 156;

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
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
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
                  '${(value * 100).toInt()}',
                  style: AppTextStyles.h3(context.layout).copyWith(
                    color: AppColors.lightGreen,
                  ),
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
