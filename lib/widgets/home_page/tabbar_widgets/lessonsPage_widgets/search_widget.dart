import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

//Eğitimlerim sayfası Textfield'a yazılana göre arama

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //Textfield a yazılan patterni onChange kısmında çağırarak global state i değiştirdim
    Function search = Provider.of<StateData>(context).searchData;
    return Padding(
      padding: const EdgeInsets.all(10),
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
            hintText: 'Arama',
            suffixIcon: const Icon(
              Icons.search,
              size: 40,
              color: Colors.grey,
            ),
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
            contentPadding: const EdgeInsets.all(10.0),
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
