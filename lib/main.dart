import 'package:daily_reflect/screens/HistoryScreen/HistoryScreen.dart';
import 'package:daily_reflect/screens/HomeScreen/Home.dart';
import 'package:daily_reflect/screens/CommonComponent/SampleData.dart';
import 'package:daily_reflect/screens/CommonComponent/ScaffoldWrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const DailyReflectApp());
}

class DailyReflectApp extends StatelessWidget {
  const DailyReflectApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light);
    return GetMaterialApp(
      theme: themeData,
      title: 'DailyReflect',
        initialRoute: '/',
      routes: {
        '/': (context) => ScaffoldWrapper(),
        //'/home': (context) => Home(),
        //'/history': (context) => History(weeksOfArticles: SampleData.weeksOfMoods),
      },
    );
  }
}
