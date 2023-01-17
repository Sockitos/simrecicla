import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/text_styles.dart';

class Contacts extends StatelessWidget {
  const Contacts({
    super.key,
    this.textAlign,
  });

  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppTextStyles.bodyS(context.layout).withColor(AppColors.white),
      textAlign: textAlign,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            'Contactos',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            'Para esclarecimento de qualquer dúvida entre em contacto conosco através dos meios disponíveis:',
          ),
          Spacer(),
          Text(
            'residuos@tratolixo.pt',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          Text('21 445 95 00'),
        ],
      ),
    );
  }
}
