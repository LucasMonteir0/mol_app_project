import 'package:flutter/material.dart';
import 'package:mol_app/objects/auth_icons_row_widget.dart';
import 'package:mol_app/objects/mol_elevated_button_widget.dart';
import 'package:mol_app/pages/sign_up_page.dart';

import '../objects/help_button_widget.dart';
import '../resources/images.dart';
import '../resources/strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Image.asset(Images.logo),
                Image.asset(Images.appName),
                const SizedBox(height: 85),
                MolElevatedButton(
                  text: Strings.login,
                  onPressedButton: () {},
                ),
                const SizedBox(height: 24),
                MolElevatedButton(
                  standard: false,
                  text: Strings.signUp,
                  onPressedButton: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 26.0),
                  child: Text(
                    Strings.orSignInWith,
                    style: theme.textTheme.bodyText1,
                  ),
                ),
                const AuthIconsRow(),
                const SizedBox(
                  height: 110,
                ),
                HelpButtonWidget(
                  onPressedButton: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
