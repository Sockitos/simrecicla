import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/spacings.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/models/recycler/material_sample.dart';
import 'package:simrecicla/ui/widgets/app_dialog.dart';

part 'feed_options.freezed.dart';

@freezed
class FeedOptionsModel with _$FeedOptionsModel {
  const factory FeedOptionsModel({
    @Default(false) bool useDefault,
    required double weight,
    required MaterialSample sample,
  }) = _FeedOptionsModel;
}

typedef FeedOptionsChanged = void Function(
  bool useDefault,
  double weight,
  MaterialSample sample,
);

class FeedOptions extends HookWidget {
  const FeedOptions({
    super.key,
    required this.useDefault,
    required this.feedWeight,
    required this.feedSample,
    required this.defaultWeight,
    required this.defaultSample,
    required this.onConfirm,
  });

  final bool useDefault;
  final double feedWeight;
  final MaterialSample feedSample;
  final double defaultWeight;
  final MaterialSample defaultSample;
  final FeedOptionsChanged onConfirm;

  @override
  Widget build(BuildContext context) {
    final state = useState(
      useDefault
          ? FeedOptionsModel(
              useDefault: true,
              weight: defaultWeight,
              sample: defaultSample,
            )
          : FeedOptionsModel(
              weight: feedWeight,
              sample: feedSample,
            ),
    );
    return AppDialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: AppSpacings.dialogPadding(context.layout),
          child: DefaultTextStyle(
            style: AppTextStyles.bodyM(context.layout),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: state.value.useDefault
                          ? () {}
                          : () {
                              state.value = FeedOptionsModel(
                                useDefault: true,
                                weight: defaultWeight,
                                sample: defaultSample,
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state.value.useDefault
                            ? AppColors.grey3
                            : AppColors.grey1,
                        foregroundColor: AppColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        fixedSize: const Size.fromHeight(48),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        textStyle: state.value.useDefault
                            ? AppTextStyles.smallButton(context.layout)
                                .copyWith(fontWeight: FontWeight.bold)
                            : AppTextStyles.smallButton(context.layout),
                      ),
                      child: const Text('Padrão'),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: !state.value.useDefault
                          ? () {}
                          : () {
                              state.value = FeedOptionsModel(
                                weight: feedWeight,
                                sample: feedSample,
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !state.value.useDefault
                            ? AppColors.grey3
                            : AppColors.grey1,
                        foregroundColor: AppColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        fixedSize: const Size.fromHeight(48),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        textStyle: !state.value.useDefault
                            ? AppTextStyles.smallButton(context.layout)
                                .copyWith(fontWeight: FontWeight.bold)
                            : AppTextStyles.smallButton(context.layout),
                      ),
                      child: const Text('Customizar'),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const Text(
                      'Peso Total (kg/h)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: HookBuilder(
                        builder: (context) {
                          final textController = useTextEditingController(
                            text: state.value.weight.toStringAsFixed(2),
                          );
                          useEffect(
                            () {
                              final newText =
                                  state.value.weight.toStringAsFixed(2);
                              if (newText != textController.text) {
                                textController.text =
                                    state.value.weight.toStringAsFixed(2);
                              }
                              return;
                            },
                            [state.value.weight],
                          );
                          return ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 150),
                            child: TextFormField(
                              controller: textController,
                              onChanged: (value) {
                                final newWeight = double.parse(value);
                                state.value = state.value.copyWith(
                                  weight: newWeight,
                                );
                              },
                              style: AppTextStyles.bodyM(context.layout),
                              inputFormatters: [DecimalFormatter()],
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              maxLength: 8,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              decoration: InputDecoration(
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 3,
                                    color: AppColors.grey3,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 3,
                                    color: AppColors.lightGreen,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                counterText: '',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                DefaultTextStyle.merge(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Materiais',
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Massa',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Composição',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                for (final m in state.value.sample.materials.keys)
                  _MaterialOption(
                    label: m.name,
                    weight: state.value.sample.getValue(m) * state.value.weight,
                    percentage: state.value.sample.getValue(m),
                    isEditable: !state.value.useDefault,
                    onValueChanged: (value) {
                      final sample =
                          state.value.sample.mulAll(state.value.weight);
                      final diff = sample.getValue(m) - value;
                      final newWeight = state.value.weight - diff;
                      final newSample = MaterialSample(
                        materials: {
                          ...sample.materials,
                          m: value,
                        },
                        naoRecuperaveis: sample.naoRecuperaveis,
                      ).divAll(newWeight);
                      state.value = FeedOptionsModel(
                        weight: newWeight,
                        sample: newSample,
                      );
                    },
                  ),
                const SizedBox(height: 20),
                _MaterialOption(
                  label: 'Não recuperáveis',
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  weight:
                      state.value.sample.naoRecuperaveis * state.value.weight,
                  percentage: state.value.sample.naoRecuperaveis,
                  isEditable: !state.value.useDefault,
                  onValueChanged: (value) {
                    final sample =
                        state.value.sample.mulAll(state.value.weight);
                    final diff = sample.naoRecuperaveis - value;
                    final newWeight = state.value.weight - diff;
                    final newSample = sample
                        .copyWith(naoRecuperaveis: value)
                        .divAll(newWeight);
                    state.value = FeedOptionsModel(
                      weight: newWeight,
                      sample: newSample,
                    );
                  },
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      onConfirm(
                        state.value.useDefault,
                        state.value.weight,
                        state.value.sample,
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(48),
                      textStyle:
                          AppTextStyles.h5(context.layout).copyWith(height: 1),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    child: const Text('Confirmar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MaterialOption extends StatelessWidget {
  const _MaterialOption({
    required this.label,
    this.labelStyle,
    required this.weight,
    required this.percentage,
    this.isEditable = true,
    required this.onValueChanged,
  });

  final String label;
  final TextStyle? labelStyle;
  final double weight;
  final double percentage;
  final bool isEditable;
  final ValueChanged<double> onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                label,
                style: labelStyle,
              ),
            ),
          ),
          if (isEditable)
            Expanded(
              child: Center(
                child: IntrinsicWidth(
                  child: HookBuilder(
                    builder: (context) {
                      final textController = useTextEditingController();
                      useEffect(
                        () {
                          final newText = weight.toStringAsFixed(2);
                          if (newText != textController.text) {
                            textController.text = weight.toStringAsFixed(2);
                          }
                          return;
                        },
                        [weight],
                      );
                      return TextFormField(
                        controller: textController,
                        onChanged: (value) {
                          final weight = double.parse(value);
                          onValueChanged(weight);
                        },
                        style: AppTextStyles.bodyM(context.layout),
                        inputFormatters: [DecimalFormatter()],
                        maxLength: 8,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(2, 2, 0, 2),
                          constraints: BoxConstraints(),
                          counterText: '',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.grey3),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: Text(
                weight.toStringAsFixed(2),
                textAlign: TextAlign.center,
              ),
            ),
          Expanded(
            child: Text(
              '${(percentage * 100).toStringAsFixed(2)}%',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DecimalFormatter extends NumberInputFormatter {
  DecimalFormatter()
      : _decimalRegex = RegExp(r'[0-9]+\.?'),
        _decimalFormatter = FilteringTextInputFormatter.allow(
          RegExp(r'[0-9]+\.?'),
        );
  static final NumberFormat _formatter = NumberFormat('0.00');

  final FilteringTextInputFormatter _decimalFormatter;
  final RegExp _decimalRegex;

  @override
  String _formatPattern(String? digits) {
    if (digits == null || digits.isEmpty) return '';
    num number;
    number = double.tryParse(digits) ?? 0.0;
    final result = _formatter.format(number);
    return result;
  }

  @override
  TextEditingValue _formatValue(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return _decimalFormatter.formatEditUpdate(oldValue, newValue);
  }

  @override
  bool _isUserInput(String s) {
    return s == '.' || _decimalRegex.firstMatch(s) != null;
  }
}

abstract class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    /// remove all invalid characters
    // ignore: parameter_assignments
    newValue = _formatValue(oldValue, newValue);

    /// current selection
    var selectionIndex = newValue.selection.end;

    /// format original string, this step would add some separator
    /// characters to original string
    final newText = _formatPattern(newValue.text);

    /// count number of inserted character in new string
    var insertCount = 0;

    /// count number of original input character in new string
    var inputCount = 0;
    for (var i = 0; i < newText.length && inputCount < selectionIndex; i++) {
      final character = newText[i];
      if (_isUserInput(character)) {
        inputCount++;
      } else {
        insertCount++;
      }
    }

    /// adjust selection according to number of inserted characters staying before
    /// selection
    selectionIndex += insertCount;
    selectionIndex = min(selectionIndex, newText.length);

    /// if selection is right after an inserted character, it should be moved
    /// backward, this adjustment prevents an issue that user cannot delete
    /// characters when cursor stands right after inserted characters
    if (selectionIndex - 1 >= 0 &&
        selectionIndex - 1 < newText.length &&
        !_isUserInput(newText[selectionIndex - 1])) {
      selectionIndex--;
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
      composing: TextRange.empty,
    );
  }

  /// check character from user input or being inserted by pattern formatter
  bool _isUserInput(String s);

  /// format user input with pattern formatter
  String _formatPattern(String digits);

  /// validate user input
  TextEditingValue _formatValue(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  );
}
