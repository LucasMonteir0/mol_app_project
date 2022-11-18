import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  const SignUpTextField({
    Key? key,
    required this.fieldName,
    required this.child,
    this.hintText,
    this.width,
    // this.height,
  }) : super(key: key);

  final String? fieldName;
  final String? hintText;
  final TextFormField child;
  final double? width;
  // final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 2.0,
              left: 10.0,
            ),
            child: Text(
              fieldName!,
              style: theme.textTheme.bodyText1,
            ),
          ),
          SizedBox(
            width: width ?? 325.0,
            // height: height ?? 46.0,
            child: child,
          ),
        ],
      ),
    );
  }
}
