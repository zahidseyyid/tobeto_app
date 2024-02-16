import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/widgets/custom_circular_progress.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_circle_avatar.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_text_formfield_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  File profilePictureUrl = File("");

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        profilePictureUrl = File(pickedImage.path);
      });
    } else {
      if (kDebugMode) {
        print("Resim seçilmedi");
      }
    }
  }

  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController idNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
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
    UserProfile userProfile;
    final userBlocState = context.watch<UserBloc>().state;

    if (userBlocState is UserFetchedState) {
      userProfile = userBlocState.user!;
      nameSurnameController.text = userProfile.nameSurname;
      phoneController.text = userProfile.phone ?? "";
      birthDateController.text = userProfile.birthDate ?? "";
      idNoController.text = userProfile.idNo ?? "";
      emailController.text = userProfile.email;
      countryController.text = userProfile.country ?? "";
      cityController.text = userProfile.city ?? "";
      districtController.text = userProfile.district ?? "";
      addressController.text = userProfile.address ?? "";
      aboutController.text = userProfile.about ?? "";
    } else if (userBlocState is UserFetchLoadingState) {
      return const Center(child: CustomCircularProgress());
    } else {
      userProfile = UserProfile(uid: "", nameSurname: "", email: "");
    }
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: paddingMedium,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCircleAvatar(
                    pickedImage: profilePictureUrl,
                    userPhotoUrl: userProfile.profilePictureUrl ?? "",
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    child: const Text("Fotoğrafı Değiştir",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pickImage();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: "Adınız Soyadınız*",
              controller: nameSurnameController,
              hintText: "Adınızı ve Soyadınızı giriniz",
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: "Telefon Numaranız*",
              controller: phoneController,
              hintText: "Telefon numaranızı giriniz",
              keyboardType: TextInputType.phone,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: "Doğum Tarihiniz*",
              controller: birthDateController,
              hintText: "Doğum tarihinizi giriniz(23/07/1996)",
              keyboardType: TextInputType.datetime,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: "TC Kimlik Numaranız*",
              controller: idNoController,
              hintText: "TC kimlik numaranızı giriniz",
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: "E-posta Adresiniz*",
              controller: emailController,
              hintText: "E-posta adresinizi giriniz",
              keyboardType: TextInputType.emailAddress,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: "Ülke*",
              controller: countryController,
              hintText: "Ülkenizi giriniz",
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: "Şehir*",
              controller: cityController,
              hintText: "Şehrinizi giriniz",
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: "İlçe*",
              controller: districtController,
              hintText: "İlçenizi giriniz",
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: "Adres*",
              controller: addressController,
              hintText: "Adresinizi giriniz",
              maxLines: 4,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: "Hakkınızda*",
              controller: aboutController,
              hintText: "Hakkınızda bilgi giriniz",
              maxLines: 4,
            ),
            Padding(
              padding: paddingMedium,
            ),
            CustomElevatedButton(
                text: "Kaydet",
                onPressed: () {
                  context.read<UserBloc>().add(UserUpdateEvent(
                        userProfile: UserProfile(
                          uid: userProfile.uid,
                          idNo: idNoController.text,
                          nameSurname: nameSurnameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          birthDate: birthDateController.text,
                          country: countryController.text,
                          city: cityController.text,
                          district: districtController.text,
                          address: addressController.text,
                          about: aboutController.text,
                          profilePictureUrl: userProfile.profilePictureUrl,
                          educationHistory: userProfile.educationHistory,
                          workHistory: userProfile.workHistory,
                          socialMedia: userProfile.socialMedia,
                        ),
                        userId: userProfile.uid,
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
