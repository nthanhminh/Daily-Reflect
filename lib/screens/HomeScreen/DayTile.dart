import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class DayTile extends StatelessWidget {
  DayTile(
      {super.key,
      required this.dayOfWeek,
      required this.dayOfMonth,
        this.moodId,
      required this.isToday});

  late final int dayOfWeek;
  late final int dayOfMonth;
  late final int? moodId;
  late final bool isToday;

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
                    Text(daysName[dayOfWeek],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal,
                          color: isToday? Colors.white : Colors.black,
                        ),
                    ),
                    Text(
                      dayOfMonth.toString(),
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold,
                            color: isToday? Colors.white : Colors.black,),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: isToday ? Colors.purpleAccent : Colors.white,
              )),
          SizedBox(
            height: 5,
          ),
          moodId == null ? Container() : Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: isToday ? Colors.purpleAccent : Colors.white,),
            height: 30,
            width: 30,
            child: Center(
              child: /* Image(
                image: AssetImage(''),
                height: 10,
                width: 10,
              ),*/ Icon(
                Icons.alarm
              )
            ),
          )
        ],
      ),
    );
  }
}
