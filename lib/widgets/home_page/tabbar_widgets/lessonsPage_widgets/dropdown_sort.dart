import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

// (Dropdown) Derslerin adına ve tarihine göre sıralama

class DropdownSortWidget extends StatefulWidget {
  const DropdownSortWidget({super.key});

  @override
  State<DropdownSortWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownSortWidget> {
  String dropdownValue = "Adına göre (A-Z)";

  @override
  Widget build(BuildContext context) {
    List<String> dropdownSort = [
      "Adına göre (A-Z)",
      "Adına göre (Z-A)",
      "Tarihe göre (Y-E)",
      "Tarihe göre (E-Y)"
    ];
    Function sort = Provider.of<StateData>(context).sortData;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 15,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.background),
      child: Row(
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Row(
              children: [
                Text(
                  "I",
                  textScaleFactor: 2.5,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w100),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
              ],
            ),
            iconSize: 30,
            underline: Container(
              //altında çıkan çizgiyi engellemek için
              color: Colors.transparent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
              sort(newValue);
              // print(Provider.of<StateData>(context, listen: false).sort);
            },
            items: dropdownSort.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  margin: const EdgeInsets.only(left: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
