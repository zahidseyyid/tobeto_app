import 'package:flutter/material.dart';

//Eğitimlerim sayfası kuruma göre arama

class DropdownCorporationWidget extends StatefulWidget {
  const DropdownCorporationWidget({super.key});

  @override
  State<DropdownCorporationWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownCorporationWidget> {
  bool _isDropdownOpen = false;
  final TextEditingController _textEditingController = TextEditingController();

  void _toggleDropdownVisibility() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  void _selectDropdownItem(String selectedItem) {
    setState(() {
      _textEditingController.text = selectedItem;
      _isDropdownOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 15,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  controller: _textEditingController,
                  textAlignVertical: TextAlignVertical.center,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Kurum Seçiniz",
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.background,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                  onTap: () {
                    _toggleDropdownVisibility();
                  },
                  onChanged: (value) {
                    // arama sorgusu ile ilgili işlemler
                    print('Arama: $value');
                  },
                ),
                Positioned(
                  right: 35,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _textEditingController.clear();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.close,
                            size: 25,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Text(
                        "I",
                        textScaleFactor: 3,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w100),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_isDropdownOpen)
            Container(
              margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
              height: 50, // Dropdown listesinin yüksekliği
              decoration: BoxDecoration(
                color: const Color.fromARGB(204, 188, 213, 239),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 15,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                title: const Text("İstanbul Kodluyor"),
                onTap: () {
                  _selectDropdownItem("İstanbul Kodluyor");
                },
              ),
            ),
        ],
      ),
    );
  }
}
