import 'dart:convert';
import 'dart:developer';

import 'package:example/features/auth/presentation/providers/sign-in/sign_in_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInFormNotifier extends StateNotifier<SignInFormState> {
  SignInFormNotifier() : super(SignInFormState());

  final signInFormKey = GlobalKey<FormState>();

  onChangeEmail(String value) => state = state.copyWith(email: value);

  onChangePassword(String value) => state = state.copyWith(password: value);

  onObscurePassword() => state = state.copyWith(obscurePassword: !state.obscurePassword);

  onFormSubmit() {
    if (!signInFormKey.currentState!.validate()) return;

    log(jsonEncode({
      'email': state.email,
      'password': state.password,
    }));
  }
}
