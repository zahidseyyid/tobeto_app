import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/models/user_profile_model/education_history.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_text_formfield_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationEdit extends StatefulWidget {
  //TODO: Text ve iconlar constant olmalı
  const EducationEdit({super.key});

  @override
  State<EducationEdit> createState() => _EducationEditState();
}

class _EducationEditState extends State<EducationEdit> {
  void controlleClear() {
    educationStatusController.clear();
    schoolNameController.clear();
    departmentController.clear();
    startDateController.clear();
    endDateController.clear();
  }

  EdgeInsets horizontalF = const EdgeInsets.symmetric(horizontal: 10.0);
  TextEditingController educationStatusController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

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
    } else {
      userProfile = UserProfile(uid: "", nameSurname: "", email: "");
    }
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(padding: paddingMedium),
            buildUserInfoFormField(
                labelText: "Eğitim Durumu*",
                controller: educationStatusController,
                hintText: "Eğitim Durumu Giriniz"),
            Padding(padding: paddingMedium),
            buildUserInfoFormField(
                labelText: "Okul Adı*",
                controller: schoolNameController,
                hintText: "Okul Adı Giriniz"),
            Padding(padding: paddingMedium),
            buildUserInfoFormField(
                labelText: "Bölüm*",
                controller: departmentController,
                hintText: "Bölüm Giriniz"),
            Padding(padding: paddingMedium),
            buildUserInfoFormField(
                labelText: "Başlangıç Tarihi*",
                controller: startDateController,
                hintText: "Başlangıç Tarihi Giriniz"),
            Padding(padding: paddingMedium),
            buildUserInfoFormField(
                labelText: "Bitiş Tarihi*",
                controller: endDateController,
                hintText: "Bitiş Tarihi Giriniz"),
            Padding(padding: paddingMedium),
            CustomElevatedButton(
                text: "Kaydet",
                onPressed: () {
                  userProfile.educationHistory ??
                      (userProfile.educationHistory = []);
                  userProfile.educationHistory!.add(EducationHistory(
                    educationStatus: educationStatusController.text,
                    schoolName: schoolNameController.text,
                    department: departmentController.text,
                    startDate: startDateController.text,
                    endDate: endDateController.text,
                  ));
                  context.read<UserBloc>().add(UserUpdateEvent(
                        userId: userProfile.uid,
                        userProfile: userProfile,
                      ));
                  controlleClear();
                }),
          ],
        ),
      ),
    );
  }
}
