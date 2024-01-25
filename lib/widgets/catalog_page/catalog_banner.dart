import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/search_widget.dart';

class CatalogBanner extends StatelessWidget {
  const CatalogBanner({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    TextStyle textStyle = TextStyle(
      color: Theme.of(context).colorScheme.background,
      fontSize: 40,
      letterSpacing: 2,
      fontWeight: FontWeight.w900,
    );
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.grey
                .withOpacity(0.4), // Gri renk ile karıştırarak soluk yapma
            BlendMode.saturation,
          ),
          child: ClipRRect(
            child: Image.asset(
              edubanner,
              width: deviceWidth,
              height: deviceHeight / 3.5,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: deviceHeight / 25,
          left: 10,
          right: 10,
          child: Container(
            width: deviceWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Öğrenmeye",
                  style: textStyle,
                ),
                Text(
                  "başla !",
                  style: textStyle,
                ),
                Padding(padding: paddingSmall),
                const SearchWidget(hintText: "Eğitim Arayın..."),
              ],
            ),
          ),
        ),
      ],
    );
  }
}