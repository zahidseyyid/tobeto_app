import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

class DropdownSortWidget extends StatefulWidget {
  //TODO: Text ve iconlar constant olmalı
  const DropdownSortWidget(
      {super.key,
      required this.dropdownItems,
      this.hint,
      this.dropdownValue,
      this.size});
  final String? dropdownValue;
  final List<String> dropdownItems;
  final String? hint;
  final double? size;

  @override
  State<DropdownSortWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownSortWidget> {
  late String? dropdownValue;
  late List<String> dropdownItems;
  late String? hintText;
  late double? size;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.dropdownValue;
    dropdownItems = widget.dropdownItems;
    hintText = widget.hint ?? LessonConstants.choose;
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    size = widget.size ?? deviceWidth;

    Function sort = Provider.of<StateData>(context).sortData;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
            alignment: Alignment.center,
            hint: Text(
              hintText.toString(),
              textAlign: TextAlign.center,
            ),
            icon: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      dropdownValue = null;
                      sort("");
                    },
                    child: LessonConstants.closeIcon),
                const Text(
                  "I",
                  // ignore: deprecated_member_use
                  textScaleFactor: 2,
                  //textScaler: TextScaler.linear(2),
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w200),
                ),
                const Icon(
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
            },
            items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  width: size! * 0.72,
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
