import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:nishauri/src/features/auth/data/providers/auth_provider.dart';
import 'package:nishauri/src/features/auth/presentation/pages/ResetPasswordScreen.dart';
import 'package:nishauri/src/features/auth/presentation/pages/resetPasswordScreen.dart';
import 'package:nishauri/src/features/user/data/providers/user_provider.dart';
import 'package:nishauri/src/shared/display/LinkedRichText.dart';
import 'package:nishauri/src/shared/input/Button.dart';
import 'package:nishauri/src/shared/layouts/ResponsiveWidgetFormLayout.dart';
import 'package:nishauri/src/shared/styles/input_styles.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/helpers.dart';
import 'package:nishauri/src/utils/routes.dart';

class ResetPassword extends StatefulWidget {
  final String user_name;
  const ResetPassword({Key? key, required this.user_name}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hidePassword = true;
  bool _loading = false;

  void _toggleShowPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer(
        builder: (context, ref, child)
    {
      void handleSubmit() async {
        if (_formKey.currentState!.saveAndValidate()) {
          setState(() {
            _loading = true;
          });
          final passwordResetStateNotifier = ref.read(
              resetPasswordProvider.notifier);
          final authStateNotifier = ref.read(authStateProvider.notifier);

          // Form payload
          final payload = {
            "user_name": widget.user_name,
            "new_password": _formKey.currentState!.value['new_password'],
          };

          passwordResetStateNotifier.changePassword(payload).then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(value)),
            );
            context.goNamed(RouteNames.LOGIN_SCREEN);
          }).catchError((err) {
            handleResponseError(context, _formKey.currentState!.fields, err,
                authStateNotifier.logout);
          }).whenComplete(() {
            setState(() {
              _loading = false;
            });
          });
        }
      }

      return Scaffold(
        appBar: AppBar(
          title: const Text("Reset Password"),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.chevron_left),
          ),
        ),
        body: ResponsiveWidgetFormLayout(
          buildPageContent: (context, color) =>
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(Constants.SPACING * 2),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
                  ),
                  child: FormBuilder(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            const SizedBox(height: Constants.SPACING),
                            DecoratedBox(
                              decoration: const BoxDecoration(),
                              child: Image.asset(
                                "assets/images/reset_password.png",
                                // semanticsLabel: "Doctors",
                                fit: BoxFit.contain,
                                height: 150,
                              ),
                            ),
                            const SizedBox(height: Constants.SPACING),
                            const Text(
                              "Reset password",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: Constants.SPACING),
                            const SizedBox(height: Constants.SPACING),
                            FormBuilderTextField(
                              name: "new_password",
                              obscureText: _hidePassword,
                              decoration: inputDecoration(
                                  placeholder: "********",
                                  prefixIcon: Icons.lock,
                                  label: "Password",
                                  surfixIcon: _hidePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  onSurfixIconPressed: _toggleShowPassword),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.min(8),
                                FormBuilderValidators.minLength(8),
                              ]),
                            ),
                            const SizedBox(height: Constants.SPACING),
                            FormBuilderTextField(
                              obscureText: _hidePassword,
                              name: "confirm_password",
                              decoration: inputDecoration(
                                  placeholder: "********",
                                  prefixIcon: Icons.lock,
                                  label: "Confirm Password",
                                  surfixIcon: _hidePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  onSurfixIconPressed: _toggleShowPassword),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.min(8),
                                FormBuilderValidators.minLength(8),
                                    (value) =>
                                _formKey.currentState!.value["new_password"] !=
                                    value
                                    ? "Password didn't match"
                                    : null
                              ]),
                            ),
                            const SizedBox(height: Constants.SPACING),
                            Button(
                              title: "Reset Password",
                              onPress: handleSubmit,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
        ),
      );
    },
    );
  }
}
