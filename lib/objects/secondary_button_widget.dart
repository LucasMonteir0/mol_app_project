import 'package:flutter/material.dart';

class SecondaryButtonWidget extends StatelessWidget {
  const SecondaryButtonWidget({
    Key? key,
    required this.text,
    required this.onPressedButton,
    this.width,
    this.height,
  }) : super(key: key);

  final String text;
  final double? width;
  final double? height;

  final VoidCallback onPressedButton;
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
              side: const BorderSide(width: 1, color: Color(0xFFEB6530)),
              backgroundColor: const Color(0xFF202020),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Color(0xFFEB6530)),
          ),
        ));
  }
}
