import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_text_formfield_profile.dart';

class SocialMediaEdit extends StatefulWidget {
  const SocialMediaEdit({super.key});

  @override
  State<SocialMediaEdit> createState() => _SocialMediaEditState();
}

class _SocialMediaEditState extends State<SocialMediaEdit> {
  EdgeInsets horizontalF = const EdgeInsets.symmetric(horizontal: 10.0);
  TextEditingController socialMediaController = TextEditingController();

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
        padding: horizontalF,
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
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(padding: paddingMedium),
            buildUserInfoFormField(
                labelText: "Sosyal Medya*",
                controller: socialMediaController,
                hintText: "Sosyal Medya Giriniz"),
            Padding(padding: paddingMedium),
            CustomElevatedButton(text: "Kaydet", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
