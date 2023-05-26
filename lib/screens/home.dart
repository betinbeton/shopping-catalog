import 'package:berry_catalog/global/global.dart';
import 'package:berry_catalog/routes/routes.dart';
import 'package:berry_catalog/screens/screen.dart';

import 'package:berry_catalog/services/services.dart';

import 'package:berry_catalog/widgets/display_product.dart';
import 'package:berry_catalog/widgets/widgets.dart';

import 'package:flutter/material.dart';

import 'package:berry_catalog/theme/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bannerProvider = Provider.of<BannerService>(context);
    final earringProvider = Provider.of<EarringsServices>(context);
    final necklacesProvider = Provider.of<NecklacesServices>(context);
    final braceletProvider = Provider.of<BraceletsServices>(context);
    final contactsService = Provider.of<ContactingService>(context);
    final imageService = Provider.of<ImageService>(context);

    if (bannerProvider.isLoading ||
        earringProvider.isLoading ||
        necklacesProvider.isLoading ||
        braceletProvider.isLoading ||
        contactsService.isLoading ||
        imageService.isLoading) {
      return const LoadingScreen();
    }
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Apptheme.colorbackground, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        centerTitle: true,
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
      body: const _HomeBody(),
      bottomNavigationBar: CustomBottomNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 3),
        child: FloatingActionButton(
          onPressed: () {
            //TODO dejar esto
            Navigator.pushReplacementNamed(context, homeScreen);
          },
          backgroundColor: Colors.black,
          tooltip: 'Home',
          child: Image.asset(
            "images/Icono.png",
            height: 60,
            width: 60,
          ),
        ),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bannerProvider = Provider.of<BannerService>(context);
    final imageService = Provider.of<ImageService>(context);
    final earringProvider = Provider.of<EarringsServices>(context);
    final necklacesProvider = Provider.of<NecklacesServices>(context);
    final braceletProvider = Provider.of<BraceletsServices>(context);
    // final contactsService = Provider.of<ContactingService>(context);

    // if (bannerProvider.isLoading || earringProvider.isLoading || necklacesProvider.isLoading || braceletProvider.isLoading || contactsService.isLoading) {
    //   return const LoadingScreen();
    // }

    return RefreshIndicator(
      color: Apptheme.colorSecondary,
      onRefresh: () async {
        //Load Banner
        // print('entro');
        bannerProvider.loadBanners();
        earringProvider.loadEarrings();
        necklacesProvider.loadNecklaces();
        braceletProvider.loadBracelets();
        imageService.loadImages();

        // await Future.delayed(Duration(seconds: 2));
      },
      child: SingleChildScrollView(
        // clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 20, top: 5, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(
                styleTitleText: Apptheme.textBoldTitleStyle,
                styleSubTitleText: Apptheme.textBoldTitleStyle,
                headerTitlteText: HomeText.headerTitle,
                headerSubTitlteText: HomeText.headerTitle2,
              ),
              const SizedBox(height: 10),
              const BannerHeader(),
              const SizedBox(height: 10),
              _Filtros(earringProvider: earringProvider, braceletProvider: braceletProvider, necklacesProvider: necklacesProvider),
              const SizedBox(height: 10),
              earringProvider.isLoading
                  ? const DisplayProduct(imgPath: '', titleProduct: '', price: '', id: '')
                  : Earings(earringProvider: earringProvider, imageProvider: imageService),
              braceletProvider.isLoading
                  ? const DisplayProduct(imgPath: '', titleProduct: '', price: '', id: '')
                  : Bracelets(braceletProvider: braceletProvider, imageProvider: imageService),
              necklacesProvider.isLoading
                  ? const DisplayProduct(imgPath: '', titleProduct: '', price: '', id: '')
                  : Necklaces(necklacesProvider: necklacesProvider, imageProvider: imageService),
            ],
          ),
        ),
      ),
    );
  }
}

class Earings extends StatelessWidget {
  const Earings({
    Key? key,
    required this.earringProvider,
    required this.imageProvider,
  }) : super(key: key);

  final EarringsServices earringProvider;
  final ImageService imageProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: earringProvider.showEarrings ? earringProvider.earrings.length : 0,
      itemBuilder: (_, int index) {
        // final imageService = Provider.of<ImageService>(context, listen: false);
        final earring = earringProvider.earrings[index].earring;
        String imgProductList;
        if (imageProvider.mapImgs.isNotEmpty) {
          //We check that we have an img
          final imgList = imageProvider.filterImage(earring.id);
          //passing the new list to the object
          earring.imgFireBase = imgList;
          imgProductList = imgList[0];
        } else {
          imgProductList = imageProvider.urlDefaultImg;
        }

        return Column(
          children: [
            DisplayProduct(
              imgPath: imgProductList,
              titleProduct: earring.title,
              price: earring.price,
              id: earring.id,
              index: index,
              onTap: ((() => Navigator.pushNamed(context, detailEarringsScreen, arguments: earring))),
            ),
          ],
        );
      },
    );
  }
}

