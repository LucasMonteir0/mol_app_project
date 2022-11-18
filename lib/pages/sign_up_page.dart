import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mol_app/objects/auth_icons_row_widget.dart';
import 'package:mol_app/objects/primary_button_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../objects/help_button_widget.dart';
import '../objects/sign_up_text_field_widget.dart';
import '../resources/images.dart';
import '../resources/strings.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final passwordConfirmFocusNode = FocusNode();
  final nameFocusNode = FocusNode();

  bool obscurePass = true;
  bool obscureConfirmPass = true;

  final emailRegex = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  final phoneMask =
      MaskTextInputFormatter(mask: '+## (##) #####-####', filter: {
    '#': RegExp(r"[0-9]"),
  });

  void showSignUpDialog(BuildContext context) {
    showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(Strings.appName),
            content: const Text('Deseja efetuar o cadastro?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(Strings.no)),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(Strings.yes))
            ],
          );
        }).then((confirmedSignUp) {
      if (confirmedSignUp != null && confirmedSignUp) {
        Form.of(context)?.reset();
        passwordConfirmController.clear();
        passwordController.clear();
        nameFocusNode.requestFocus();

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuário cadastrado com sucesso!')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Form(
        child: Scaffold(
          body: ListView(
            children: [
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        )),
                    Column(
                      children: [
                        SizedBox(
                          width: 175.0,
                          child: Image.asset(Images.logo),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              bottom: 60.0,
                              top: 15,
                            ),
                            child: Text(Strings.signUpNow,
                                style: theme.textTheme.headline2)),
                        SignUpTextField(
                          fieldName: Strings.name,
                          child: TextFormField(
                            autofocus: true,
                            focusNode: nameFocusNode,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                              FilteringTextInputFormatter.allow(RegExp(
                                  r'[^0-9\.\,\"\?\!\;\:\#\$\%\&\(\)\*\+\-\/\<\>\=\@\[\]\\\^\_\{\}\|\~]+'))
                            ],
                            textCapitalization: TextCapitalization.words,
                            decoration:
                                buildInputDecoration(Strings.hintSignUpName),
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: nameValidator,
                          ),
                        ),
                        SignUpTextField(
                          fieldName: Strings.email,
                          child: TextFormField(
                            decoration:
                                buildInputDecoration(Strings.hintSignUpEmail),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: emailValidator,
                          ),
                        ),
                        SignUpTextField(
                          fieldName: Strings.phone,
                          child: TextFormField(
                            decoration:
                                buildInputDecoration(Strings.hintSignUpPhone),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [phoneMask],
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: phoneValidator,
                          ),
                        ),
                        SignUpTextField(
                          fieldName: Strings.password,
                          child: TextFormField(
                            focusNode: passwordFocusNode,
                            controller: passwordController,
                            obscureText: obscurePass,
                            decoration:
                                buildInputDecoration(Strings.hintSignUpPassword)
                                    .copyWith(
                                        // helperText: Strings.passwordHelper,
                                        suffixIcon: ExcludeFocus(
                              child: IconButton(
                                  onPressed: () => setState(() {
                                        obscurePass = !obscurePass;
                                        passwordFocusNode.requestFocus();
                                      }),
                                  icon: Icon(obscurePass
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                            )),
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(16)
                            ],
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: passwordValidator,
                          ),
                        ),
                        SignUpTextField(
                          fieldName: Strings.passwordConfirm,
                          child: TextFormField(
                            focusNode: passwordConfirmFocusNode,
                            controller: passwordConfirmController,
                            obscureText: obscureConfirmPass,
                            decoration: buildInputDecoration(
                                    Strings.hintSignUpPasswordConfirm)
                                .copyWith(
                                    suffixIcon: ExcludeFocus(
                              child: IconButton(
                                  onPressed: () => setState(() {
                                        obscureConfirmPass =
                                            !obscureConfirmPass;
                                        passwordConfirmFocusNode.requestFocus();
                                      }),
                                  icon: Icon(obscureConfirmPass
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                            )),
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: passwordConfirmValidator,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 26.0),
                          child: Builder(builder: (context) {
                            return PrimaryButtonWidget(
                              text: Strings.signUp2,
                              onPressedButton: () {
                                final formState = Form.of(context);
                                if (formState != null && formState.validate()) {
                                  showSignUpDialog(context);
                                }
                              },
                            );
                          }),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 40.0, bottom: 27),
                          child: AuthIconsRow(),
                        ),
                        HelpButtonWidget(
                          onPressedButton: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? phoneValidator(phone) {
    final emptyError = emptyValidator(phone);
    if (emptyError == null && phone != null) {
      final phoneDigits = phoneMask.unmaskText(phone);
      if (phoneDigits.length < 13) {
        return Strings.errorMessageInvalidPhone;
      }
    }
    return emptyError;
  }

  String? passwordConfirmValidator(passwordConfirm) {
    final emptyError = emptyValidator(passwordConfirm);
    if (emptyError == null && passwordConfirm != null) {
      if (passwordConfirmController.text != passwordController.text) {
        return Strings.errorMessagePasswordConfirm;
      }
    }
    return emptyError;
  }

  @override
  void dispose() {
    passwordConfirmController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    passwordConfirmFocusNode.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  String? passwordValidator(password) {
    final emptyError = emptyValidator(password);

    if (emptyError == null && password != null) {
      if (password.length < 8) {
        return Strings.erroeMessageInvalidPassword;
      }
    }
    return emptyError;
  }

  String? nameValidator(name) {
    final emptyError = emptyValidator(name);

    if (emptyError == null && name != null) {
      if (name.split(' ').length == 1) {
        return Strings.errorMessageInvalidName;
      }
    }
    return emptyError;
  }

  String? emailValidator(email) {
    final emptyError = emptyValidator(email);

    if (emptyError == null && email != null) {
      if (!emailRegex.hasMatch(email)) {
        return Strings.errorMessageInvalidEmail;
      }
    }
    return emptyError;
  }

  String? emptyValidator(String? text) {
    if (text == null || text.isEmpty) {
      return Strings.errorMessageEmptyField;
    }
    return null;
  }

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      hintStyle: const TextStyle(fontSize: 12),
      hintText: hintText,
      contentPadding: const EdgeInsets.only(left: 19),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFEB6530), width: 1.0),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFEB6530), width: 1.0),
          borderRadius: BorderRadius.circular(10)),

      // Não mudam nada.
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFEB6530), width: 1.0),
          borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade800, width: 1.0),
          borderRadius: BorderRadius.circular(10)),
      // disabledBorder: OutlineInputBorder(
      //     borderSide: BorderSide(color: Colors.red.shade800, width: 1.0),
      //     borderRadius: BorderRadius.circular(10)),
    );
  }
}
