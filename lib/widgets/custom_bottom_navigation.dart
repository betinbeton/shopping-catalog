import 'package:berry_catalog/routes/routes.dart';
import 'package:berry_catalog/services/services.dart';
import 'package:berry_catalog/theme/app_theme.dart';
import 'package:berry_catalog/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactsService = Provider.of<ContactingService>(context);
    return BottomAppBar(
      elevation: 0,
      color: Apptheme.colorbackground,
      shape: CircularNotchedRectangle(),
      notchMargin: 0,
      child: Row(
        //children inside bottom appbar
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.article_outlined,
              color: Apptheme.colorPrimary,
            ),
            tooltip: 'Información',
            onPressed: () {
              Navigator.pushNamed(context, infoScreen);
            },
          ),
          SizedBox(width: 20),
          IconButton(
            icon: ImageIcon(AssetImage("images/whatsappBlack.png")),
            tooltip: 'Comprar',
            onPressed: () {
              sendWhatssApp(context, contactsService.contacts, '', '');
            },
          ),
        ],
      ),
    );
  }
}
