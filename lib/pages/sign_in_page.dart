import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_bloc.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_event.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_state.dart';
import 'package:tobeto_app/logic/blocs/user/user_bloc.dart';
import 'package:tobeto_app/logic/blocs/user/user_event.dart';
import 'package:tobeto_app/constants/constant_image.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/utils/error_toast.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_circular_progress.dart';
import 'package:tobeto_app/widgets/sign_in_sign_up_page/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SignInPage> {
  late String logoAsset;

  TextEditingController eMailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    eMailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    logoAsset = getLogo(brightness);
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ToastHelper.showErrorToast(state.errorMessage);
        } else if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, "/home");
        } else if (state is AuthLoading) {
          const CustomCircularProgress();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(PageImageConstants.backgorundImage),
                fit: BoxFit.fill),
          ),
          child: Center(
            child: Padding(
              padding: paddingAllSuperBig,
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
                        padding: paddingBig + paddingOnlyTopBig,
                        child: Image.asset(
                          logoAsset,
                          width: 200,
                        ),
                      ),
                      Container(
                          padding: paddingHSuperBig + paddingOnlyTopBig,
                          child: SignTextField(
                            isPassword: false,
                            controller: eMailController,
                            labelText: SigninPageConstants.eMailLabelText,
                            icon: SigninPageConstants.mailIcon,
                          )),
                      Container(
                        padding: paddingHSuperBig + paddingOnlyTopMedium,
                        child: SignTextField(
                          isPassword: true,
                          controller: passwordController,
                          labelText: SigninPageConstants.passwordLabelText,
                          icon: SigninPageConstants.lockIcon,
                        ),
                      ),
                      Container(
                        padding: paddingHSuperBig + paddingOnlyTopSuperBig,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .secondary, // Buton rengini tema rengi olarak ayarla
                              minimumSize: Size(screenWidth * 0.8,
                                  50), // Buton boyutunu ekran genişliğine göre ayarla
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          child: const Text(
                              SigninPageConstants.signInButtonText,
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            context.read<UserBloc>().add(UserDeleteEvent());
                            context.read<AuthBloc>().add(AuthSignIn(
                                eMail: eMailController.text,
                                password: passwordController.text));
                          },
                        ),
                      ),
                      Padding(padding: paddingSmall),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/sign_up");
                          },
                          child:
                              const Text(SigninPageConstants.signUpButtonText)),
                      const Divider(
                        color: Colors.grey,
                        height: 30,
                        thickness: 1,
                      ),
                      Container(
                        padding: paddingOnlyBottomSmall,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                if (eMailController.text.isNotEmpty) {
                                  context.read<AuthBloc>().add(
                                      AuthPasswordReset(
                                          eMail: eMailController.text));
                                  ToastHelper.showSuccesToast(
                                      SigninPageConstants.passwordReset);
                                } else {
                                  ToastHelper.showErrorToast(
                                      SigninPageConstants.enterYourEmail);
                                }
                              },
                              child: const Text(
                                SigninPageConstants.passwordRequestText,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
