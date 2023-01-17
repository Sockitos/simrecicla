import 'package:flutter/widgets.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/ui/widgets/arrow.dart';
import 'package:simrecicla/ui/widgets/linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({
    super.key,
    required this.number,
    required this.wrong,
    required this.right,
  });

  final int number;
  final String wrong;
  final String right;

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      xs: (context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4,
                  color: AppColors.lightGreen,
                ),
              ),
              child: Center(
                child: Text(
                  '$number',
                  style: AppTextStyles.h2(context.layout)
                      .withColor(AppColors.lightGreen)
                      .copyWith(height: 1.1),
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wrong,
                  style: AppTextStyles.bodyM(context.layout),
                ),
                const SizedBox(height: 16),
                const Arrow(
                  size: Size(32, 44),
                  color: AppColors.lightGreen,
                  direction: AxisDirection.down,
                ),
                const SizedBox(height: 16),
                Linkify(
                  text: right,
                  formatter: (_) => 'aqui',
                  onOpen: (url) => launchUrlString(url.url),
                  style: AppTextStyles.bodyM(context.layout),
                ),
              ],
            ),
          ),
        ],
      ),
      md: (context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            width: 64,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4,
                  color: AppColors.lightGreen,
                ),
              ),
              child: Center(
                child: Text(
                  '$number',
                  style: AppTextStyles.h2(context.layout)
                      .withColor(AppColors.lightGreen)
                      .copyWith(height: 1.1),
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Text(
              wrong,
              style: context.layout.value(
                xs: AppTextStyles.bodyM(context.layout),
                lg: AppTextStyles.bodyL(context.layout),
              ),
            ),
          ),
          const SizedBox(width: 24),
          const Arrow(
            size: Size(66, 40),
            color: AppColors.lightGreen,
            direction: AxisDirection.right,
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Linkify(
              text: right,
              formatter: (_) => 'aqui',
              onOpen: (url) => launchUrlString(url.url),
              style: context.layout.value(
                xs: AppTextStyles.bodyM(context.layout),
                lg: AppTextStyles.bodyL(context.layout),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
