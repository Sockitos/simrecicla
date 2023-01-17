import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/ui/screens/packager/form/components/app_form_field.dart';
import 'package:simrecicla/ui/widgets/app_dropdown.dart';

class DropdownField<T> extends AppFormField {
  const DropdownField({
    super.key,
    this.value,
    this.onChanged,
    required this.hint,
    super.info,
    required this.options,
    this.optionToString,
  });

  final T? value;
  final ValueChanged<T?>? onChanged;
  final String hint;
  final List<T> options;
  final String Function(T)? optionToString;

  @override
  Widget? buildBottom(BuildContext context) {
    if (value == null) return null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            // ignore: null_check_on_nullable_type_parameter
            optionToString == null ? '$value' : optionToString!(value!),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyM(context.layout),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return AppDropdownButtonHideUnderline(
      child: AppDropdownButton<T>(
        value: value,
        onChanged: onChanged,
        hint: Text(
          hint,
          style: AppTextStyles.h4(context.layout),
        ),
        disabledHint: Text(
          hint,
          style: AppTextStyles.h4(context.layout).withColor(AppColors.grey5),
        ),
        icon: value != null
            ? const Icon(Icons.check_rounded)
            : const Icon(Icons.chevron_right_rounded),
        iconSize: context.layout.value(xs: 30, sm: 48),
        iconEnabledColor: AppColors.lightGreen,
        iconDisabledColor: AppColors.grey5,
        borderRadius: BorderRadius.circular(34),
        isExpanded: true,
        elevation: 0,
        menuMaxHeight: 500,
        itemHeight: null,
        items: options.map((o) {
          final text = optionToString == null ? '$o' : optionToString!(o);
          final isNaoSei = text == 'Não sei';
          return AppDropdownMenuItem<T>(
            value: o,
            tooltip: isNaoSei
                ? 'Esta opção tem um elevado impacto na reciclabilidade'
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                isNaoSei ? '$text*' : text,
                style: AppTextStyles.bodyM(context.layout),
              ),
            ),
          );
        }).toList(),
        onTap: () {},
      ),
    );
  }
}
