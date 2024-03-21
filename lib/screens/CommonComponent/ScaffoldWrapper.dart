import 'package:daily_reflect/screens/HistoryScreen/HistoryScreen.dart';
import 'package:daily_reflect/screens/HomeScreen/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/HexColor.dart';
import '../CommonService/NavBarController.dart';
import 'ConvexNavigationBar.dart';
import 'SampleData.dart';

class ScaffoldWrapper extends StatefulWidget {
  const ScaffoldWrapper({super.key});

  @override
  State<ScaffoldWrapper> createState() => _ScaffoldWrapperState();
}

class _ScaffoldWrapperState extends State<ScaffoldWrapper> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  final NavBarController c = Get.put(NavBarController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    _tabController.index = c.currentIdx.value;
    return Scaffold(
    bottomNavigationBar: ConvexNavigationBar(),
    body: Navigator(
      onGenerateRoute: (settings) {
        Widget page = Home();
        if (settings.name == '/home') page = Home();
        if (settings.name == '/history') page = History(weeksOfArticles: SampleData.weeksOfMoods);
        return MaterialPageRoute(builder: (_) => page);
      },
    )
    );
  }
}
