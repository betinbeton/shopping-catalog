import 'dart:math' as math;
import 'package:berry_catalog/routes/routes.dart';
import 'package:berry_catalog/services/services.dart';
import 'package:flutter/material.dart';

import 'package:berry_catalog/theme/app_theme.dart';
import 'package:provider/provider.dart';

class DetailProductImg extends StatelessWidget {
  final String imgPath;

  const DetailProductImg({
    Key? key,
    required this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final earringProvider = Provider.of<EarringsServices>(context);
    return earringProvider.isLoading
        ? Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Apptheme.colorbackground,
                child: Image.asset('images/loading2.gif',fit: BoxFit.fill,),
              ),
            ),
          )
        : GestureDetector(
            onTap: ((() => Navigator.pushNamed(context, imgFullScreen, arguments: imgPath))),
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        // color: Colors.red,
                        height:double.infinity,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            fit: BoxFit.fill,
                            placeholder: const AssetImage('images/loading2.gif'),
                            image: NetworkImage(imgPath),
                            //image: AssetImage('images/59.JPG'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20)),
                          color: Apptheme.colorSecondary,
                        ),
                        child: const Center(
                          child: ImageIcon(
                            AssetImage("images/Icono.png"),
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
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
        borderRadius: BorderRadius.circular(20),
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
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.08),
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.01),
          offset: Offset(0, 7),
          blurRadius: 10,
        )
      ],
    );
