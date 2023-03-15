import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/spacings.dart';
import 'package:simrecicla/ui/widgets/footer/components/contacts.dart';
import 'package:simrecicla/ui/widgets/footer/components/copyright.dart';
import 'package:simrecicla/ui/widgets/footer/components/sponsors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      width: double.maxFinite,
      color: AppColors.darkGreen,
      child: Padding(
        padding: AppSpacings.screenPadding(context.layout),
        child: AdaptiveBuilder(
          xs: (context) => const _XsFooter(),
          sm: (context) => const _SmFooter(),
          md: (context) => const _MdFooter(),
          lg: (context) => const _LgFooter(),
        ),
      ),
    );
  }
}

class _LgFooter extends StatelessWidget {
  const _LgFooter();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(child: Sponsors.tratolixo),
                SizedBox(width: 40),
                Expanded(child: Sponsors.drivers),
                SizedBox(width: 40),
                Expanded(child: Sponsors.ist),
                SizedBox(width: 40),
                Expanded(child: Sponsors.sociedadePontoverde),
              ],
            ),
          ),
          const SizedBox(width: 60),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Spacer(),
                SizedBox(
                  width: 360,
                  child: Contacts(),
                ),
                Spacer(flex: 2),
                Copyright(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MdFooter extends StatelessWidget {
  const _MdFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(child: Sponsors.tratolixo),
            SizedBox(width: 40),
            Expanded(child: Sponsors.drivers),
            SizedBox(width: 40),
            Expanded(child: Sponsors.ist),
            SizedBox(width: 40),
            Expanded(child: Sponsors.sociedadePontoverde),
          ],
        ),
        const SizedBox(height: 60),
        SizedBox(
          height: 140,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              SizedBox(
                width: 360,
                child: Contacts(),
              ),
              Spacer(flex: 2),
              Copyright(),
            ],
          ),
        ),
      ],
    );
  }
}

class _SmFooter extends StatelessWidget {
  const _SmFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(child: Sponsors.drivers),
            SizedBox(width: 40),
            Expanded(child: Sponsors.tratolixo),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          children: const [
            Expanded(child: Sponsors.ist),
            SizedBox(width: 40),
            Expanded(child: Sponsors.sociedadePontoverde),
          ],
        ),
        const SizedBox(height: 60),
        SizedBox(
          height: 140,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Expanded(child: Contacts()),
              Expanded(child: Copyright())
            ],
          ),
        ),
      ],
    );
  }
}

class _XsFooter extends StatelessWidget {
  const _XsFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Sponsors.tratolixo,
        SizedBox(height: 40),
        Sponsors.drivers,
        SizedBox(height: 40),
        Sponsors.ist,
        SizedBox(height: 40),
        Sponsors.sociedadePontoverde,
        SizedBox(height: 60),
        SizedBox(
          height: 120,
          child: Contacts(
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 40),
        Copyright(),
      ],
    );
  }
}
