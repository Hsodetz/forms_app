import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario!'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = context.watch<RegisterCubit>();
    final Username username = registerCubit.state.username;
    final Email email = registerCubit.state.email;
    final Password password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de Usuario',
            onChanged: registerCubit.userNameChanged,
            errorMessage: username.errorMessage, 
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: 'Correo Electrónico',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: 'Contrasena',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
              onPressed: () {
  

                registerCubit.onSubmit();
              },
              icon: const Icon(Icons.save_outlined),
              label: const Text('Guardar')),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
