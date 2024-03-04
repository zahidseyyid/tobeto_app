import 'package:flutter/material.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_bloc.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_state.dart';
import 'package:tobeto_app/constants/constant_image.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_circular_progress.dart';
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
        } else if (state is AuthError) {
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, "/home");
        } else {}
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
