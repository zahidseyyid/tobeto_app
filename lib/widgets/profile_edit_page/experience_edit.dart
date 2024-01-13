import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_text_formfield_profile.dart';

class ExperienceEdit extends StatefulWidget {
  const ExperienceEdit({super.key});

  @override
  State<ExperienceEdit> createState() => _ExperienceEditState();
}

class _ExperienceEditState extends State<ExperienceEdit> {
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
          CustomElevatedButton(text: "Kaydet", onPressed: () {}),
        ],
      ),
    ));
  }
}
