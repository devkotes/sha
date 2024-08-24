import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController _pinController = TextEditingController(text: '');

  String pin = '';
  bool isError = false;

  addPin(String number) {
    if (_pinController.text.length < 6) {
      setState(() {
        _pinController.text = _pinController.text + number;
      });
    }

    if (_pinController.text.length == 6) {
      if (_pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          isError = true;
        });
        showCustomSnackbar(
          context,
          'PIN yang anda masukkan salah. Silakan coba lagi.',
        );
      }
    }
  }

  deletePin() {
    if (_pinController.text.isNotEmpty) {
      setState(() {
        isError = false;
        _pinController.text =
            _pinController.text.substring(0, _pinController.text.length - 1);
      });
    }
  }

  @override
  void initState() {
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      pin = authState.user.pin!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 72),
              child: Text(
                'Sha PIN',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: _pinController,
                obscureText: true,
                obscuringCharacter: '*',
                enabled: false,
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                  letterSpacing: 16,
                  color: (isError) ? kRedColor : kWhiteColor,
                ),
                cursorColor: kGreyColor,
                decoration: InputDecoration(
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kGreyColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 66),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              child: Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  ShaInputButton(
                    title: '1',
                    onTapped: () {
                      addPin('1');
                    },
                  ),
                  ShaInputButton(
                    title: '2',
                    onTapped: () {
                      addPin('2');
                    },
                  ),
                  ShaInputButton(
                    title: '3',
                    onTapped: () {
                      addPin('3');
                    },
                  ),
                  ShaInputButton(
                    title: '4',
                    onTapped: () {
                      addPin('4');
                    },
                  ),
                  ShaInputButton(
                    title: '5',
                    onTapped: () {
                      addPin('5');
                    },
                  ),
                  ShaInputButton(
                    title: '6',
                    onTapped: () {
                      addPin('6');
                    },
                  ),
                  ShaInputButton(
                    title: '7',
                    onTapped: () {
                      addPin('7');
                    },
                  ),
                  ShaInputButton(
                    title: '8',
                    onTapped: () {
                      addPin('8');
                    },
                  ),
                  ShaInputButton(
                    title: '9',
                    onTapped: () {
                      addPin('9');
                    },
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  ShaInputButton(
                    title: '0',
                    onTapped: () {
                      addPin('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      deletePin();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kBlackColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
