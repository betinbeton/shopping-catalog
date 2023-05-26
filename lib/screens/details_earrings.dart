import 'package:berry_catalog/models/models.dart';
import 'package:berry_catalog/services/services.dart';
import 'package:berry_catalog/utils/url_launcher.dart';

import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:berry_catalog/theme/app_theme.dart';
import 'package:berry_catalog/widgets/widgets.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DetailsEarringsScreen extends StatelessWidget {
  const DetailsEarringsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Earring data = ModalRoute.of(context)!.settings.arguments! as Earring;

    // final earring = earringProvider.earrings[int.parse(index)].earring;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Apptheme.colorbackground, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        centerTitle: true,
        leading: AppBarLeadingBackButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Apptheme.colorbackground,
        title: Image.asset(
          'images/LetrasLogo2.png',
          // fit: BoxFit.contain,
          height: 100,
          width: 150,
        ),
        elevation: 0,
        toolbarHeight: 40,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Column(
          children: [
            Container(
             // color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Swiper(
                itemCount: data.imgFireBase.length,
                itemBuilder: (_, index) {
                  // print(data.imgFireBase[index]);
                  // return DetailProductImg(imgPath: 'https://via.placeholder.com/500x300');
                  return DetailProductImg(imgPath: data.imgFireBase[index]);
                },
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Apptheme.colorPrimary,
                    activeColor: Apptheme.colorSecondary,
                    size: 7.0,
                    activeSize: 7.0,
                  ),
                ),
              
                itemWidth: MediaQuery.of(context).size.height * 0.9,
                layout: SwiperLayout.STACK,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              //  height: MediaQuery.of(context).size.height * 0.03,
              // color: Colors.red,
              alignment: Alignment.bottomLeft,
              child: Text(
                data.title,
                style: Apptheme.textBoldTitleStyleLarge,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              //color: Colors.pink,
              child: Text(
                data.descripcion,
                textAlign: TextAlign.justify,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: Apptheme.textDescriptionlStyle,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              // color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Precio',
                        style: Apptheme.textNormalStyle,
                      ),
                      Text(
                        '\$ ${data.price}',
                        style: Apptheme.textBoldTitleStyle,
                      ),
                    ],
                  ),
                  Container(
                    //color: Colors.red,
                    height: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // padding: EdgeInsets.all(0),

                          backgroundColor: Apptheme.colorPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          final contactsService = Provider.of<ContactingService>(context, listen: false);
                          sendWhatssApp(context, contactsService.contacts, data.title, data.id);
                        },
                        child: Row(
                          children: [
                            const Text('Comprar'),
                            const SizedBox(width: 10),
                            ImageIcon(
                              const AssetImage("images/whatsappBlack.png"),
                              size: 20,
                              color: Apptheme.colorSecondary,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
