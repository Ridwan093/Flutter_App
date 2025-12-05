import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/features/presentation/landing_page/splas_screen.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_screens/screen/logIn.dart';
import 'package:flutter_app/features/presentation/present/auth_method/auth_screens/screen/sign_up.dart';
import 'package:flutter_app/features/presentation/present/main_page/screen/homePage.dart';
import 'package:flutter_app/features/utils/navigation/go_router_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',

    // IMPORTANT: updates router when Firebase auth state changes
    refreshListenable: GoRouterRefreshStream(
      FirebaseAuth.instance.authStateChanges(),
    ),

    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/login', builder: (_, __) => const LogIn()),
      GoRoute(path: '/signup', builder: (_, __) => const SignUp()),
      GoRoute(path: '/home', builder: (_, __) => const Homepage()),
    ],

    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final location = state.uri.toString();

      final loggingIn = location == '/login' || location == '/signup';
      final atSplash = location == '/splash';

      // ALWAYS allow splash to show
      if (atSplash) return null;

      // Not logged in → redirect to login
      if (user == null && !loggingIn) {
        return '/login';
      }

      // Logged in → redirect away from login/signup
      if (user != null && loggingIn) {
        return '/home';
      }

      return null;
    },
  );
});
