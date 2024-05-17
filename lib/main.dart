import 'package:daily_reflect/front_end/Post/DataUpload/DataUpload.dart';
import 'package:daily_reflect/front_end/Post/PostUpload/PostUpload.dart';
import 'package:flutter/material.dart';

import 'front_end/Post/PostView/Post.dart';
import 'front_end/Profile/Profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Reflect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DataUpload(),
      },
    );
  }
}