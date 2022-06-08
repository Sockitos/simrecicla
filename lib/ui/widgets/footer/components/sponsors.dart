import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';

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
    return SvgPicture.asset(
      'assets/svgs/tratolixo.svg',
      color: AppColors.white,
    );
  }
}

class _Drivers extends StatelessWidget {
  const _Drivers();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svgs/3drivers.svg',
      color: AppColors.white,
    );
  }
}

class _Ist extends StatelessWidget {
  const _Ist();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svgs/ist.svg',
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
            style: AppTextStyles.small(context.layout)
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          SvgPicture.asset(
            'assets/svgs/sociedade_pontoverde.svg',
            color: AppColors.white,
            height: 50,
          ),
        ],
      ),
    );
  }
}
