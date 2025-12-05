// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_controller/auth_controller.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_state/provider/auth_state_provider.dart';
import 'package:flutter_app/features/presentation/present/main_page/widget/draw_widget.dart';
import 'package:flutter_app/features/presentation/present/main_page/widget/product_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRovider = ref.read(authControllerProvider);
    final isLoading = ref.watch(authProviders).isLoading;

    return Scaffold(
      backgroundColor: const Color(0xFF2C0066),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        backgroundColor: const Color(0xFF2C0066),
        title: const Text(
          "Enter to win the Oraimo openSnap!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          if (isLoading) ...[
            CircularProgressIndicator(color: Colors.white),
          ] else
            IconButton(
              onPressed: () async {
                authRovider.logout();
                context.go('/login');
              },
              icon: Icon(Icons.logout, color: Colors.white),
            ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                /// PRODUCT
                ProductWidget(),

                /// DRAW SECTION
                DrawWidget(),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
