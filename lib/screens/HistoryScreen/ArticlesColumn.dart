import 'package:flutter/material.dart';

import '../../models/Mood.dart';
import '../CommonComponent/MoodArticle.dart';
import '../CommonComponent/SampleData.dart';

class ArticlesColumn extends StatefulWidget {
  List<Mood> moods;
  ArticlesColumn({super.key, required this.moods});

  @override
  State<ArticlesColumn> createState() => _ArticlesColumnState();
}

class _ArticlesColumnState extends State<ArticlesColumn> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.moods.length,
        cacheExtent: 1000,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MoodArticle(
                  mood: widget.moods[index],
              ),
              SizedBox(height: 10,),
            ],
          );
        },
      ),
    );
  }
}
