import 'package:flutter/material.dart';

import '../resources/images.dart';

class AuthIconsRow extends StatelessWidget {
  const AuthIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: 40,
        height: 40,
        child: Image.asset(Images.googleIcon),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: SizedBox(
          width: 40,
          height: 40,
          child: Image.asset(Images.facebookIcon),
        ),
      ),
      SizedBox(
        width: 40,
        height: 40,
        child: Image.asset(Images.twitterIcon),
      ),
    ]);
  }
}
