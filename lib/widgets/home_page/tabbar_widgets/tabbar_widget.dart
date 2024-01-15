import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/announcements_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/applications_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessons_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/surveys_widget.dart';
import 'package:provider/provider.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    int unReadAnnouncement =
        Provider.of<StateData>(context, listen: true).unReadAnnouncement;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SizedBox(
              width: deviceWidth * 0.6,
              child: Image.asset("lib/assets/istanbulkodluyor.png"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Text.rich(
            //Tırnak işaretli yeşil kısım
            TextSpan(
              text: 'Aradığın ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              children: <InlineSpan>[
                TextSpan(
                  text: '"',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00D29B),
                  ),
                ),
                TextSpan(text: 'İş'),
                TextSpan(
                  text: '"',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00D29B),
                  ),
                ),
                TextSpan(text: ' burada!'),
              ],
            ),
          ),
          //Tabbar kod başlangıcı
          DefaultTabController(
            length: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabBar(
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  labelColor: Theme.of(context).colorScheme.primary,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.all(5),
                  tabAlignment: TabAlignment.start,
                  tabs: List.generate(4, (index) {
                    if (index == 0) {
                      return const Tab(text: "Başvurularım");
                    } else if (index == 1) {
                      return const Tab(text: "Eğitimlerim");
                    } else if (index == 2) {
                      if (unReadAnnouncement == 0) {
                        return const Tab(text: "Duyuru ve Haberlerim");
                      } else {
                        //kırmızı bildirim kısmı
                        return Badge(
                          label: Text(
                            unReadAnnouncement.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.red[400],
                          child: const Tab(text: "Duyuru ve Haberlerim"),
                        );
                      }
                    } else if (index == 3) {
                      return const Tab(text: "Anketlerim");
                    }
                    return const Tab(text: "");
                  }),
                ),
                SizedBox(
                  height: deviceHeight * 0.24,
                  child: TabBarView(
                    children: [
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          ApplicationsWidget(),
                          ApplicationsWidget(),
                        ],
                      ),
                      const LessonsWidget(),
                      const AnnouncementsWidget(),
                      const SurveysWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
