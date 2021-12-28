import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/component.dart';

class BinTarget extends StatelessWidget {
  const BinTarget({
    Key? key,
    required this.label,
    required this.svgPath,
    this.components,
    this.onAccept,
  }) : super(key: key);

  final String label;
  final String svgPath;
  final List<Component>? components;
  final DragTargetAccept<Component>? onAccept;

  @override
  Widget build(BuildContext context) {
    final numComponents = components?.length ?? 0;
    final labels = label.split(' ');
    return DragTarget<Component>(
      onWillAccept: (_) => true,
      onAccept: onAccept,
      builder: (context, _, __) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                svgPath,
                height: 150,
              ),
              if (numComponents >= 1)
                Positioned(
                  bottom: label != 'Contentor Indiferenciado' ? 15 : 30,
                  right: 50,
                  left: 0,
                  child: SvgPicture.asset(
                    components![0].svgPath,
                    height: components![0].svgPath == 'assets/svgs/lid.svg'
                        ? 15
                        : 40,
                  ),
                ),
              if (numComponents >= 2)
                Positioned(
                  bottom: label != 'Contentor Indiferenciado' ? 15 : 30,
                  right: 0,
                  left: 50,
                  child: SvgPicture.asset(
                    components![1].svgPath,
                    height: components![1].svgPath == 'assets/svgs/lid.svg'
                        ? 15
                        : 40,
                  ),
                ),
              if (numComponents >= 3)
                Positioned(
                  bottom: label != 'Contentor Indiferenciado' ? 55 : 70,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(
                    components![2].svgPath,
                    height: components![2].svgPath == 'assets/svgs/lid.svg'
                        ? 15
                        : 40,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            labels.first,
            style: AppTextStyles.h3,
          ),
          Text(
            labels.last,
            style: AppTextStyles.h3,
          ),
        ],
      ),
    );
  }
}
