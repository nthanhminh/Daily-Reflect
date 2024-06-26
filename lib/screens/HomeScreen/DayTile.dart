import 'package:daily_reflect/models/MoodOfDay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../generated/assets.dart';

class DayTile extends StatelessWidget {
  DayTile(
      {super.key,
      required this.moodOfDay});

  MoodOfDay moodOfDay;

  var daysName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 50,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 7),
                child: Column(
                  children: [
                    Text(daysName[moodOfDay.dayOfWeek],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal,
                          color: moodOfDay.isToday? Colors.white : Colors.black,
                        ),
                    ),
                    Text(
                      moodOfDay.dayOfMonth.toString(),
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold,
                            color: moodOfDay.isToday? Colors.white : Colors.black,),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: moodOfDay.isToday ? Colors.purpleAccent : Colors.white,
              )),
          SizedBox(
            height: 5,
          ),
          moodOfDay.moodId == null ? Container() : Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: moodOfDay.isToday ? Colors.purpleAccent : Colors.white,),
            height: 30,
            width: 30,
            child: Center(
              child: /* Image(
                image: AssetImage(''),
                height: 10,
                width: 10,
              ),*/
              SvgPicture.asset(Assets.iconsEmojiLove, width: 20,height: 20)
            ),
          )
        ],
      ),
    );
  }
}
