import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simrecicla/ui/widgets/app_screen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Voltar à página inicial'),
        ),
      ),
    );
  }
}
