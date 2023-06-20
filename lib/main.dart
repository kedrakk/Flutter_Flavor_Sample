import 'package:flutter/material.dart';
import 'package:flutter_flavor_sample/config/appconfig.dart';

import 'home.dart';

mainCommon(AppConfig appConfig) {
  runApp(
    MyApp(
      appConfig: appConfig,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appConfig,
  });
  final AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appConfig.appName,
      theme: appConfig.appThemeData,
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        appConfig: appConfig,
        isSiginContain: true,
      ),
    );
  }
}
