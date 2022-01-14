import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/custom_icons.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/category.dart';
import 'package:simtech/src/router/router.gr.dart';

class PackagesDialog extends HookWidget {
  const PackagesDialog({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.fromLTRB(100, 150, 100, 100),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: DecoratedBox(
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
          color: AppColors.white,
          child: SizedBox(
            width: 880,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 56,
                vertical: 30,
              ),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 44,
                ),
                children: [
                  Text(
                    category.category,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h2,
                  ),
                  const SizedBox(height: 50),
                  Wrap(
                    spacing: 44,
                    runSpacing: 44,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      for (final package in category.packages)
                        SizedBox(
                          width: 190,
                          height: 190,
                          child: Material(
                            color: AppColors.grey3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(34),
                            ),
                            child: InkWell(
                              onTap: () => AutoRouter.of(context).push(
                                BinSelectionScreenRoute(package: package),
                              ),
                              borderRadius: BorderRadius.circular(34),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 5),
                                    Icon(
                                      CustomIcons.getIcon(package.iconId),
                                      size: 90,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          package.name,
                                          textAlign: TextAlign.center,
                                          style:
                                              AppTextStyles.paragraph.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({required this.builder}) : super();

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black12;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  String? get barrierLabel => null;
}
