import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/ui/widgets/footer/footer.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    required this.body,
    this.padding,
    this.backgroundColor,
  });

  final Widget body;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final isTooSmall = MediaQuery.of(context).size.width < 375;
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: Drawer(
        child: ListView(
          primary: false,
          children: [
            SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Circular SimTech',
                      style: AppTextStyles.h4(context.layout),
                    ),
                    const Spacer(),
                    const CloseButton(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => context.go('/consumer'),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Text(
                      'Reciclar',
                      style: AppTextStyles.bodyM(context.layout),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () => context.go('/packager'),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Text(
                      'Melhorar embalagem',
                      style: AppTextStyles.bodyM(context.layout),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () => context.go('/recycler'),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Text(
                      'Otimizar linha',
                      style: AppTextStyles.bodyM(context.layout),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: const MaterialScrollBehavior(),
        child: isTooSmall
            ? const ColoredBox(
                color: AppColors.lightGreen,
                child: SizedBox.expand(),
              )
            : ListView(
                primary: true,
                children: [
                  AppBar(
                    title: Text(
                      'Circular SimTech',
                      style: AppTextStyles.h4(context.layout),
                    ),
                    leading: kIsWeb ? null : const BackButton(),
                    titleSpacing: AppSpacings.big(context.layout),
                    automaticallyImplyLeading: false,
                    actions: context.breakpoint > LayoutBreakpoint.sm
                        ? [
                            TextButton(
                              onPressed: () => context.go('/consumer'),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Reciclar',
                                  style: AppTextStyles.bodyM(context.layout),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => context.go('/packager'),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Melhorar embalagem',
                                  style: AppTextStyles.bodyM(context.layout),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => context.go('/recycler'),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Otimizar linha',
                                  style: AppTextStyles.bodyM(context.layout),
                                ),
                              ),
                            ),
                            SizedBox(width: AppSpacings.big(context.layout)),
                          ]
                        : [
                            Builder(
                              builder: (context) {
                                return IconButton(
                                  onPressed: Scaffold.of(context).openDrawer,
                                  icon: const Icon(Icons.menu_rounded),
                                );
                              },
                            ),
                            SizedBox(
                              width: AppSpacings.big(context.layout) - 8,
                            ),
                          ],
                  ),
                  ClipRect(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            MediaQuery.of(context).padding.bottom -
                            60,
                      ),
                      child: Padding(
                        padding: padding ??
                            AppSpacings.screenPadding(context.layout),
                        child: body,
                      ),
                    ),
                  ),
                  const Footer(),
                ],
              ),
      ),
    );
  }
}
