import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.styleTitleText,
    required this.styleSubTitleText,
    required this.headerTitlteText,
    required this.headerSubTitlteText,
    this.subTitle = true,
  }) : super(key: key);
  final TextStyle styleTitleText;
  final TextStyle styleSubTitleText;
  final String headerTitlteText;
  final String headerSubTitlteText;
  final bool? subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerTitlteText,
            style: styleTitleText, //  textBoldTitleStyle,
          ),
          // const SizedBox(height: 5),
          subTitle!
              ? Text(
                  headerSubTitlteText,
                  style: styleSubTitleText, //textMediumStyle
                )
              : Container(),
        ],
      ),
    );
  }
}
