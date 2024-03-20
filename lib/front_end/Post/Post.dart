import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:fluttericon/entypo_icons.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  var images = [
    'assets/profileImage/anh2.jpg',
    'assets/profileImage/anh5.jpg',
    'assets/profileImage/anh6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          padding: EdgeInsets.only(
            top: 32,
          ),
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     Color(0xFFC3FFD4).withOpacity(1),
            //     Color(0xFFCFCCFB).withOpacity(1),
            //     Color(0xFFEEF9F2).withOpacity(1)
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
            color: Color(0xFF121212).withOpacity(0.95),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(),
                  alignment: Alignment.center,
                  child: Text(
                    'Instagram',
                    style: GoogleFonts.slacksideOne(
                        textStyle: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: GradientBoxBorder(
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFFBAA47),
                                          Color(0xFFD91A46),
                                          Color(0xFFA60F93)
                                        ]),
                                        width: 4),
                                    borderRadius: BorderRadius.circular(52),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/profileImage/profile1.png'),
                                    radius: 40,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Text(
                                    'Your story',
                                    style: TextStyle(
                                      color: Color(0xFFF9F9F9),
                                      fontSize: 15,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: GradientBoxBorder(
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFFBAA47),
                                          Color(0xFFD91A46),
                                          Color(0xFFA60F93)
                                        ]),
                                        width: 4),
                                    borderRadius: BorderRadius.circular(52),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/profileImage/profile3.png'),
                                    radius: 40,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Text(
                                    'kieron_d',
                                    style: TextStyle(
                                      color: Color(0xFFF9F9F9),
                                      fontSize: 15,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: GradientBoxBorder(
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFFBAA47),
                                          Color(0xFFD91A46),
                                          Color(0xFFA60F93)
                                        ]),
                                        width: 4),
                                    borderRadius: BorderRadius.circular(52),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/profileImage/profile2.png'),
                                    radius: 40,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Text(
                                    'zackjohn',
                                    style: TextStyle(
                                      color: Color(0xFFF9F9F9),
                                      fontSize: 15,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: GradientBoxBorder(
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFFBAA47),
                                          Color(0xFFD91A46),
                                          Color(0xFFA60F93)
                                        ]),
                                        width: 4),
                                    borderRadius: BorderRadius.circular(52),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/profileImage/profile4.png'),
                                    radius: 40,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Text(
                                    'craig_love',
                                    style: TextStyle(
                                      color: Color(0xFFF9F9F9),
                                      fontSize: 15,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
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
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Đây là bài viết đầu tiên của tôi trên ứng dụng này',
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
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: double.infinity,
                                height: 450,
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 4,
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
                ),
                Container(
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
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Đây là bài viết đầu tiên của tôi trên ứng dụng này',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        constraints: BoxConstraints(
                          minHeight: 450,
                        ),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/profileImage/anh6.jpg'),
                          fit: BoxFit.cover,
                        )),
                      ),
                      SizedBox(
                        height: 4,
                      ),
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
                ),
                Container(
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
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Đây là bài viết đầu tiên của tôi trên ứng dụng này',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        constraints: BoxConstraints(
                          minHeight: 450,
                        ),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/profileImage/anh2.jpg'),
                          fit: BoxFit.cover,
                        )),
                      ),
                      SizedBox(
                        height: 4,
                      ),
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
                ),
              ],
            ),
          )),
    );
  }
}
