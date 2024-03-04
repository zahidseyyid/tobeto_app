import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/logic/blocs/catalog/catalog_bloc.dart';
import 'package:flutter_application_1/logic/blocs/catalog/catalog_event.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/dropdown_sort.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

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
              contentPadding: paddingSmall,
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
                            CatalogConstants.filter,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: LessonConstants.closeIcon,
                          onPressed: () {
                            Navigator.of(context).pop(); // Popup'ı kapat
                          },
                        ),
                      ],
                    ),
                    DropdownSortWidget(
                      dropdownItems: CatalogConstants.categoryItems,
                      size: dropdownSize,
                      hint: CatalogConstants.category,
                    ),
                    DropdownSortWidget(
                      dropdownItems: CatalogConstants.educationItems,
                      size: dropdownSize,
                      hint: CatalogConstants.education,
                    ),
                    DropdownSortWidget(
                      dropdownItems: CatalogConstants.levelItems,
                      size: dropdownSize,
                      hint: CatalogConstants.level,
                    ),
                    DropdownSortWidget(
                      dropdownItems: CatalogConstants.subjectItems,
                      size: dropdownSize,
                      hint: CatalogConstants.subject,
                    ),
                    DropdownSortWidget(
                      dropdownItems: CatalogConstants.softwareLangItems,
                      size: dropdownSize,
                      hint: CatalogConstants.softwareLanguage,
                    ),
                    DropdownSortWidget(
                      dropdownItems: CatalogConstants.teacherItems,
                      size: dropdownSize,
                      hint: CatalogConstants.teacher,
                    ),
                    DropdownSortWidget(
                      dropdownItems: CatalogConstants.situationItems,
                      size: dropdownSize,
                      hint: CatalogConstants.situation,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        onPressed: () {
                          if (sortData == "" ||
                              sortData == CatalogConstants.teacherItems[0] ||
                              sortData == CatalogConstants.educationItems[0] ||
                              sortData == CatalogConstants.levelItems[0] ||
                              sortData == CatalogConstants.subjectItems[0] ||
                              sortData ==
                                  CatalogConstants.softwareLangItems[0]) {
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
                        buttonText: CatalogConstants.filter,
                        buttonColor: Theme.of(context).colorScheme.secondary,
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
