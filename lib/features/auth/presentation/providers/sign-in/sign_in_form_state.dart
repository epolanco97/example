class SignInFormState {
  bool isPosted;
  String email;
  String password;
  bool obscurePassword;

  SignInFormState({
    this.isPosted = false,
    this.email = '',
    this.password = '',
    this.obscurePassword = true,
  });

  SignInFormState copyWith({
    bool? isPosted,
    String? email,
    String? password,
    bool? obscurePassword,
  }) =>
      SignInFormState(
        isPosted: isPosted ?? this.isPosted,
        email: email ?? this.email,
        password: password ?? this.password,
        obscurePassword: obscurePassword ?? this.obscurePassword,
      );
}
