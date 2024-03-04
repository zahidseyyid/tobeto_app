import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/logic/blocs/user/user_bloc.dart';
import 'package:tobeto_app/logic/blocs/user/user_event.dart';
import 'package:tobeto_app/logic/blocs/user/user_state.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/models/user_profile_model/social_media_account.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_elevated_button.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_text_formfield_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialMediaEdit extends StatefulWidget {
  const SocialMediaEdit({super.key});

  @override
  State<SocialMediaEdit> createState() => _SocialMediaEditState();
}

class _SocialMediaEditState extends State<SocialMediaEdit> {
  TextEditingController socialMediaController = TextEditingController();
  String? value;

  void controlleClear() {
    socialMediaController.clear();
    value = null;
  }

  Widget buildUserInfoFormField({
    required String labelText,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    int? maxLines,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Padding(
        padding: paddingHMedium,
        child: CustomTextFormField(
          labelText: labelText,
          controller: controller,
          hintText: hintText,
          keyboardType: keyboardType,
          maxLines: maxLines,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserProfile? userProfile;
    final userBlocState = context.watch<UserBloc>().state;
    if (userBlocState is UserFetchedState) {
      userProfile = userBlocState.user!;
    }

    List<DropdownMenuItem<String>> dropdownItems = [
      const DropdownMenuItem(
          value: SocialMediaEditConstants.dropdownFacebook,
          child: Text(SocialMediaEditConstants.dropdownFacebook)),
      const DropdownMenuItem(
          value: SocialMediaEditConstants.dropdownTwitter,
          child: Text(SocialMediaEditConstants.dropdownTwitter)),
      const DropdownMenuItem(
          value: SocialMediaEditConstants.dropdownInstagram,
          child: Text(SocialMediaEditConstants.dropdownInstagram)),
    ];

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(padding: paddingMedium + paddingHMedium),
            Padding(
              padding: paddingHBig,
              child: DropdownButton(
                style: Theme.of(context).textTheme.bodyLarge,
                elevation: 1,
                value: value,
                items: dropdownItems,
                onChanged: (selectedValue) {
                  setState(() {
                    value = selectedValue;
                  });
                },
                hint: const Text(SocialMediaEditConstants.dropdownHint),
              ),
            ),
            Padding(padding: paddingMedium),
            buildUserInfoFormField(
              labelText: SocialMediaEditConstants.textfieldTitle,
              controller: socialMediaController,
              hintText: SocialMediaEditConstants.textfieldHint,
            ),
            Padding(padding: paddingMedium),
            CustomElevatedButton(
              text: SocialMediaEditConstants.saveButton,
              onPressed: () {
                if (value != null) {
                  userProfile?.socialMedia!.add(
                    SocialMedia(
                      platform: value!,
                      username: socialMediaController.text,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(SocialMediaEditConstants.error),
                    ),
                  );
                }
                context.read<UserBloc>().add(UserUpdateEvent(
                    userId: userProfile!.uid, userProfile: userProfile));
                controlleClear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
