import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_image.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

class VisibilityWidget extends StatefulWidget {
  const VisibilityWidget({super.key});

  @override
  State<VisibilityWidget> createState() => _VisibilityWidgetState();
}
//Okunanları gizle ve hepsini göster olarak çalışan gözlük iconu

class _VisibilityWidgetState extends State<VisibilityWidget> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    Function sort = Provider.of<StateData>(context).sortData;
    return InkWell(
      onTap: () => setState(() {
        _isVisible = !_isVisible;
        sort(_isVisible
            ? AnnouncementConstants.visible
            : AnnouncementConstants.invisible);
      }),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
            child: Image.asset(
              _isVisible
                  ? PageImageConstants.visibilityOn
                  : PageImageConstants.visibilityOff,
              scale: 25,
            ),
          ),
        ),
      ),
    );
  }
}
