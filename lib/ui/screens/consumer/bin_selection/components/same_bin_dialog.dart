import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/gen/assets.gen.dart';
import 'package:simtech/ui/widgets/app_dialog.dart';

class SameBinDialog extends StatelessWidget {
  const SameBinDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: DefaultTextStyle(
          style: context.layout.value(
            xs: AppTextStyles.bodyM(context.layout),
            md: AppTextStyles.bodyL(context.layout),
          ),
          child: ListView(
            padding: AppSpacings.dialogPadding(context.layout) +
                EdgeInsets.symmetric(
                  horizontal: context.layout.value(
                    xs: 0,
                    sm: 10,
                    md: 20,
                  ),
                ),
            shrinkWrap: true,
            children: [
              Assets.svgs.sameBin.svg(
                width: context.layout.value(xs: 280, sm: 440),
              ),
              const SizedBox(height: 30),
              const Text(
                'Um dos maiores mitos da reciclagem é que as embalagens separadas pelos cidadãos são novamente misturadas no camião de recolha. Desengane-se!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              const Text(
                'Na maioria dos Sistemas de Gestão de Resíduos Urbanos, a viatura recolhe apenas um tipo de ecoponto por circuito, facto que poderá confirmar na prática se acompanhar uma recolha na sua área de residência. ',
              ),
              const SizedBox(height: 25),
              const Text(
                'Em alguns locais é realizada a recolha simultânea de ecopontos de cores diferentes, mas nesse caso a recolha seletiva é assegurada por veículos bicompartimentados, que permitem recolher mais que um tipo de material de embalagem.',
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
