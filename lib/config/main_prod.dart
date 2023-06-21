import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor_sample/config/appconfig.dart';
import 'package:flutter_flavor_sample/firebase_options.dart';
import 'package:flutter_flavor_sample/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppConfig appConfig = AppConfig(
    appName: "Flavor PROD",
    appThemeData: ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
    ),
    appFlavorName: "prod",
  );
  mainCommon(appConfig);
}
