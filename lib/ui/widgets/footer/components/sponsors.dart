import 'package:flutter/cupertino.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/gen/assets.gen.dart';

class Sponsors {
  static const tratolixo = _Tratolixo();
  static const drivers = _Drivers();
  static const ist = _Ist();
  static const sociedadePontoverde = _SociedadePontoverde();
}

class _Tratolixo extends StatelessWidget {
  const _Tratolixo();

  @override
  Widget build(BuildContext context) {
    return Assets.svgs.tratolixo.svg(
      color: AppColors.white,
    );
  }
}

class _Drivers extends StatelessWidget {
  const _Drivers();

  @override
  Widget build(BuildContext context) {
    return Assets.svgs.drivers.svg(
      color: AppColors.white,
    );
  }
}

class _Ist extends StatelessWidget {
  const _Ist();

  @override
  Widget build(BuildContext context) {
    return Assets.svgs.ist.svg(
      color: AppColors.white,
    );
  }
}

class _SociedadePontoverde extends StatelessWidget {
  const _SociedadePontoverde();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cofinanciado por',
            style: AppTextStyles.bodyS(context.layout)
                .withColor(AppColors.white)
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          Assets.svgs.sociedadePontoverde.svg(
            color: AppColors.white,
            height: 50,
          ),
        ],
      ),
    );
  }
}
