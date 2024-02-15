import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/catalog/catalog_bloc.dart';
import 'package:flutter_application_1/api/blocs/catalog/catalog_event.dart';

import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/education_model.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/dropdown_sort.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

List<String> categoryItems = [
  "Tüm Eğitimler",
  "Ücretli Eğitimler",
  "Ücretsiz Eğitimler"
];
List<String> educationItems = [
  "Tüm Eğitimler",
  "Dijital Gelişim",
  "Profesyonel Gelişim"
];
List<String> levelItems = ["Tüm Seviyeler", "Başlangıç", "Orta", "İleri"];
List<String> subjectItems = [
  "Tüm Konular",
  "C#",
  "Çeşitlilik ve Kapsayıcılık",
  "Başarı ve Sonuç Odaklılık",
  "Takım Bilinci",
  "Etkili İletişim ve İlişki Yönetimi",
  "Karar Verme",
  "Profesyonellik"
];
List<String> softwareLangItems = [
  "Tüm Diller",
  "ASPNET",
  "Bootstrap",
  "SASS",
  "JavaScript",
  "JQuery",
  "SQL",
  "AJAX",
  "HTML",
  "CSS",
  "React",
  "Flutter"
];
List<String> teacherItems = [
  "Tüm Eğitmenler",
  "Veli Bahçeci",
  "Halit Enes Kalaycı",
  "Gürkan İlişen",
  "Engin Demiroğ",
  "Kader Yavuz"
];
List<String> situationItems = [
  "Tüm Eğitimler",
  "Alınan Tüm Eğitimler",
  "Henüz Başlanmamış Eğitimler",
  "Tamamlanan Eğitimler",
  "Devam Eden Eğitimler"
];

void catalogFilterWidget(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;
      double deviceWidth = screenSize.width;
      double deviceHeight = screenSize.height;
      double dropdownSize = deviceWidth / 1.55;
      String sortData;

      return ChangeNotifierProvider<StateData>(
        //Filtreleme işlemleri için ChangeNotifierProvider ile sarmalladım
        create: (context) => StateData(),
        child: Builder(
          builder: (context) {
            sortData = Provider.of<StateData>(context, listen: true).sort;
            return AlertDialog(
              contentPadding: const EdgeInsets.only(top: 10, bottom: 20),
              content: Container(
                padding: paddingHMedium,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            "Filtreleme",
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop(); // Popup'ı kapat
                          },
                        ),
                      ],
                    ),
                    DropdownSortWidget(
                      dropdownItems: categoryItems,
                      size: dropdownSize,
                      hint: "Kategori",
                    ),
                    DropdownSortWidget(
                      dropdownItems: educationItems,
                      size: dropdownSize,
                      hint: "Eğitim",
                    ),
                    DropdownSortWidget(
                      dropdownItems: levelItems,
                      size: dropdownSize,
                      hint: "Seviye",
                    ),
                    DropdownSortWidget(
                      dropdownItems: subjectItems,
                      size: dropdownSize,
                      hint: "Konu",
                    ),
                    DropdownSortWidget(
                      dropdownItems: softwareLangItems,
                      size: dropdownSize,
                      hint: "Yazılım Dili",
                    ),
                    DropdownSortWidget(
                      dropdownItems: teacherItems,
                      size: dropdownSize,
                      hint: "Eğitmen",
                    ),
                    DropdownSortWidget(
                      dropdownItems: situationItems,
                      size: dropdownSize,
                      hint: "Durum ",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        onPressed: () {
                          if (sortData == "" ||
                              sortData == "Tüm Eğitmenler" ||
                              sortData == "Tüm Eğitimler" ||
                              sortData == "Tüm Seviyeler" ||
                              sortData == "Tüm Konular" ||
                              sortData == "Tüm Diller") {
                            context
                                .read<CatalogLessonBloc>()
                                .add(FetchCategoryLessons());
                          } else {
                            context
                                .read<CatalogLessonBloc>()
                                .add(FilterCategoryLessons(teacher: sortData));
                          }
                          Navigator.of(context).pop();
                        },
                        buttonText: "Filtrele",
                        buttonColor: const Color(0xFF9933FF),
                        width: deviceWidth / 3,
                        height: deviceHeight / 22,
                        buttonTextColor:
                            Theme.of(context).colorScheme.background),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
