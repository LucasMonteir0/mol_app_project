import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    Key? key,
    required this.text,
    required this.onPressedButton,
    this.width,
    this.height,

    // this.backgroundColor,
  }) : super(key: key);

  final String text;
  final double? width;
  final double? height;
  // Color? backgroundColor;

  final VoidCallback onPressedButton;

  // backgroundColorFunc(value) {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 325.0,
        height: height ?? 46.0,
        child: ElevatedButton(
          onPressed: () {
            onPressedButton();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEB6530),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ));
  }
}
