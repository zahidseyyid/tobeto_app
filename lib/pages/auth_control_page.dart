import 'package:flutter/material.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_bloc.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_event.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_state.dart';
import 'package:tobeto_app/utils/error_toast.dart';
import 'package:tobeto_app/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthControlPage extends StatefulWidget {
  const AuthControlPage({super.key});

  @override
  State<AuthControlPage> createState() => _AuthControlPageState();
}

class _AuthControlPageState extends State<AuthControlPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          context.read<AuthBloc>().add(AuthAppStarted());
          return const SplashPage();
        } else if (state is AuthLoading) {
          return const SplashPage();
        } else if (state is AuthError) {
          ToastHelper.showErrorToast(state.errorMessage);
          return const SplashPage();
        } else if (state is Unauthenticated) {
          return const SplashPage();
        } else if (state is Authenticated) {
          return const SplashPage();
        } else {
          return Container();
        }
      },
    );
  }
}
