import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.moods.length,
        cacheExtent: 1000,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 700),
            child: SlideAnimation(
              verticalOffset: 200.0,
              child: FadeInAnimation(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MoodArticle(
                        mood: widget.moods[index],
                      ),
                      SizedBox(height: 10,),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
