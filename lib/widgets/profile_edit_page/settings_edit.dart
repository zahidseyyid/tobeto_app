import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_bloc.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_event.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_elevated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsEdit extends StatefulWidget {
  const SettingsEdit({super.key});

  @override
  State<SettingsEdit> createState() => _SettingsEditState();
}

class _SettingsEditState extends State<SettingsEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: [
          Padding(padding: paddingSmall),
          CustomElevatedButton(
              text: SettingsPageConstants.deleteAccount,
              onPressed: () {
                context.read<AuthBloc>().add(AuthDeleteUser());
              },
              buttonColor: Colors.red),
        ],
      )),
    );
  }
}
