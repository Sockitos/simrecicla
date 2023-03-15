import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/text_styles.dart';

class Copyright extends StatelessWidget {
  const Copyright({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '© 2023 Sociedade Ponto Verde / Tratolixo',
      textAlign: TextAlign.end,
      style: AppTextStyles.bodyS(context.layout)
          .withColor(AppColors.white.withOpacity(0.5)),
    );
  }
}
