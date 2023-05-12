import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tibbi_terminoloji/controller/history_controller.dart';
import 'package:tibbi_terminoloji/controller/read_controller.dart';
import 'package:tibbi_terminoloji/model/history_model.dart';
import 'package:tibbi_terminoloji/screen/termo_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Directory document = await getApplicationDocumentsDirectory();
  Hive
    ..init(document.path)
    ..registerAdapter(historymodelAdapter());

  await Hive.openBox("historyBox");
  // await Hive.openBox("historyBox");
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFFCD0916), // navigation bar color
      statusBarColor: Color(0xFFCD0916) // status bar color
      ));
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  HistoryController hiController = Get.put(HistoryController());

  ReadController textController = Get.put(ReadController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'tibbi_terminoloji',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'CourierPrime',
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF0F8FF),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFFCD0916),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'CourierPrime',
          ),
        ),
      ),
      home: const TermoDashBoard(),
    );
  }
}
