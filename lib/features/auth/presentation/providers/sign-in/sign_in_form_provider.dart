import 'package:example/features/auth/presentation/providers/sign-in/sign_in_form_notifier.dart';
import 'package:example/features/auth/presentation/providers/sign-in/sign_in_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInFormProvider = StateNotifierProvider.autoDispose<SignInFormNotifier, SignInFormState>(
  (ref) => SignInFormNotifier(),
);
