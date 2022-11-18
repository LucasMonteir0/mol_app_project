import 'package:flutter/material.dart';

import '../resources/strings.dart';

class HelpButtonWidget extends StatelessWidget {
  const HelpButtonWidget({Key? key, required this.onPressedButton})
      : super(key: key);

  final VoidCallback onPressedButton;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressedButton();
        },
        child: const Text(
          Strings.help,
          style: TextStyle(fontSize: 12, color: Color(0xFFEB6530)),
        ));
  }
}
