import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_input.dart';

class ProfilePinPage extends StatefulWidget {
  const ProfilePinPage({super.key});

  @override
  State<ProfilePinPage> createState() => _ProfilePinPageState();
}

class _ProfilePinPageState extends State<ProfilePinPage> {
  final TextEditingController oldPinController =
      TextEditingController(text: '');
  final TextEditingController newPinController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit PIN'),
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
                    controller: oldPinController,
                    labelText: 'Old PIN',
                    obscureText: true,
                    keyboardType: TextInputType.number,
                  ),
                  ShaInput(
                    controller: newPinController,
                    labelText: 'New PIN',
                    obscureText: true,
                    keyboardType: TextInputType.number,
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
                                AuthUpdatePin(
                                  oldPinController.text,
                                  newPinController.text,
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
