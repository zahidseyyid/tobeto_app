import 'package:flutter/material.dart';

class ApplicationsWidget extends StatelessWidget {
  const ApplicationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
      //padding: const EdgeInsets.all(20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: deviceHeight * 0.18,
                width: deviceWidth * 0.9,
                decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(color: Color(0xFF076B34), width: 10)),
                ),
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                alignment: Alignment.centerLeft,
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("İstanbul Kodluyor",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text("Bilgilendirme",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Color(0xFF076B34),
                          ),
                          Expanded(
                            child: Text(
                                "İstanbul Kodluyor Başvuru Formu onaylandı"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Color(0xFF076B34),
                          ),
                          Expanded(
                            child: Text(
                                "İstanbul Kodluyor Belge Yükleme Formu onaylandı."),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: -0,
                child: Container(
                  height: deviceHeight * 0.03,
                  width: deviceWidth * 0.43,
                  decoration: const BoxDecoration(
                    color: Color(0xFF076B34),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Kabul Edildi",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
