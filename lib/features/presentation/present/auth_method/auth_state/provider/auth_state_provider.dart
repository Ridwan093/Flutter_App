import 'package:flutter_app/features/presentation/present/auth_method/auth_state/state/auth_sate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final authProviders = NotifierProvider<AuthNotifier, AuthStates>(() {
  return AuthNotifier();
});

class AuthNotifier extends Notifier<AuthStates> {
  @override
  AuthStates build() {
    return const AuthStates();
  }

  void updateEmail(String email) {
    state = state.copyWith(userEmail: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(userPassworld: password);
  }

  void updateName(String name) {
    state = state.copyWith(userName: name);
  }

  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void resetAuth() {
    state = const AuthStates();
  }
}
