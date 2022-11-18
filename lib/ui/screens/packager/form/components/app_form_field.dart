import 'package:flutter/material.dart';
import 'package:simtech/constants/colors.dart';

abstract class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    this.info,
  });

  final String? info;

  static const double height = 148;

  Widget buildChild(BuildContext context);

  Widget? buildBottom(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    final formChild = Material(
      color: AppColors.grey3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(34),
      ),
      child: SizedBox(
        height: 88,
        child: buildChild(context),
      ),
    );
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (info == null)
            formChild
          else
            Tooltip(
              verticalOffset: 50,
              message: info,
              child: formChild,
            ),
          buildBottom(context) ?? const SizedBox(),
          const Spacer(),
        ],
      ),
    );
  }
}
