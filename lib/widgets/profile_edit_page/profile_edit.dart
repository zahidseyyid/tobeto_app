// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_circular_progress.dart';
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
  String profilePictureUrlString = "";

  Future<void> pickImage(String url) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        profilePictureUrl = File(pickedImage.path);
        uploadImage(url);
      });
    } else {
      if (kDebugMode) {
        print("Resim seçilmedi");
      }
    }
  }

  Future<void> uploadImage(String uid) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('profilePhoto/$uid/image.png');
      UploadTask uploadTask = ref.putFile(profilePictureUrl);
      await uploadTask;
      profilePictureUrlString = await ref.getDownloadURL();
      print('Image uploaded to Firebase Storage successfully.');
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
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

  Widget buildUserInfoFormField({
    required String labelText,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    int? maxLines,
  }) {
    return SizedBox(
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
    //final MediaQueryData mediaQueryData = MediaQuery.of(context);
    //final double deviceWidth = mediaQueryData.size.width;
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
                    radius: 80,
                    pickedImage: profilePictureUrl,
                    userPhotoUrl: userProfile.profilePictureUrl ?? "",
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    child: const Text(ProfileEditConstants.photoUpload,
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pickImage(userProfile.uid);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: ProfileEditConstants.nameSurname,
              controller: nameSurnameController,
              hintText: ProfileEditConstants.nameSurnameHint,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: ProfileEditConstants.phone,
              controller: phoneController,
              hintText: ProfileEditConstants.phoneHint,
              keyboardType: TextInputType.phone,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: ProfileEditConstants.birthDate,
              controller: birthDateController,
              hintText: ProfileEditConstants.birthDateHint,
              keyboardType: TextInputType.datetime,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: ProfileEditConstants.identityNumber,
              controller: idNoController,
              hintText: ProfileEditConstants.identityNumberHint,
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: ProfileEditConstants.email,
              controller: emailController,
              hintText: ProfileEditConstants.emailHint,
              keyboardType: TextInputType.emailAddress,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: ProfileEditConstants.country,
              controller: countryController,
              hintText: ProfileEditConstants.country,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: ProfileEditConstants.city,
              controller: cityController,
              hintText: ProfileEditConstants.cityHint,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: ProfileEditConstants.district,
              controller: districtController,
              hintText: ProfileEditConstants.districtHint,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: ProfileEditConstants.address,
              controller: addressController,
              hintText: ProfileEditConstants.addressHint,
              maxLines: 4,
            ),
            Padding(
              padding: paddingMedium,
            ),
            buildUserInfoFormField(
              labelText: ProfileEditConstants.aboutMe,
              controller: aboutController,
              hintText: ProfileEditConstants.aboutMeHint,
              maxLines: 4,
            ),
            Padding(
              padding: paddingMedium,
            ),
            CustomElevatedButton(
                text: ProfileEditConstants.saveButton,
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
                          profilePictureUrl: profilePictureUrlString == ""
                              ? userProfile.profilePictureUrl
                              : profilePictureUrlString,
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
