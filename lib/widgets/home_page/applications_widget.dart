import 'package:flutter/material.dart';

class ApplicationsWidget extends StatelessWidget {
  const ApplicationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        //shadowColor: const Color.fromARGB(255, 12, 90, 14),
        elevation: 20,
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                border:
                    Border(left: BorderSide(color: Colors.green, width: 10)),
              ),
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("İstanbul Kodluyor",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Text("Bilgilendirme",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),

                      //Text("Kabul edildi"),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            border: Border.all(
                              width: 3,
                              color: Colors.green,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Kabul Edildi",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Color(0xFF076B34),
                        ),
                        Expanded(
                            child: Text(
                                "İstanbul Kodluyor Başvuru Formu onaylandı")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Color(0xFF076B34),
                        ),
                        Expanded(
                            child: Text(
                                "İstanbul Kodluyor Belge Yükleme Formu onaylandı.")),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
