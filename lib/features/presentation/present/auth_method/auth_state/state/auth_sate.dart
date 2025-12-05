class AuthStates {
  final String userEmail;
  final String userPassworld;
  final String userName;
  final bool isLoading;

  const AuthStates({
    this.userEmail = "",
    this.userPassworld = "",
    this.userName = "",
    this.isLoading = false,
  });
  bool get validation => userEmail.isNotEmpty && userPassworld.isNotEmpty;
  AuthStates copyWith({
    String? userEmail,
    String? userPassworld,
    String? userName,
    bool? isLoading,
  }) {
    return AuthStates(
      userEmail: userEmail ?? this.userEmail,
      userPassworld: userPassworld ?? this.userPassworld,
      userName: userName ?? this.userName,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
