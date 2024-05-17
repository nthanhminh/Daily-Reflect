import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../providers/mood_data.dart';
import '../AddMoodScreens/select_mood.dart';
import '../CommonService/NavBarController.dart';

class ConvexNavigationBar extends StatelessWidget {
  const ConvexNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController controller = Get.find();
    return ConvexAppBar.badge( {1: '3'},
      badgeMargin: EdgeInsets.only(left: 17, right: 0, top: 0, bottom: 20),
      //badgePadding: EdgeInsets.only(left: 10, bottom: 10),
      style: TabStyle.react,
      items: [
      TabItem(icon: Icons.home, title: 'Home', ),
      TabItem(icon: Icons.publish, title: 'Posts'),
      TabItem(icon: Icons.article, title: 'History'),
      TabItem(icon: Icons.person, title: 'Profile'),
      TabItem(icon: Icons.add, title: 'Add mood')
    ],
      onTap: (int i) {
        switch (i) {
          case 0:
            Get.toNamed('/home');
          case 4:
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return ChangeNotifierProvider(
                  create: (context) => MoodData(),
                  child: AddMood()
                );
              }
            );
          default:
            print("Fuck you");
        }
      },
      backgroundColor: Colors.purpleAccent,
      activeColor: Colors.white,
      color: Colors.white,
      initialActiveIndex: 0,
      //cornerRadius: 10.0,
      curve: Curves.decelerate,
    );
  }
}
