import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_text_button.dart';
import 'package:url_launcher/url_launcher.dart';

class TopupAmountPage extends StatefulWidget {
  const TopupAmountPage({super.key});

  @override
  State<TopupAmountPage> createState() => _TopupAmountPageState();
}

class _TopupAmountPageState extends State<TopupAmountPage> {
  final TextEditingController _amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    _amountController.addListener(() {
      final text = _amountController.text;

      _amountController.value = _amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });

    super.initState();
  }

  addAmount(String number) {
    if (_amountController.text == '0') {
      _amountController.text = '';
    }
    setState(() {
      _amountController.text = _amountController.text + number;
    });
  }

  deleteAmount() {
    if (_amountController.text.isNotEmpty) {
      setState(() {
        _amountController.text = _amountController.text
            .substring(0, _amountController.text.length - 1);
      });
      if (_amountController.text == '') {
        _amountController.text = '0';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children: [
          const SizedBox(height: 40),
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 72),
              child: Text(
                'Total Amount',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: _amountController,
                enabled: false,
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                ),
                cursorColor: kGreyColor,
                decoration: InputDecoration(
                  prefix: Text(
                    'Rp ',
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kGreyColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 66),
          Center(
            child: Wrap(
              spacing: 40,
              runSpacing: 40,
              children: [
                ShaInputButton(
                  title: '1',
                  onTapped: () {
                    addAmount('1');
                  },
                ),
                ShaInputButton(
                  title: '2',
                  onTapped: () {
                    addAmount('2');
                  },
                ),
                ShaInputButton(
                  title: '3',
                  onTapped: () {
                    addAmount('3');
                  },
                ),
                ShaInputButton(
                  title: '4',
                  onTapped: () {
                    addAmount('4');
                  },
                ),
                ShaInputButton(
                  title: '5',
                  onTapped: () {
                    addAmount('5');
                  },
                ),
                ShaInputButton(
                  title: '6',
                  onTapped: () {
                    addAmount('6');
                  },
                ),
                ShaInputButton(
                  title: '7',
                  onTapped: () {
                    addAmount('7');
                  },
                ),
                ShaInputButton(
                  title: '8',
                  onTapped: () {
                    addAmount('8');
                  },
                ),
                ShaInputButton(
                  title: '9',
                  onTapped: () {
                    addAmount('9');
                  },
                ),
                const SizedBox(
                  width: 60,
                  height: 60,
                ),
                ShaInputButton(
                  title: '0',
                  onTapped: () {
                    addAmount('0');
                  },
                ),
                GestureDetector(
                  onTap: () {
                    deleteAmount();
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
          ),
          const SizedBox(height: 50),
          ShaButton(
            text: 'Checkout Now',
            onPressed: () async {
              if (await Navigator.pushNamed(context, pinRoute) == true) {
                await launchUrl(Uri.parse('https://demo.midtrans.com'));
                Navigator.pushNamedAndRemoveUntil(
                  // ignore: use_build_context_synchronously
                  context,
                  topUpSuccessRoute,
                  (route) => false,
                );
              }
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 25, bottom: 40),
            child: ShaTextButton(
              text: 'Terms & Conditions',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
