import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../utilities/HexColor.dart';

class MoodArticle extends StatefulWidget {
  MoodArticle({super.key, required this.time, required this.feelings, required this.causes, required this.note, required this.moodId});
  List<String> feelings;
  List<String> causes;
  String note;
  String time;
  int moodId;

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

    if (widget.note.length > 100) {
      firstHalf = widget.note.substring(0, 100);
      secondHalf = widget.note.substring(100, widget.note.length);
    } else {
      firstHalf = widget.note;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    String feeling = buildStringFromList(widget.feelings);
    String cause = buildStringFromList(widget.causes);
    return AnimatedSize(
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
                  title: Text(moodString[widget.moodId], style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(widget.time),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Symbols.edit)),
                      IconButton(onPressed: () {}, icon: Icon(Symbols.delete)),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('You felt ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),),
                    Text(feeling, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: [
                    Text('Because of ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),),
                    Text(cause, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Note: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    Flexible(child: Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300))),
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
                        flag ? ' Read more' : ' Read less', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: HexColor('#8B4CFC')),
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
                Flexible(child: Text('All the world holds dear is but a backdrop of constant motion. I stand before it alone and unchanging', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),)),
                SizedBox(height: 10,)
              ],
            ),
          )
      ),
    );
  }
}