class Bracelets extends StatelessWidget {
  const Bracelets({
    Key? key,
    required this.braceletProvider,
    required this.imageProvider,
  }) : super(key: key);

  final BraceletsServices braceletProvider;
  final ImageService imageProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: braceletProvider.showBracelets ? braceletProvider.bracelets.length : 0,
      itemBuilder: (_, int index) {
        final bracelet = braceletProvider.bracelets[index].bracelet;
     
        String imgProductList ;
      
        if (imageProvider.mapImgs.isNotEmpty) {
          //We check that we have an img
          final imgList = imageProvider.filterImage(bracelet.id);
          //passing the new list to the object
          bracelet.imgFireBase = imgList;
          imgProductList = imgList[0];
        } else {
          imgProductList = imageProvider.urlDefaultImg;
        }
        return Column(
          children: [
            //Todo ponerlo en un gesture detector, para poder tomar la info y ponerla en la pantalla
            DisplayProduct(
              imgPath: imgProductList,
              titleProduct: bracelet.title,
              price: bracelet.price,
              id: bracelet.id,
              index: index,
              onTap: ((() => Navigator.pushNamed(context, detailBraceletsScreen, arguments: bracelet))),
            ),
          ],
        );
      },
    );
  }
}

class Necklaces extends StatelessWidget {
  const Necklaces({
    Key? key,
    required this.necklacesProvider,
    required this.imageProvider,
  }) : super(key: key);

  final NecklacesServices necklacesProvider;
  final ImageService imageProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: necklacesProvider.showNecklaces ? necklacesProvider.necklaces.length : 0,
      itemBuilder: (_, int index) {
        final necklace = necklacesProvider.necklaces[index].necklace;
        String imgProductList ;
        if (imageProvider.mapImgs.isNotEmpty) {
          //We check that we have an img
          final imgList = imageProvider.filterImage(necklace.id);
          //passing the new list to the object
          necklace.imgFireBase = imgList;
          imgProductList = imgList[0];
        } else {
          imgProductList = imageProvider.urlDefaultImg;
        }
        return Column(
          children: [
            DisplayProduct(
              imgPath: imgProductList,
              titleProduct: necklace.title,
              price: necklace.price,
              id: necklace.id,
              index: index,
              onTap: ((() => Navigator.pushNamed(context, detailNecklacesScreen, arguments: necklace))),
            ),
          ],
        );
      },
    );
  }
}

class _Filtros extends StatelessWidget {
  final EarringsServices earringProvider;
  final BraceletsServices braceletProvider;
  final NecklacesServices necklacesProvider;

  const _Filtros({
    Key? key,
    required this.earringProvider,
    required this.braceletProvider,
    required this.necklacesProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterServices>(context);
    return Container(
      height: 35,
      //width: double.infinity,
      // color: Colors.red,
      child: Row(
        children: [
          FilterButton(
            text: 'Todos',
            backgroundColor: filterProvider.showAll ? Apptheme.colorPrimary : Apptheme.colorbackground,
            selected: filterProvider.showAll,
            onPressed: () {
              earringProvider.showEarrings = true;
              braceletProvider.showBracelets = true;
              necklacesProvider.showNecklaces = true;
              filterProvider.showAll = true;
            },
          ),
          const SizedBox(width: 10),
          FilterButton(
            text: 'Aretes',
            backgroundColor: filterProvider.showEarrings ? Apptheme.colorPrimary : Apptheme.colorbackground,
            selected: filterProvider.showEarrings,
            onPressed: () {
              earringProvider.showEarrings = true;
              braceletProvider.showBracelets = false;
              necklacesProvider.showNecklaces = false;
              filterProvider.showEarrings = true;
            },
          ),
          const SizedBox(width: 10),
          FilterButton(
            text: 'Pulseras',
            backgroundColor: filterProvider.showBracelets ? Apptheme.colorPrimary : Apptheme.colorbackground,
            selected: filterProvider.showBracelets,
            onPressed: () {
              earringProvider.showEarrings = false;
              braceletProvider.showBracelets = true;
              necklacesProvider.showNecklaces = false;
              filterProvider.showBracelets = true;
            },
          ),
          const SizedBox(width: 10),
          FilterButton(
            text: 'Collares',
            backgroundColor: filterProvider.showNecklaces ? Apptheme.colorPrimary : Apptheme.colorbackground,
            selected: filterProvider.showNecklaces,
            onPressed: () {
              earringProvider.showEarrings = false;
              braceletProvider.showBracelets = false;
              necklacesProvider.showNecklaces = true;
              filterProvider.showNecklaces = true;
            },
          ),
        ],
      ),
    );
  }
}
