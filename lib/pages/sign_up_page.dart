// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_event.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_state.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/utils/error_toast.dart';
import 'package:flutter_application_1/widgets/sign_in_sign_up_page/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SignUpPage> {
  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    nameSurnameController.dispose();
    super.dispose();
  }

  late String logoAsset;
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameSurnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    logoAsset = getLogo(brightness);
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          print("AuthError : SignUpPage");
          ToastHelper.showErrorToast(state.errorMessage);
        }
        if (state is Authenticated) {
          print("Authenticated : SignUpPage");
          Navigator.pushReplacementNamed(context, "/home");
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(PageImageConstants.backgorundImage),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Image.asset(
                            logoAsset,
                            width: 200,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 15),
                          child: SignTextField(
                            isPassword: false,
                            controller: nameSurnameController,
                            labelText: SignUpPageConstants.nameSurnameLabelText,
                            icon: SignUpPageConstants.personIcon,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 15),
                          child: SignTextField(
                            isPassword: false,
                            controller: mailController,
                            labelText: SignUpPageConstants.eMailLabelText,
                            icon: SignUpPageConstants.mailIcon,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 15),
                          child: SignTextField(
                            isPassword: true,
                            controller: passwordController,
                            labelText: SignUpPageConstants.passwordLabelText,
                            icon: SignUpPageConstants.lockIcon,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 15),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              minimumSize: Size(screenWidth * 0.8, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                                SignUpPageConstants.signUpButtonText,
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              context.read<UserBloc>().add(UserDeleteEvent());
                              context.read<AuthBloc>().add(AuthSignUp(
                                    eMail: mailController.text,
                                    password: passwordController.text,
                                    nameSurname: nameSurnameController.text,
                                  ));
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/sign_in");
                          },
                          child:
                              const Text(SignUpPageConstants.signInButtonText),
                        ),
                        Padding(padding: paddingMedium),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
