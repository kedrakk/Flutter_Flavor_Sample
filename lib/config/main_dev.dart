import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor_sample/config/appconfig.dart';
import 'package:flutter_flavor_sample/main.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppConfig appConfig = AppConfig(
    appName: "Flavor DEV",
    appThemeData: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    appFlavorName: "dev",
  );
  mainCommon(appConfig);
}
