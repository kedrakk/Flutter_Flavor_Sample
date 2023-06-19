import 'package:flutter/material.dart';
import 'package:flutter_flavor_sample/config/appconfig.dart';
import 'package:flutter_flavor_sample/main.dart';

void main() {
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
