import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';

class PostItem extends StatefulWidget {
  final List<String> images;
  final String text;
  int curIndex;

  PostItem({
    required this.images,
    required this.text,
  }) : curIndex = 0;


  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      widget.curIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 32),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/profileImage/profile4.png'),
                  radius: 24,
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  child: Text(
                    'Craig_Love',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 16),
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          SizedBox(
            width: double.infinity,
            height: 450,
            child: PageView.builder(
                itemCount: widget.images.length,
                onPageChanged: (index) {
                  setState(() {
                    widget.curIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    height: 450,
                    child: Image.asset(
                      widget.images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 12,
          ),
          Stack(children: [
            Container(
              padding: EdgeInsets.only(left: 4),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 32,
                      color: Colors.white.withOpacity(1),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Entypo.paper_plane,
                      size: 32,
                      color: Colors.white.withOpacity(1),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.images.length > 1)
                    for (int i = 0; i < widget.images.length; i++)
                      buildIndicator(i == widget.curIndex)
                  else
                    Container(),
                ],
              ),
            )
          ]),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/profileImage/profile3.png'),
                        radius: 12,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        child: Text(
                          'Liked by',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        child: Text(
                          'kieron_d',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  child: Text(
                    'and',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  child: Text(
                    '10000 others',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            alignment: Alignment.topLeft,
            child: Text(
              '2 days ago',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2),
            ),
          )
        ],
      ),
    );
  }
}

Widget buildIndicator(bool selected) {
  return Container(
    margin: EdgeInsets.only(right: 8),
    width: selected ? 9 : 6,
    height: selected ? 9 : 6,
    decoration: BoxDecoration(
      color: selected
          ? Colors.lightBlueAccent.withOpacity(0.9)
          : Colors.white.withOpacity(0.8),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}