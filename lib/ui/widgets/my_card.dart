import 'package:flutter/material.dart';
import 'package:simtech/constants/colors.dart';

class MyCard extends StatelessWidget {
  const MyCard({
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
            color: Colors.black12,
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
