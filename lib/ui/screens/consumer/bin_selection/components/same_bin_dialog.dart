import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/ui/widgets/my_dialog.dart';

class SameBinDialog extends StatelessWidget {
  const SameBinDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 90,
            vertical: 30,
          ),
          shrinkWrap: true,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svgs/same_bin.svg',
                  width: 440,
                ),
                Positioned(
                  left: 146,
                  top: 50,
                  child: SizedBox(
                    width: 220,
                    child: Text(
                      'Mas tu separas as embalagens? Eles depois misturam e vai tudo junto para o mesmo sítio!!',
                      style: AppTextStyles.h5(context.layout),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Um dos maiores mitos da reciclagem é que as embalagens separadas pelos cidadãos são novamente misturadas no camião de recolha. Desengane-se!',
              style: AppTextStyles.h5(context.layout),
            ),
            const SizedBox(height: 25),
            Text(
              'Na grande maioria das situações, a viatura recolhe apenas um tipo de ecoponto por circuito, facto que poderá confirmar na prática se acompanhar uma recolha na sua área de residência. ',
              style: AppTextStyles.paragraph(context.layout),
            ),
            const SizedBox(height: 25),
            Text(
              style: AppTextStyles.paragraph(context.layout),
              'Em alguns locais é realizada a recolha simultânea de ecopontos de cores diferentes, mas nesse caso a recolha seletiva é assegurada por veículos bicompartimentados, que permitem recolher mais que um tipo de material de embalagem.',
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
