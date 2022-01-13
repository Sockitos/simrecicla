import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/router/router.gr.dart';
import 'package:simtech/src/ui/widgets/footer/footer.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    Key? key,
    required this.body,
    this.padding = const EdgeInsets.symmetric(horizontal: 60),
  }) : super(key: key);

  final Widget body;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBar(
            toolbarHeight: 60,
            leading: const BackButton(),
            title: Text(
              'Circular SimTech',
              style: AppTextStyles.h4,
            ),
            actions: [
              TextButton(
                onPressed: () => AutoRouter.of(context).push(
                  const ConsumerScreenRoute(),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Reciclar',
                    style: AppTextStyles.dropdown,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => AutoRouter.of(context).push(
                  const PackagerScreenRoute(),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Melhorar embalagem',
                    style: AppTextStyles.dropdown,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => AutoRouter.of(context).push(
                  const RecyclerScreenRoute(),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Otimizar linha',
                    style: AppTextStyles.dropdown,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Sobre',
                    style: AppTextStyles.dropdown,
                  ),
                ),
              ),
              const SizedBox(width: 50),
            ],
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  60,
            ),
            child: Padding(
              padding: padding,
              child: body,
            ),
          ),
          const Footer()
        ],
      ),
    );
  }
}
