import 'package:berry_catalog/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> sendWhatssApp(BuildContext context, Contacts contact, String additionalInfo, String productId) async {
  final String beginUrl = contact.whatsappUrl;
  const String sendParam = '/send?phone=';
  final phone = contact.phone;
  const String textParam = '&text=';
  String msg = contact.initMsg;
  if (additionalInfo != '') {
    msg = '$msg ${contact.nombreMsg} $additionalInfo ${contact.idMsg} $productId';
  }

  final Uri _url = Uri.parse('$beginUrl$sendParam$phone$textParam$msg');

  // print(_url.toString());

  if (!await launchUrl(
    _url,
    mode: LaunchMode.externalNonBrowserApplication,
  )) {
    throw Exception('Could not launch $_url');
  }
}
