import 'package:flutter/material.dart';
import 'package:flutter_flavor_sample/config/appconfig.dart';
import 'package:flutter_flavor_sample/main.dart';

void main() {
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
