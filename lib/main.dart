import 'package:flutter/material.dart';
import 'package:mol_app/pages/sign_up_page.dart';
import 'package:mol_app/resources/theme.dart';
import 'pages/login_page.dart';
import 'resources/strings.dart';

void main() {
  runApp(const MolApp());
}

class MolApp extends StatelessWidget {
  const MolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: MolTheme.theme,
      routes: {
        '/': (context) => const LoginPage(),
        '/second': (context) => const SignUpPage(),
      },
      // home: const LoginPage(),
    );
  }
}
