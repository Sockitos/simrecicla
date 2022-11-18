import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/ui/widgets/app_scrollbar.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      insetPadding: context.layout.value(
        xs: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 10,
        ),
        sm: EdgeInsets.symmetric(
          horizontal: AppSpacings.big(context.layout),
          vertical: screenHeight / 10,
        ),
      ),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
          color: AppColors.white,
          child: Stack(
            children: [
              AppScrollbar(child: child),
              Positioned(
                right: 15,
                top: 15,
                child: IconButton(
                  onPressed: Navigator.of(context).pop,
                  iconSize: 44,
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
