import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/ui/screens/packager/components/form_field.dart';

bool useNodeHasFocus(FocusNode focusNode) {
  final hasFocus = useState(focusNode.hasFocus);
  useEffect(
    () {
      void listener() {
        hasFocus.value = focusNode.hasFocus;
      }

      focusNode.addListener(listener);
      return () {
        focusNode.removeListener(listener);
      };
    },
    [focusNode],
  );

  return hasFocus.value;
}

class NumberField extends MyFormField {
  const NumberField({
    super.key,
    this.value,
    this.onChanged,
    required this.hint,
    required this.inputHint,
    this.info,
  });

  final int? value;
  final ValueChanged<int?>? onChanged;
  final String hint;
  final String inputHint;
  final String? info;

  @override
  Widget build(BuildContext context) {
    final child = Material(
      color: AppColors.grey3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(34),
      ),
      child: HookBuilder(
        builder: (context) {
          final focusNode = useFocusNode();
          final hasFocus = useNodeHasFocus(focusNode);
          return InkWell(
            onTap: hasFocus ? null : focusNode.requestFocus,
            focusColor: Colors.transparent,
            canRequestFocus: false,
            borderRadius: BorderRadius.circular(34),
            child: SizedBox(
              height: 88,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        hint,
                        style: AppTextStyles.h4(context.layout),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          initialValue: value != null ? '$value' : null,
                          onChanged: onChanged != null
                              ? (value) => onChanged!(int.tryParse(value))
                              : null,
                          focusNode: focusNode,
                          keyboardType: TextInputType.number,
                          style: AppTextStyles.h3(context.layout).copyWith(
                            color: AppColors.lightGreen,
                          ),
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: inputHint,
                            hintStyle:
                                AppTextStyles.h3(context.layout).copyWith(
                              color: AppColors.grey5,
                            ),
                            border: InputBorder.none,
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(7),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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
          const Spacer(),
        ],
      ),
    );
  }
}
