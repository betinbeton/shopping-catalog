import 'package:berry_catalog/theme/app_theme.dart';
import 'package:flutter/material.dart';


class AppBarLeadingBackButton extends StatelessWidget {
  final Function()? onTap;

  const AppBarLeadingBackButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 22),
        child: Container(
          margin: const EdgeInsets.all(2),
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            //color: Colors.blue,
            shape: BoxShape.circle,
            border: Border.all(
              color: Apptheme.colorbackground,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Apptheme.colorPrimary,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
