import 'package:daily_reflect/screens/CommonComponent/ScaffoldWrapper.dart';
import 'package:daily_reflect/screens/Login/login_page.dart';
import 'package:daily_reflect/screens/Login/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  runApp(const DailyReflectApp());
}

class DailyReflectApp extends StatelessWidget {
  const DailyReflectApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData =
        ThemeData(useMaterial3: true, brightness: Brightness.light);
    return GetMaterialApp(
      theme: themeData,
      title: 'DailyReflect',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/app': (context) => const ScaffoldWrapper(),
        //'/home': (context) => Home(),
        //'/history': (context) => History(weeksOfArticles: SampleData.weeksOfMoods),
      },
    );
  }
}
