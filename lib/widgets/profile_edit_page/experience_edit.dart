import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/logic/blocs/user/user_bloc.dart';
import 'package:tobeto_app/logic/blocs/user/user_event.dart';
import 'package:tobeto_app/logic/blocs/user/user_state.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/models/user_profile_model/work_history.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_elevated_button.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_text_formfield_profile.dart';
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
            labelText: ExperienceConstants.company,
            controller: companyController,
            hintText: ExperienceConstants.companyHint,
          ),
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
            labelText: ExperienceConstants.position,
            controller: positionController,
            hintText: ExperienceConstants.positionHint,
          ),
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
            labelText: ExperienceConstants.sector,
            controller: sectorController,
            hintText: ExperienceConstants.sectorHint,
          ),
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
            labelText: ExperienceConstants.city,
            controller: companyCityController,
            hintText: ExperienceConstants.cityHint,
          ),
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
            labelText: ExperienceConstants.startDate,
            controller: startDateController,
            hintText: ExperienceConstants.startDateHint,
          ),
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
            labelText: ExperienceConstants.endDate,
            controller: endDateController,
            hintText: ExperienceConstants.endDateHint,
          ),
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
              labelText: ExperienceConstants.description,
              controller: descriptionController,
              hintText: ExperienceConstants.descriptionHint,
              maxLines: 5),
          Padding(padding: paddingMedium),
          CustomElevatedButton(
              text: ExperienceConstants.saveButton,
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
