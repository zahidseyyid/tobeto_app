import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/background.png"), fit: BoxFit.fill),
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
                      child: Image.asset(
                        "lib/assets/tobeto.png",
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
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Kullanıcı Kodu',
                        ),
                      ),
                    ),
                    Container(
                      //padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Parola',
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
                        child: const Text('Giriş Yap'),
                        onPressed: () {
                          // ...
                        },
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 30,
                      thickness: 1,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: TextButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        child: const Text(
                          'Parolamı Unuttum',
                          style: TextStyle(color: Colors.blue),
                        ),
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
