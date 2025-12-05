// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotpasswordButton extends ConsumerWidget {
  final VoidCallback onTap;
  const ForgotpasswordButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: onTap,
        child: Text(
          "Forgot your password?",
          style: TextStyle(color: Color(0xFF9013FE), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
