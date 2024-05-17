import 'package:daily_reflect/utilities/HexColor.dart';
import 'package:flutter/material.dart';

class MoodPopUp extends StatefulWidget {
  MoodPopUp({super.key, required this.way, required this.currentStatus});

  late String way;
  late String currentStatus;

  @override
  State<MoodPopUp> createState() => _MoodPopUpState();
}

class _MoodPopUpState extends State<MoodPopUp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Material(
          color: Colors.white,
          elevation: 4,
          clipBehavior: Clip.hardEdge,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(0.8, 1),
                          colors: <Color>[
                            HexColor('#BAE6FF'),
                            HexColor('#D0CFE9'),
                            HexColor('#FFCEB7'),
                            HexColor('#DF2771'),
                          ],
                          tileMode: TileMode.mirror,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 20,
                            blurRadius: 20,
                            color: HexColor('#FFCEB7'),
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Icon(
                      Icons.favorite,
                      size: 55,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You're on a ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.way}!',
                        style: TextStyle(
                            color: HexColor('#8B4CFC'),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Center(
                      child: Text(
                    "Your day is going",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
                  Center(
                      child: Text(
                    widget.currentStatus,
                    style: TextStyle(
                        color: HexColor('#8B4CFC'),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Keep tracking your mood to know how to improve your mental health.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13.0),
                      child: Text(
                        'Got it',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor('#8B4CFC')),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
