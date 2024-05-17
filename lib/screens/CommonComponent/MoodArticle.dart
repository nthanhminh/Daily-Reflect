import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../models/Mood.dart';
import '../../utilities/HexColor.dart';

class MoodArticle extends StatefulWidget {
  MoodArticle({super.key, required this.mood});
  Mood mood;

  @override
  State<MoodArticle> createState() => _MoodArticleState();
}

class _MoodArticleState extends State<MoodArticle> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  var moodString = ['Terrible', 'Bad', 'Neutral', 'Good', 'Excellent'];
  String buildStringFromList(List<String> list) {
    String res = '';
    for (int i = 0; i < list.length; i++) {
      res = '$res${list[i]},';
    }
    res = res.substring(0, res.length - 1);
    return res;
  }

  @override
  void initState() {
    super.initState();

    if (widget.mood.note!.length > 100) {
      firstHalf = widget.mood.note!.substring(0, 100);
      secondHalf = widget.mood.note!.substring(100, widget.mood.note!.length);
    } else {
      firstHalf = widget.mood.note!;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    String feeling = buildStringFromList(widget.mood.feelings!);
    String cause = buildStringFromList(widget.mood.causes!);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: AnimatedSize(
        duration: Duration(milliseconds: 150),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10,),
                  ListTile(
                    leading: FlutterLogo(),
                    title: Text(moodString[widget.mood.moodId!], style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(widget.mood.time!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () {Navigator.pushNamed(context, '/history');}, icon: Icon(Symbols.edit)),
                        IconButton(onPressed: () {}, icon: Icon(Symbols.delete)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('You felt ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                      Text(feeling, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Because of ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                      Text(cause, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Note: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      Flexible(child: Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400))),
                    ],
                  ),
                  SizedBox(height: 7,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: HexColor('#8B4CFC'),
                          size: 15,
                        ),
                        Text(
                          flag ? ' Read more' : ' Read less', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: HexColor('#8B4CFC')),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Divider(color: Colors.grey, height: 2.0),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Find eternity', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                      Expanded(child: SizedBox(width: double.infinity,)),
                      Icon(
                        Icons.lightbulb,
                        color: Colors.yellowAccent,
                        size: 15,
                      ),
                      SizedBox(width: 5,),
                      Text('Tips', style: TextStyle(fontSize: 15, color: Colors.yellowAccent),),
                      SizedBox(width: 10,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Flexible(child: Text('All the world holds dear is but a backdrop of constant motion. I stand before it alone and unchanging', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)),
                  SizedBox(height: 10,)
                ],
              ),
            )
        ),
      ),
    );
  }
}
