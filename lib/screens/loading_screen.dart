import 'package:berry_catalog/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Image.asset(
          'images/LetrasLogo2.png',
          // fit: BoxFit.contain,
          height: 100,
          width: 150,
        ),
        elevation: 0,
        toolbarHeight: 40,
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        child: Image.asset('images/loading2.gif'),
      )),
    );
  }
}
