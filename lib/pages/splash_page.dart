// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/logic/blocs/auth_bloc/auth_state.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/widgets/custom_circular_progress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    final logoAsset = getLogo(brightness);
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial || state is AuthLoading) {
          print("AuthInitial : SplashWidgetPage");
        } else if (state is AuthError) {
          print("AuthError : SplashWidgetPage");
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is Unauthenticated) {
          print("Unauthenticated : SplashWidgetPage");
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is Authenticated) {
          print("Authenticated : SplashWidgetPage");
          Navigator.pushReplacementNamed(context, "/home");
        } else {
          print("else : SplashWidgetPage");
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logoAsset,
                width: deviceWidth / 1.80,
              ),
              SizedBox(height: deviceHeight / 5),
              const CustomCircularProgress()
            ],
          ),
        ),
      ),
    );
  }
}
