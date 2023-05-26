import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:berry_catalog/models/models.dart';
import 'package:berry_catalog/services/services.dart';

import 'package:berry_catalog/theme/app_theme.dart';
import 'package:provider/provider.dart';

class BannerHeader extends StatelessWidget {
  const BannerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bannerProvider = Provider.of<BannerService>(context);
    // final bannersCount = bannerProvider.banners.length;

    return _CardBackground(
      height: 100,
      child: bannerProvider.isLoading
          ? Center(
              child: Container(color: Colors.white, child: Image.asset('images/loading2.gif')),
            )
          : Swiper(
              itemCount: bannerProvider.banners.length,
              itemBuilder: (_, int index) {
                final banner = bannerProvider.banners[index];
                // print(index);
                // print(banner.bannerName);
                return DisplayInfo(
                  title: banner.title,
                  subTitle: banner.subTitle,
                  duration: banner.duration,
                  imgPath: banner.imgPath,
                );
              },
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: Apptheme.colorPrimary,
                  activeColor: Apptheme.colorSecondary,
                  size: 7.0,
                  activeSize: 7.0,
                ),
              ),

              //control: SwiperControl(),
            ),
      // : Swiper(
      //     itemCount:3,
      //     // layout: SwiperLayout.STACK,
      //     itemBuilder: (_, index) {
      //       // final banner = bannerProvider.banners[index];
      //       return DisplayInfo(
      //         title: "banner.title",
      //         subTitle: "banner.subTitle",
      //         duration:" banner.duration",
      //         imgPath: "",
      //       );
      //     },
      //   ),
    );
  }
}

class DisplayInfo extends StatelessWidget {
  final String title;
  final String subTitle;
  final String duration;
  final String? imgPath;

  const DisplayInfo({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.duration,
     this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 25,
          left: 10,
          child: Container(
            child: Text(
              title,
              style: Apptheme.textBoldTitleStyle,
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 10,
          child: Container(
            child: Text(
              this.subTitle,
              style: Apptheme.textBoldMediumSubTitleStyle,
            ),
          ),
        ),
        Positioned(
          top: 65,
          left: 10,
          child: Container(
            child: Text(
              this.duration,
              style: Apptheme.textNormalStyle,
            ),
          ),
        ),
      imgPath != '' ?  Positioned(
          top: 5,
          right: 20,
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 90,
                height: 90,
                color: Colors.white,
                child: Image.asset('images/59.JPG'),
              ) ,
            ),
          ),
        ) : Container(),
      ],
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  final double height;

  const _CardBackground({Key? key, required this.child, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bannerProvider = Provider.of<BannerService>(context);
    return Container(
      //margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          //TODO tiene que ser un metodo para cambiar los colores
          // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.08),
          //TODO paraar el provider
          decoration: _cardBorders(isLoading: bannerProvider.isLoading),
          height: this.height,
          width: double.infinity,
          child: this.child,
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders({required bool isLoading}) => BoxDecoration(

 gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.amber.withOpacity(0.1),
          Colors.amber.withOpacity(0.01),
          Colors.amber.withOpacity(0.4),
        ],
      ),
      color: isLoading ? Colors.white : Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.08),
      //borderRadius: BorderRadius.circular(25),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black12.withOpacity(0.01),
      //     offset: Offset(0, 7),
      //     blurRadius: 10,
      //   )
      // ],
    );
