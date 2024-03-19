import 'package:daily_reflect/screens/ConvexNavigationBar.dart';
import 'package:daily_reflect/screens/HomeScreen/CalendarBox.dart';
import 'package:daily_reflect/screens/HomeScreen/DayTile.dart';
import 'package:daily_reflect/screens/HomeScreen/StreakBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

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
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: ConvexNavigationBar(),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 160,
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
                                          SizedBox(width: 12,),
                                          DayTile(
                                            dayOfMonth: testDayList[index],
                                            dayOfWeek: testDayOfWeekList[index],
                                            isToday: index == testToday,
                                            moodId: testMoodList[index],
                                          ),
                                        ],
                                      )),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 12,)
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
