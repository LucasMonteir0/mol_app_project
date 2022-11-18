import 'package:flutter/material.dart';

class MolElevatedButton extends StatelessWidget {
  const MolElevatedButton({
    Key? key,
    required this.text,
    required this.onPressedButton,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.fontSize,
    this.borderRadius,
  }) : super(key: key);

  final String text;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;

  final VoidCallback onPressedButton;

  BorderSide setBorder(Color? borderColor) {
    if (borderColor != null) {
      return BorderSide(width: 1.0, color: borderColor);
    } else {
      return BorderSide.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
        width: width ?? 325.0,
        height: height ?? 46.0,
        child: ElevatedButton(
          onPressed: () {
            onPressedButton();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? const Color(0xFFEB6530),
              shape: RoundedRectangleBorder(
                side: setBorder(borderColor),
                borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
              )),
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize ?? 20.0, color: textColor ?? Colors.white),
          ),
        ));
  }
}
