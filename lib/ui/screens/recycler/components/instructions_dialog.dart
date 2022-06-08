import 'package:flutter/material.dart';
import 'package:simtech/ui/widgets/my_dialog.dart';

class InstructionsDialog extends StatelessWidget {
  const InstructionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyDialog(
      child: SizedBox(
        height: 500,
        width: 500,
      ),
    );
  }
}
