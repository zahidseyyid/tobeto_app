import 'package:flutter/material.dart';
// UserProfile userProfile2 = UserProfile(idNo: "", nameSurname: "", email: "");

class HeaderWidget extends StatefulWidget {
  final String name;
  const HeaderWidget({super.key, required this.name});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

// Future<String> mainmain() async {
//   String uid = "ZzcuO4ud6U6BtxHrYhRy";
//   UserRepository userRepository = UserRepository();
//   UserProfile userProfile = await userRepository.fetchUser(uid);
//   userProfile2 = userProfile;
//   return userProfile.nameSurname;
// }

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    //mainmain();
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
                    text: "'ya hoş geldin\n",
                    style: TextStyle(
                      fontSize: 24,
                    )),
                TextSpan(
                    text: widget.name,
                    // userProfile2.nameSurname +
                    // userProfile2.educationHistory![0].department +
                    // userProfile2.socialMedia![1].username +
                    // userProfile2.idNo +
                    // userProfile2.phone!,
                    style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
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
