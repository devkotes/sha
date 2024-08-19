import 'package:flutter/material.dart';
import 'package:sha/shared/theme.dart';

class ShaTextButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function() onPressed;
  final EdgeInsetsGeometry margin;
  const ShaTextButton({
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
          backgroundColor: kTransparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
        child: Text(
          text,
          style: greySecondTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
