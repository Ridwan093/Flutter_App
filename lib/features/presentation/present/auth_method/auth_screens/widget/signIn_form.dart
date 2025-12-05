// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninForm extends ConsumerWidget {
  final String labelText;
  final bool isPassWorld;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  const SigninForm({
    super.key,
    required this.labelText,
    required this.isPassWorld,
    required this.onChanged,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(17),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(17),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(17),
        ),
        fillColor: Colors.white,
        filled: true,
        labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
        labelText: labelText,
        suffixIcon:
            isPassWorld
                ? Icon(Icons.visibility, size: 13, color: Colors.black)
                : null,
      ),
      onChanged: onChanged,
    );
  }
}
