import 'package:berry_catalog/theme/app_theme.dart';
import 'package:berry_catalog/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

class ImgFullScreen extends StatelessWidget {
  const ImgFullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context)!.settings.arguments! as String;
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
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(url),
        ),
      ),
    );
  }
}
