import 'package:flutter/material.dart';

import '../resources/colors.dart';

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
    this.standard = true,
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
  final bool standard;

  @override
  Widget build(BuildContext context) {
    final themeStyle = Theme.of(context).elevatedButtonTheme.style;
    return SizedBox(
        width: width ?? 325.0,
        height: height ?? 46.0,
        child: ElevatedButton(
          onPressed: onPressedButton,
          style: standard
              ? themeStyle
              : ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: MolColor.orange,
                  ),
                  backgroundColor: Colors.transparent,
                  foregroundColor: MolColor.orange,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1.0, color: MolColor.orange),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
          child: Text(
            text,
          ),
        ));
  }
}

// class FidelizaButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final bool isStroked;
//   final bool borderPrimaryColor;

//   const FidelizaButton(
//       {required this.text,
//       required this.onPressed,
//       this.isStroked = false,
//       Key? key,
//       this.borderPrimaryColor = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       onPressed: onPressed,
//       style: OutlinedButton.styleFrom(
//         side: isStroked
//             ? BorderSide(
//                 color: borderPrimaryColor
//                     ? const Color(0xFF1139F5)
//                     : const Color(0XFFffffff))
//             : null,
//         backgroundColor: isStroked ? null : const Color(0xFF1139F5),
//         shadowColor: isStroked ? const Color(0xFF1139F5) : null,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//         ),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//             color:
//                 isStroked ? const Color(0xFF1139F5) : const Color(0XFFffffff)),
//       ),
//     );
//   }
// }
