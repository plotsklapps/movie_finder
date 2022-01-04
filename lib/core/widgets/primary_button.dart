import 'package:flutter/material.dart';
import 'package:moviefinder/core/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.width = double.infinity})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.button,
            ),
          ],
        ),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              kBorderRadius / 2,
            ),
          ),
          fixedSize: Size(
            width,
            48.0,
          ),
        ),
      ),
    );
  }
}
