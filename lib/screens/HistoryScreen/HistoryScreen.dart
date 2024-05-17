import 'package:daily_reflect/screens/HistoryScreen/ArticlesColumn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/WeekOfArticles.dart';
import '../../utilities/HexColor.dart';
import '../CommonComponent/ConvexNavigationBar.dart';

class History extends StatefulWidget {
  History({super.key, required this.weeksOfArticles});

  List<WeekOfArticles> weeksOfArticles;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with TickerProviderStateMixin {
  late PageController _pageViewController;
  bool back = false;
  int _currentPageIndex = 0;
  final offset1 = Tween(begin: const Offset(0, -1), end: const Offset(0, 0));
  final offset2 = Tween(begin: const Offset(0, 1), end: const Offset(0, 0));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageViewController.dispose();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#B0B0B0'),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40,),
            Row(
              children: [
                SizedBox(width: 10.0,),
                Text("Your history", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                Expanded(child: SizedBox(width: double.infinity,)),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) => SlideTransition(
                    position: back ? (animation.value == 1? offset2 : offset1).animate(animation) : (animation.value == 1? offset1 : offset2).animate(animation),
                    child: child,
                  ),
                  child: Text(
                    widget.weeksOfArticles[_currentPageIndex].weekTime, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                    key: ValueKey<int>(_currentPageIndex),
                  ),
                ),                SizedBox(width: 5,),
                IconButton(onPressed: () {
                  _updateCurrentPageIndex(_currentPageIndex - 1);
                }, icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                )),
                IconButton(onPressed: () {
                  _updateCurrentPageIndex(_currentPageIndex + 1);
                }, icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                )),
                SizedBox(width: 5,)
              ],
            ),
            Expanded(
              child: PageView.builder(
                itemCount: widget.weeksOfArticles.length,
                controller: _pageViewController,
                  onPageChanged: _handlePageViewChanged,
                  itemBuilder: (BuildContext context, int index) {
                    return ArticlesColumn(moods: widget.weeksOfArticles[index].moodsForTheWeek);
                  }
              ),
            )
          ],
        )));
  }
  void _handlePageViewChanged(int currentPageIndex) {
    setState(() {
      if(_currentPageIndex < currentPageIndex) {
        back = false;
      } else {
        back = true;
      }
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}