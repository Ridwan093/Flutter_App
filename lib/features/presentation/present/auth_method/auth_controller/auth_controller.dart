import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_state/provider/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authControllerProvider = Provider<AuthController>(
  (ref) => AuthController(ref),
);

class AuthController {
  final Ref ref;
  AuthController(this.ref);

  // Email login
  Future<String?> signIn(String email, String password) async {
    try {
      ref.read(authProviders.notifier).setLoading(true);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ref.read(authProviders.notifier).setLoading(false);
      return null;
    } on FirebaseAuthException catch (e) {
      ref.read(authProviders.notifier).setLoading(false);
      return e.message;
    }
  }

  // Register
  Future<String?> register(String email, String password) async {
    try {
      ref.read(authProviders.notifier).setLoading(true);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ref.read(authProviders.notifier).setLoading(false);
      return null;
    } on FirebaseAuthException catch (e) {
      ref.read(authProviders.notifier).setLoading(false);
      return e.message;
    }
  }

  // Logout
  Future<void> logout() async {
    ref.read(authProviders.notifier).setLoading(true);
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn.instance.signOut();
    ref.read(authProviders.notifier).setLoading(false);
  }
}
