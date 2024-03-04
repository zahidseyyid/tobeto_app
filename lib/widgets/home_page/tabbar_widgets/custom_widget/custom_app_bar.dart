import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/logic/blocs/auth/auth_bloc.dart';
import 'package:flutter_application_1/logic/blocs/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    required this.brightness,
    this.leading,
  });

  final Brightness brightness;
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    String? userID;
    final authBlocState = context.watch<AuthBloc>().state;
    if (authBlocState is Authenticated) {
      userID = authBlocState.userId!;
    }
    return AppBar(
      leading: leading,
      title: Image.asset(getLogo(brightness), width: 125),
      actions: [
        if (userID != null)
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/discussion_list",
                  arguments: userID);
            },
            icon: const Icon(FontAwesomeIcons.message),
          ),
      ],
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
    );
  }
}
