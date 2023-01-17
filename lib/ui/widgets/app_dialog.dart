import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/spacings.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: AppSpacings.dialogMargin(context.layout),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: DecoratedBox(
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34),
          ),
          color: AppColors.white,
          child: Stack(
            children: [
              child,
              Positioned(
                right: 15,
                top: 15,
                child: IconButton(
                  onPressed: Navigator.of(context).pop,
                  iconSize: 40,
                  color: AppColors.lightGreen,
                  icon: const Icon(Icons.close_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
