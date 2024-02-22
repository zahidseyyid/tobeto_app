import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/evaluation_page/gradientcard2_widget.dart';
import 'package:flutter_application_1/widgets/home_page/footer.dart';
import 'package:flutter_application_1/widgets/home_page/gradientcard_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';

class EvoluationPage extends StatelessWidget {
  // TODO: Constantslar eklenecek
  const EvoluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: CustomAppBarWidget(brightness: brightness),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Text(
                    "Yetkinliklerini ücretsiz ölç,",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "bilgilerini test et.",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                GradientCardWidget(
                  title: "Tobeto İşte Başarı Modeli",
                  subtitle:
                      "80 soru ile yetkinliklerini ölç,     önerilen eğitimleri tamamla,        rozetini kazan.",
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFe3a6fe),
                      Color(0xFF3c0b8c),
                    ],
                  ),
                  onPressed: () {},
                  cardHeight: size / 3,
                ),
                const SizedBox(height: 20),
                GradientCardWidget(
                  title: "Yazılımda Başarı Testi",
                  subtitle:
                      "Çoktan seçmeli sorular                                  ile teknik bilgini test et.",
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFbda6fe),
                      Color(0xFF1d0b8c),
                    ],
                  ),
                  onPressed: () {},
                  cardHeight: size / 3,
                  includeStartButton: false,
                  showArrowIcon: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                GradientCardWidget2(
                  buttonText: "Front End",
                  onPressed: () {},
                ),
                GradientCardWidget2(
                  buttonText: "Full Stack",
                  onPressed: () {},
                ),
                GradientCardWidget2(
                  buttonText: "Back End",
                  onPressed: () {},
                ),
                GradientCardWidget2(
                  buttonText: "Microsoft SQL Server",
                  onPressed: () {},
                ),
                GradientCardWidget2(
                  buttonText: "Masaüstü Programlama",
                  onPressed: () {},
                ),
                SizedBox(
                  height: size / 6.5,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: paddingHSuperBig,
                          child: const Text.rich(
                            //Tırnak işaretli yeşil kısım
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: "Aboneliğe özel ",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.purple,
                                  ),
                                ),
                                TextSpan(text: 'değerlendirme'),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          "araçları için",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GradientCardWidget(
                  title: "Kazanım Odaklı Testler",
                  subtitle:
                      "Dijital gelişim kategorisindeki eğitimlere başlamadan                öncekonuyla ilgili bilgin ölçülür ve               seviyene göre yönlendirilirsin.",
                  subtitle2: "",
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFad1deb),
                      Color(0xFF6e72fc),
                    ],
                  ),
                  onPressed: () {},
                  includeStartButton: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                GradientCardWidget(
                  title:
                      "Huawei Talent Interview                 Teknik Bilgi Sınavı*",
                  subtitle:
                      "Sertifika alabilmen için, eğitim yolculuğunun sonunda teknik yetkinliklerin ve kod bilgin ölçülür.\n4400+ soru | 30+ programlama dili, 4 zorluk seviyesi",
                  subtitle2:
                      "*Türkiye Ar-Ge Merkezi tarafından tasarlanmıştır.",
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFad1deb),
                      Color(0xFF6e72fc),
                    ],
                  ),
                  onPressed: () {},
                  includeStartButton: false,
                ),
                const FooterWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle evalutionTextStyle() {
    return const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.normal,
    );
  }
}
