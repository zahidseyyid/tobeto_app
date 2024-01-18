import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/sign_in_page.dart';

final firebaseAuthInstance = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<LoginPage> {
  late String logoAsset;
  bool _isVisible = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> signInWithEmail(String email, password) async {
    try {
      await firebaseAuthInstance.signInWithEmailAndPassword(
          email: email, password: password);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));

      if (kDebugMode) {
        print(firebaseAuthInstance.currentUser!.uid);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    logoAsset = getLogo(brightness);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgorundImage), fit: BoxFit.fill),
        ),
        child: Center(
          // İçeriği ortalamak için Center ekliyoruz
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Column'un boyutunu içeriğe göre ayarlar
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Dikey olarak ortalar

                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset(
                        logoAsset,
                        width: 200,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Kullanıcı Kodu',
                        ),
                      ),
                    ),
                    Container(
                      //padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: TextField(
                        obscureText: _isVisible,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          prefixIcon: const Icon(Icons.lock),
                          labelText: 'Parola',
                          suffixIcon: IconButton(
                            icon: Icon(_isVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () => setState(() {
                              _isVisible = !_isVisible;
                            }),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .secondary, // Buton rengini tema rengi olarak ayarla
                            minimumSize: Size(screenWidth * 0.8,
                                50), // Buton boyutunu ekran genişliğine göre ayarla
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        child: const Text('Giriş Yap',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          signInWithEmail(
                              nameController.text, passwordController.text);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()));
                        },
                        child: const Text("Kayıt Ol")),
                    const Divider(
                      color: Colors.grey,
                      height: 30,
                      thickness: 1,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              if (kDebugMode) {
                                print(firebaseAuthInstance.currentUser!.uid);
                              }
                            },
                            child: const Text(
                              'Parolamı Unuttum',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
