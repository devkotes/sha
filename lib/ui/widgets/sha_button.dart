import 'package:flutter/material.dart';
import 'package:sha/shared/theme.dart';

class ShaButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function() onPressed;
  final EdgeInsetsGeometry margin;
  const ShaButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: kPurpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
        child: Text(
          text,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}

class ShaInputButton extends StatelessWidget {
  final String title;
  final Function() onTapped;
  const ShaInputButton({
    super.key,
    required this.title,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: kBlackColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 22,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
