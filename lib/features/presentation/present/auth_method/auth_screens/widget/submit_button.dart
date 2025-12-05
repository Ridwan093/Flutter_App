import 'package:flutter/material.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_state/provider/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubmitButton extends ConsumerWidget {
  final String buttonText;
  final VoidCallback onTap;
  const SubmitButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final authhelper = ref.watch(authProviders);
    return InkWell(
      onTap: authhelper.validation ? onTap : null,
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient:
              authhelper.validation
                  ? LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.grey, Colors.black],
                  )
                  : LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.grey, Colors.grey],
                  ),
        ),
        child: Center(
          child:
              authhelper.isLoading
                  ? CircularProgressIndicator(color: Color(0xFF9013FE))
                  : Text(buttonText, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
