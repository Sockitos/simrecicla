// ignore_for_file: null_check_on_nullable_type_parameter

import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/ui/screens/packager/components/form_field.dart';
import 'package:simtech/src/ui/widgets/my_dropdown.dart';

class DropdownField<T> extends MyFormField {
  const DropdownField({
    Key? key,
    this.value,
    this.onChanged,
    required this.hint,
    this.info,
    required this.options,
    this.optionToString,
  }) : super(key: key);

  final T? value;
  final ValueChanged<T?>? onChanged;
  final String hint;
  final String? info;
  final List<T> options;
  final String Function(T)? optionToString;

  @override
  Widget build(BuildContext context) {
    final child = Material(
      color: AppColors.grey3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(34),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(34),
        child: Center(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonHideUnderline(
              child: MyDropdownButton<T>(
                value: value,
                onChanged: onChanged,
                itemHeight: 88,
                hint: Text(
                  hint,
                  style: AppTextStyles.h4(context.layout),
                ),
                icon: value != null
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.chevron_right_rounded),
                iconSize: 48,
                iconEnabledColor: AppColors.lightGreen,
                iconDisabledColor: AppColors.grey5,
                borderRadius: BorderRadius.circular(34),
                isExpanded: true,
                elevation: 0,
                menuMaxHeight: 500,
                items: [
                  for (final o in options)
                    MyDropdownMenuItem<T>(
                      value: o,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          optionToString == null ? '$o' : optionToString!(o),
                          style: AppTextStyles.dropdown(context.layout),
                        ),
                      ),
                    ),
                ],
                onTap: () {},
              ),
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
          if (value != null) ...[
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                optionToString == null ? '$value' : optionToString!(value!),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.dropdown(context.layout)
                    .copyWith(color: AppColors.grey5),
              ),
            ),
          ],
          const Spacer(),
        ],
      ),
    );
  }
}
