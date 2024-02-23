import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    //Textfield a yazılan patterni onChange kısmında çağırarak global state i değiştirdim
    Function search = Provider.of<StateData>(context).searchData;
    return Padding(
      padding: paddingAllMedium,
      child: Container(
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
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: LessonConstants.searchIcon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.background,
            contentPadding: paddingAllBig,
          ),
          onChanged: (value) {
            // arama sorgusu ile ilgili işlemler
            search(value);
          },
        ),
      ),
    );
  }
}
