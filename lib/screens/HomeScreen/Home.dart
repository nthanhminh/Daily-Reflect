import 'package:daily_reflect/models/MoodOfDay.dart';
import 'package:daily_reflect/screens/CommonComponent/MoodArticle.dart';
import 'package:daily_reflect/screens/CommonComponent/ConvexNavigationBar.dart';
import 'package:daily_reflect/screens/HomeScreen/CalendarBox.dart';
import 'package:daily_reflect/screens/HomeScreen/DayTile.dart';
import 'package:daily_reflect/screens/HomeScreen/MoodChart.dart';
import 'package:daily_reflect/screens/HomeScreen/StreakBox.dart';
import 'package:daily_reflect/screens/CommonComponent/SampleData.dart';
import 'package:daily_reflect/utilities/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../models/Mood.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var testDayList = [1, 2, 3, 4, 5, 6, 7];
  var testDayOfWeekList = [0, 1, 2, 3, 4, 5, 6];
  var testToday = 4;
  var testMoodList = [0, 0, 0, 0, 0, null, null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                //TODO: Experiment more
                Colors.white,
                HexColor('ffcccc'),
                HexColor('ffd9cc'),
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Hey, ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Sky!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(
                    Symbols.hand_gesture,
                    size: 25,
                    weight: 300,
                  ),
                  Expanded(
                      child: SizedBox(
                    width: double.infinity,
                  )),
                  CalendarBox(day: "Sun, 4 Jun"),
                  SizedBox(
                    width: 7,
                  ),
                  StreakBox(streakCount: 5),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 120,
                        child: Row(
                          children: [
                            Expanded(
                              child: AnimationLimiter(
                                child: ListView.builder(
                                  itemCount: testDayList.length,
                                  cacheExtent: 1000,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration: const Duration(milliseconds: 700),
                                      child: SlideAnimation(
                                        horizontalOffset: 100.0,
                                        child: FadeInAnimation(
                                            child: Row(
                                          children: [
                                            SizedBox(
                                              width: 12,
                                            ),
                                            DayTile(
                                              moodOfDay: MoodOfDay(
                                              dayOfMonth: testDayList[index],
                                              dayOfWeek: testDayOfWeekList[index],
                                              isToday: index == testToday,
                                              moodId: testMoodList[index]),
                                            ),
                                          ],
                                        )),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: HexColor("#DED7FA"),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Mood chart",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                    height: 300,
                                    child: MoodChart(moods: SampleData.moods,)),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        cacheExtent: 1000,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              MoodArticle(
                                mood: SampleData.moods[index]
                              ),
                              SizedBox(height: 10,),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
