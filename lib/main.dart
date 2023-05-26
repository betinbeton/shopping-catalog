import 'package:berry_catalog/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:berry_catalog/routes/routes.dart';

import 'services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BannerService()),
        ChangeNotifierProvider(create: (_) => EarringsServices()),
        ChangeNotifierProvider(create: (_) => NecklacesServices()),
        ChangeNotifierProvider(create: (_) => BraceletsServices()),
        ChangeNotifierProvider(create: (_) => FilterServices()),
        ChangeNotifierProvider(create: (_) => ContactingService()),
        ChangeNotifierProvider(create: (_) => ImageService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Berrylicius',
      initialRoute: homeScreen,
      routes: appRoutes,
    );
  }
}
