import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String retrievedData = "";
  Future<void> fetchData() async {
    try {
      // "users" koleksiyonundaki belirli bir belgeyi al
      DocumentSnapshot documentSnapshot = await _firestore
          .collection('users')
          .doc(firebaseAuthInstance.currentUser!.uid)
          .get();

      // Belge var mı kontrolü
      if (documentSnapshot.exists) {
        // Belge içindeki veriyi al
        Map<dynamic, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        String name = data['name'];
        String surname = data['surname'];
        // String email = data['email'];
        // int birthdate = data['birthdate'];

        // Alınan veriyi kullan
        setState(() {
          retrievedData = "$name $surname";
        });
      } else {
        setState(() {
          retrievedData = "Belge bulunamadı.";
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print("Firestore'dan veri çekerken hata oluştu: $e");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 10),
      height: 180,
      width: 350,
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center, // Yatayda ortalama ekleniyor
            text: TextSpan(
              text: "",
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                const TextSpan(
                    text: 'TOBETO',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.purple)),
                const TextSpan(
                    text: "'ya hoş geldin ",
                    style: TextStyle(
                      fontSize: 24,
                    )),
                TextSpan(
                    text: retrievedData, style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500), // Yatayda ortalama ekleniyor
            ),
          ),
        ],
      ),
    );
  }
}
