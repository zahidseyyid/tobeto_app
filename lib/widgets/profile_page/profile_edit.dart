import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/profile_page/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/profile_page/custom_text_formfield_profile.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController idNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  EdgeInsets paddingFormField = const EdgeInsets.symmetric(vertical: 10.0);
  EdgeInsets horizontalF = const EdgeInsets.symmetric(horizontal: 10.0);

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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: paddingFormField,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: deviceWidth / 5.5,
                    backgroundImage:
                        const AssetImage("lib/assets/profile_background.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  Positioned(
                    top: deviceWidth / 4.5,
                    left: deviceWidth / 4.5,
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo_outlined,
                          size: deviceWidth / 10),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: paddingFormField,
            ),
            buildUserInfoFormField(
              labelText: "Adınız*",
              controller: nameController,
              hintText: "Adınızı giriniz",
            ),
            Padding(
              padding: paddingFormField,
            ),
            buildUserInfoFormField(
              labelText: "Soyadınız*",
              controller: surnameController,
              hintText: "Soyadınızı giriniz",
            ),
            Padding(
              padding: paddingFormField,
            ),
            buildUserInfoFormField(
              labelText: "Telefon Numaranız*",
              controller: phoneController,
              hintText: "Telefon numaranızı giriniz",
              keyboardType: TextInputType.phone,
            ),
            Padding(
              padding: paddingFormField,
            ),
            buildUserInfoFormField(
              labelText: "Doğum Tarihiniz*",
              controller: birthDateController,
              hintText: "Doğum tarihinizi giriniz(23/07/1996)",
              keyboardType: TextInputType.datetime,
            ),
            Padding(
              padding: paddingFormField,
            ),
            buildUserInfoFormField(
              labelText: "TC Kimlik Numaranız*",
              controller: idNoController,
              hintText: "TC kimlik numaranızı giriniz",
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: paddingFormField,
            ),
            buildUserInfoFormField(
              labelText: "E-posta Adresiniz*",
              controller: emailController,
              hintText: "E-posta adresinizi giriniz",
              keyboardType: TextInputType.emailAddress,
            ),
            Padding(
              padding: paddingFormField,
            ),
            buildUserInfoFormField(
              labelText: "Ülke*",
              controller: countryController,
              hintText: "Ülkenizi giriniz",
            ),
            Padding(
              padding: paddingFormField,
            ),
            buildUserInfoFormField(
              labelText: "Şehir*",
              controller: cityController,
              hintText: "Şehrinizi giriniz",
            ),
            Padding(
              padding: paddingFormField,
            ),
            buildUserInfoFormField(
              labelText: "İlçe*",
              controller: districtController,
              hintText: "İlçenizi giriniz",
            ),
            Padding(
              padding: paddingFormField,
            ),
            buildUserInfoFormField(
              labelText: "Adres*",
              controller: addressController,
              hintText: "Adresinizi giriniz",
              maxLines: 4,
            ),
            Padding(
              padding: paddingFormField,
            ),
            buildUserInfoFormField(
              labelText: "Hakkınızda*",
              controller: aboutController,
              hintText: "Hakkınızda bilgi giriniz",
              maxLines: 4,
            ),
            Padding(
              padding: paddingFormField,
            ),
            CustomElevatedButton(text: "Kaydet", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
