import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/models/user_profile_model/social_media_account.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_text_formfield_profile.dart';
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
      const DropdownMenuItem(value: "Facebook", child: Text("Facebook")),
      const DropdownMenuItem(value: "Twitter", child: Text("Twitter")),
      const DropdownMenuItem(value: "Instagram", child: Text("Instagram")),
      const DropdownMenuItem(value: "LinkedIn", child: Text("LinkedIn")),
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
                hint: const Text("Sosyal Medya Türü "),
              ),
            ),
            Padding(padding: paddingMedium),
            buildUserInfoFormField(
              labelText: "Sosyal Medya*",
              controller: socialMediaController,
              hintText: "Sosyal Medya Giriniz",
            ),
            Padding(padding: paddingMedium),
            CustomElevatedButton(
              text: "Kaydet",
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
                      content: Text("Lütfen sosyal medya türü seçiniz."),
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
