import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ShaInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool isShowTitle;
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final Function(String)? onFieldSubmitted;
  const ShaInput({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
    this.obscureText = false,
    this.isShowTitle = true,
    this.keyboardType = TextInputType.text,
    this.keyboardAction = TextInputAction.next,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              labelText,
              style: blackTextStyle.copyWith(fontWeight: medium),
            ),
          ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          cursorColor: kBlackColor,
          keyboardType: keyboardType,
          textInputAction: keyboardAction,
          style: blackTextStyle.copyWith(fontWeight: medium),
          decoration: InputDecoration(
            hintText: (!isShowTitle) ? labelText : null,
            hintStyle: greyTextStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: kUnfocusInputColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: kUnfocusInputColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: kFocusInputColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: kRedColor,
              ),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
          onFieldSubmitted: onFieldSubmitted,
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}
