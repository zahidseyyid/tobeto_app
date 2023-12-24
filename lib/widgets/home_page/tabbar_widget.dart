import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_page/applications_widget.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SizedBox(
              width: 200,
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
          DefaultTabController(
            length: 4,
            child: Column(
              children: [
                const TabBar(
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(),

                  //labelPadding: EdgeInsets.only(bottom: 10),
                  tabs: [
                    Tab(
                      text: "Başvurularım",
                    ),
                    Tab(
                      text: "Eğitimlerim",
                    ),
                    Tab(
                      text: "Duyuru ve Haberlerim",
                    ),
                    Tab(
                      text: "Anketlerim",
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: TabBarView(
                    children: [
                      // Başvurularım tabı
                      ListView(
                        children: [
                          // Başvurularım içeriği
                          ApplicationsWidget(),

                          // ...
                        ],
                      ),
                      // Eğitimlerim tabı
                      ListView(
                        children: [
                          // Eğitimlerim içeriği
                          Text('Eğitimlerim 1'),
                          Text('Eğitimlerim 2'),
                          // ...
                        ],
                      ),
                      // Duyuru ve Haberlerim tabı
                      ListView(
                        children: [
                          // Duyuru ve Haberlerim içeriği
                          Text('Duyuru ve Haberlerim 1'),
                          Text('Duyuru ve Haberlerim 2'),
                          // ...
                        ],
                      ),
                      // Anketlerim tabı
                      ListView(
                        children: [
                          // Anketlerim içeriği
                          Text('Anketlerim 1'),
                          Text('Anketlerim 2'),
                          // ...
                        ],
                      ),
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
