import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/models/user_profile_model/work_history.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_text_formfield_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperienceEdit extends StatefulWidget {
  const ExperienceEdit({super.key});

  @override
  State<ExperienceEdit> createState() => _ExperienceEditState();
}

class _ExperienceEditState extends State<ExperienceEdit> {
  void controlleClear() {
    companyController.clear();
    positionController.clear();
    sectorController.clear();
    companyCityController.clear();
    startDateController.clear();
    endDateController.clear();
    descriptionController.clear();
  }

  EdgeInsets horizontalF = const EdgeInsets.symmetric(horizontal: 10.0);
  TextEditingController companyController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController sectorController = TextEditingController();
  TextEditingController companyCityController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
              labelText: "Kurum Adı*",
              controller: companyController,
              hintText: "Kurum Adı Giriniz"),
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
              labelText: "Pozisyon*",
              controller: positionController,
              hintText: "Pozisyon Giriniz"),
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
              labelText: "Sektör*",
              controller: sectorController,
              hintText: "Sektör Giriniz"),
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
              labelText: "Şehir*",
              controller: companyCityController,
              hintText: "Şehir Giriniz"),
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
          buildUserInfoFormField(
              labelText: "Açıklama*",
              controller: descriptionController,
              hintText: "Açıklama Giriniz",
              maxLines: 5),
          Padding(padding: paddingMedium),
          CustomElevatedButton(
              text: "Kaydet",
              onPressed: () {
                userProfile.workHistory ?? (userProfile.workHistory = []);
                userProfile.workHistory!.add(
                  WorkHistory(
                    company: companyController.text,
                    position: positionController.text,
                    sector: sectorController.text,
                    city: companyCityController.text,
                    startDate: startDateController.text,
                    endDate: endDateController.text,
                    description: descriptionController.text,
                  ),
                );
                context.read<UserBloc>().add(UserUpdateEvent(
                    userProfile: userProfile, userId: userProfile.uid));
                controlleClear();
              }),
        ],
      ),
    ));
  }
}
