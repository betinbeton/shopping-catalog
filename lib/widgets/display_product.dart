import 'dart:math' as math;
import 'package:berry_catalog/services/services.dart';
import 'package:flutter/material.dart';

import 'package:berry_catalog/theme/app_theme.dart';
import 'package:provider/provider.dart';

class DisplayProduct extends StatelessWidget {
  final String imgPath;
  final String titleProduct;
  final String price;
  final String id;
  final int? index;
  final Function()? onTap;

  const DisplayProduct({
    Key? key,
    required this.imgPath,
    required this.titleProduct,
    required this.price,
    required this.id,
    this.index,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final earringProvider = Provider.of<EarringsServices>(context);
    // final imageService = Provider.of<ImageService>(context);
    return earringProvider.isLoading
        ? Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: Apptheme.colorbackground,
                child: Image.asset(
                  'images/loading2.gif',
                ),
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(top: 2),
            child: InkWell(
              onTap: onTap,
              child: Ink(
                child: _CardBackground(
                  height: 120,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        //*Img
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                          child: Container(
                            width: 150,
                           // height:110,
                           // color: Colors.white,
                            //TODO poner FaseInImage para loading ver video 96
                            child: FadeInImage(
                              placeholder: AssetImage('images/loading2.gif'),
                              image: NetworkImage(imgPath),
                              //image: AssetImage('images/59.JPG'),
                              fit: BoxFit.fill,
                              
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 25,
                        left: 180,
                        //*Title
                        child: Container(
                          child: Text(
                            this.titleProduct,
                            style: Apptheme.textBoldTitleStyle,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 45,
                        left: 180,
                        //*Price
                        child: Container(
                          child: Text(
                            '\$' + this.price,
                            style: Apptheme.textBoldMediumSubTitleStyle,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 95,
                        left: 180,
                        //*Buy Button
                        child: Container(
                          child: Text(
                            'ID:' + this.id,
                            style: Apptheme.textNormalStyle,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(10)),
                            color: Apptheme.colorbackground,
                          ),
                          child: Center(
                            child: Container(
                              height: double.infinity,
                              child: Image.asset(
                                'images/logoDorado.png',
                                fit: BoxFit.contain,
                                width: 25,
                                height: 25,
                              ),
                            ),

                            // ImageIcon(

                            //   AssetImage("images/Icono.png"),
                            //   size: 20,
                            //   color: Apptheme.colorSecondary,
                            // ),

                            // child: Text(
                            //   'Ver',
                            //   style: Apptheme.textBoldMediumSubTitleStyle,
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  final double height;

  const _CardBackground({Key? key, required this.child, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          //TODO tiene que ser un metodo para cambiar los colores
          // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.08),
          height: this.height,
          width: double.infinity,
          decoration: _cardBorders(),
          child: this.child,
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
      //*En caso de que queramos varios colores
      // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.08),

      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          // Colors.amber.withOpacity(0.8),
          // Colors.amber.withOpacity(0.6),
          // Colors.amber.withOpacity(0.5),
          Color(0xffFAF0BF).withOpacity(0.7),
          Color(0xffFAF0BF).withOpacity(0.1),
        ],
      ),
      // borderRadius: BorderRadius.circular(50),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black12.withOpacity(0.1),
      //     offset: Offset(0, 7),
      //     blurRadius: 10,
      //   )
      // ],
    );
