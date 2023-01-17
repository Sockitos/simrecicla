import 'package:flutter/material.dart';
import 'package:simrecicla/constants/colors.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blackShadow,
            offset: Offset(0, 3),
            blurRadius: 20,
          )
        ],
      ),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
        color: AppColors.white,
        child: child,
      ),
    );
  }
}
