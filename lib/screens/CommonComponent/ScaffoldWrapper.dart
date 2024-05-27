
import 'package:daily_reflect/screens/AddMoodScreens/select_mood.dart';
import 'package:daily_reflect/screens/HistoryScreen/HistoryScreen.dart';
import 'package:daily_reflect/screens/HomeScreen/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../providers/mood_data.dart';
import '../../utilities/HexColor.dart';
import '../CommonService/NavBarController.dart';
import '../Post/PostView/Post.dart';
import '../Profile/Profile.dart';
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
    List<Widget> widgets = [const Home(), const Post(), History(weeksOfArticles: SampleData.weeksOfMoods), const Profile()];
    return Scaffold(
    bottomNavigationBar: const ConvexNavigationBar(),
    body: Navigator(
      onGenerateRoute: (settings) {
        Widget page = Obx(() => widgets[c.currentIdx.value]);
        if (settings.name == '/home') page = const Home();
        if (settings.name == '/history') page = History(weeksOfArticles: SampleData.weeksOfMoods);
        if (settings.name == '/profile') page = const Profile();
        if (settings.name == '/posts') page = const Post();
        return MaterialPageRoute(builder: (_) => page);
      },
    ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return ChangeNotifierProvider(
                  create: (context) => MoodData(),
                  child: const AddMood()
              );
            }
        );
      },
      foregroundColor: Colors.white,
      backgroundColor: Colors.blueAccent,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}
