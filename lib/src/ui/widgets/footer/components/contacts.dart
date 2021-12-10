import 'package:flutter/material.dart';
import 'package:simtech/src/constants/text_styles.dart';

class Contacts extends StatelessWidget {
  const Contacts({
    Key? key,
    this.textAlign,
  }) : super(key: key);

  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppTextStyles.small,
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
            'geral@pontoverdelab.pt',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          Text('210 102 400'),
        ],
      ),
    );
  }
}
