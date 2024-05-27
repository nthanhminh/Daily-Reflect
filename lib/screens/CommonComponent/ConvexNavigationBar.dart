import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../providers/mood_data.dart';
import '../../utilities/FakePopUpRoute.dart';
import '../AddMoodScreens/select_mood.dart';
import '../CommonService/NavBarController.dart';
import '../MoodPopUp.dart';

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
      ],
      onTap: (int i) {
        switch (i) {
          case 0:
            controller.switchToHome();
          case 1:
            controller.switchToPosts();
            // Navigator.of(context).push(FakePopUpRoute(builder: (context) {
            //   return MoodPopUp(way: 'Good way', currentStatus: 'Amazing');
            // }));
          case 2:
            controller.switchToHistory();
          case 3:
            controller.switchToProfile();
          default:
            print("Error");
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
