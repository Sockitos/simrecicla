import 'package:flutter/material.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/ui/widgets/my_dropdown.dart';

class DropdownField<T> extends StatelessWidget {
  const DropdownField({
    Key? key,
    this.value,
    required this.onChanged,
    required this.hint,
    required this.options,
    this.optionToString,
  }) : super(key: key);

  final T? value;
  final ValueChanged<T?>? onChanged;
  final String hint;
  final List<T> options;
  final String Function(T)? optionToString;

  @override
  Widget build(BuildContext context) {
    return Material(
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
                  style: AppTextStyles.h4,
                ),
                icon: value != null
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.chevron_right_rounded),
                iconSize: 48,
                iconEnabledColor: AppColors.lightGreen,
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
                          style: AppTextStyles.dropdown,
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
  }
}
