// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_event.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_state.dart';
import 'package:flutter_application_1/utils/error_toast.dart';
import 'package:flutter_application_1/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthControlPage extends StatefulWidget {
  const AuthControlPage({super.key});

  @override
  State<AuthControlPage> createState() => _AuthControlPageState();
}

class _AuthControlPageState extends State<AuthControlPage> {
  late String logoAsset;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          print("AuthInitial : SplashPage");
          context.read<AuthBloc>().add(AuthAppStarted());
          return const SplashPage();
        } else if (state is AuthLoading) {
          print("AuthLoading : SplashPage");
          return const SplashPage();
        } else if (state is AuthError) {
          print("AuthError : SplashPage");
          ToastHelper.showErrorToast(state.errorMessage);
          return const SplashPage();
        } else if (state is Unauthenticated) {
          print("Unauthenticated : SplashPage");
          return const SplashPage();
        } else if (state is Authenticated) {
          print("Authenticated : SplashPage");
          return const SplashPage();
        } else {
          print("else : SplashPage");
          return Container();
        }
      },
    );
  }
}
