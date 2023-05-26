import 'package:berry_catalog/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final bool selected;
  final Function()? onPressed;

  const FilterButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.selected,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 30,
      //  width:70,
      //color: Colors.red,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          //elevation: 0,
          // side: BorderSide(width: .2),
          //TODO cambiar el color dependiendo de la semeccion
          backgroundColor: this.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          this.text,
          
          //TODO cambie el color dependiendo de la seleccion
          style:selected ? Apptheme.textBoldMediumSubTitleStleColorSecondary : Apptheme.textBoldMediumSubTitleStyle, 
        ),
      ),
    );
  }
}
