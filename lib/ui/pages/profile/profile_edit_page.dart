import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/models/form/form_user_edit_model.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_input.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  void initState() {
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      nameController.text = authState.user.name!;
      usernameController.text = authState.user.username!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              profileSuccessRoute,
              (route) => false,
            );
          }
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 50),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaInput(
                    controller: usernameController,
                    labelText: 'Username',
                  ),
                  ShaInput(
                    controller: nameController,
                    labelText: 'Full Name',
                  ),
                  ShaInput(
                    controller: emailController,
                    labelText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  ShaInput(
                    controller: passwordController,
                    labelText: 'Password',
                    obscureText: true,
                    keyboardAction: TextInputAction.go,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: kBlackColor,
                          ),
                        );
                      }

                      return ShaButton(
                        text: 'Update Now',
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                AuthUpdateUser(
                                  FormUserEditModel(
                                    username: usernameController.text,
                                    email: emailController.text,
                                    name: nameController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                        },
                        margin: const EdgeInsets.only(top: 14),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
