// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/features/constants/asset_paths.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_controller/auth_controller.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_state/provider/auth_state_provider.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_screens/widget/ForgotPassword_button.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_screens/widget/signIn_form.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_screens/widget/social_buttion.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_screens/widget/submit_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogIn extends ConsumerWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final authProvider = ref.read(authControllerProvider);
    final authhelper = ref.watch(authProviders);
    final authNotifier = ref.read(authProviders.notifier);

    return Scaffold(
      body: Stack(
        children: [
          // Background image with blur
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset(AssetPaths.bG, fit: BoxFit.cover),
          ),

          // Positioned.fill(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //     child: Container(color: Colors.black.withOpacity(0.2)),
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.80,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Continue to log in",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    // const SizedBox(height: 5),
                    Text(
                      "Let's get you started.",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 25),

                    SigninForm(
                      keyboardType: TextInputType.emailAddress,
                      labelText: "Email address",
                      isPassWorld: false,
                      onChanged: (value) => authNotifier.updateEmail(value),
                    ),
                    const SizedBox(height: 20),
                    SigninForm(
                      keyboardType: TextInputType.visiblePassword,
                      labelText: "Password",
                      isPassWorld: true,
                      onChanged: (value) => authNotifier.updatePassword(value),
                    ),
                    const SizedBox(height: 25),

                    SubmitButton(
                      buttonText: 'Continue',
                      onTap: () async {
                        String email = authhelper.userEmail;
                        String pass = authhelper.userPassworld;

                        log(email);

                        final res = await authProvider.signIn(email, pass);
                        if (res != null) {
                          log(res.toString());
                          // ignore: use_build_context_synchronously

                          ScaffoldMessenger.of(
                            // ignore: use_build_context_synchronously
                            context,
                          ).showSnackBar(SnackBar(content: Text(res)));
                          // ignore: use_build_context_synchronously
                          context.go('/home');
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    ForgotpasswordButton(onTap: () {}),

                    const SizedBox(height: 25),
                    _buildOrText(),
                    const SizedBox(height: 20),

                    // Social login buttons
                    SocialButton(
                      buttonText: "Continue with Google",
                      onTap: () async {},
                      logo: AssetPaths.googleIcon,
                    ),
                    const SizedBox(height: 20),
                    SocialButton(
                      buttonText: "Continue with Apple",
                      onTap: () async {},
                      logo: AssetPaths.appIcon,
                    ),

                    const SizedBox(height: 25),
                    _buildSignUpText(context),
                    const SizedBox(height: 10),
                    _buildPrivacyText(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyText() {
    return Center(
      child: Text(
        "By continuing you agree to the Rules and Policy",
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildSignUpText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            context.push('/signup');
          },
          child: const Text(
            "Sign up",
            style: TextStyle(
              color: Color(0xFF9013FE),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrText() {
    return Center(
      child: const Text(
        "OR",
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }
}
