import 'package:example/features/auth/presentation/providers/sign-in/sign_in_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: _SignInView(),
    )));
  }
}

class _SignInView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
      key: ref.read(signInFormProvider.notifier).signInFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login', style: textTheme.headlineLarge),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Correo electrónico'),
            ),
            validator: (value) => value?.isEmpty ?? true ? 'Campo requerido' : null,
            onChanged: ref.read(signInFormProvider.notifier).onChangeEmail,
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: ref.watch(signInFormProvider).obscurePassword,
            decoration: InputDecoration(
              label: const Text('Contraseña'),
              suffixIcon: IconButton(
                onPressed: () => ref.read(signInFormProvider.notifier).onObscurePassword(),
                icon: Icon((ref.watch(signInFormProvider).obscurePassword) ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            validator: (value) => value?.isEmpty ?? true ? 'Campo requerido' : null,
            onChanged: ref.read(signInFormProvider.notifier).onChangePassword,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => ref.read(signInFormProvider.notifier).onFormSubmit(),
              child: const Text('Iniciar sesión'),
            ),
          ),
        ],
      ),
    );
  }
}
