import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/packager/enums.dart';
import 'package:simtech/ui/widgets/arrow.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
    required this.rating,
  });

  final Rating rating;

  static double getArrowPosition(Rating rating) {
    switch (rating) {
      case Rating.a:
        return 35;
      case Rating.b:
        return 145;
      case Rating.c:
        return 255;
      case Rating.d:
        return 365;
      case Rating.e:
        return 475;
      case Rating.f:
        return 585;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'rating_bar',
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            Text(
              'Totalmente reciclável',
              style: AppTextStyles.bodyL(context.layout),
            ),
            const Spacer(),
            SizedBox(
              height: 660,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  DefaultTextStyle(
                    style: AppTextStyles.h2(context.layout),
                    child: Column(
                      children: [
                        for (final r in Rating.values)
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(width: 35),
                                Container(color: r.color, width: 60),
                                const SizedBox(width: 25),
                                SizedBox(
                                  width: 10,
                                  child: Center(
                                    child: Text(r.name.toUpperCase()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    left: -55,
                    top: getArrowPosition(rating),
                    child: const Arrow(
                      size: Size(66, 40),
                      color: AppColors.lightGreen,
                      direction: AxisDirection.right,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              'Não reciclável',
              style: AppTextStyles.bodyL(context.layout),
            ),
          ],
        ),
      ),
    );
  }
}