import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../Common/PostItem.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  List<String> images = [
    'assets/profileImage/anh2.jpg',
    'assets/profileImage/anh5.jpg',
    'assets/profileImage/anh6.jpg',
  ];

  var curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          padding: const EdgeInsets.only(
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
            color: const Color(0xFF121212).withOpacity(0.95),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(),
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
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: const GradientBoxBorder(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFFBAA47),
                                        Color(0xFFD91A46),
                                        Color(0xFFA60F93)
                                      ]),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(52),
                                ),
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/profileImage/profile1.png'),
                                  radius: 40,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Your story',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 15,
                                ),
                              )
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: const GradientBoxBorder(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFFBAA47),
                                        Color(0xFFD91A46),
                                        Color(0xFFA60F93)
                                      ]),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(52),
                                ),
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/profileImage/profile3.png'),
                                  radius: 40,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'kieron_d',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 15,
                                ),
                              )
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: const GradientBoxBorder(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFFBAA47),
                                        Color(0xFFD91A46),
                                        Color(0xFFA60F93)
                                      ]),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(52),
                                ),
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/profileImage/profile2.png'),
                                  radius: 40,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'zackjohn',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 15,
                                ),
                              )
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: const GradientBoxBorder(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFFBAA47),
                                        Color(0xFFD91A46),
                                        Color(0xFFA60F93)
                                      ]),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(52),
                                ),
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/profileImage/profile4.png'),
                                  radius: 40,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'craig_love',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 15,
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  padding: const EdgeInsets.only(left: 16, bottom: 32, right: 16),
                  decoration: BoxDecoration(
                      border: Border(
                      bottom: BorderSide(
                        color: Colors.white.withOpacity(0.2), // Màu sắc của đường viền dưới
                        width: 1.5, // Độ rộng của đường viền dưới
                      ),
                  )),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/profileImage/profile1.png'),
                        radius: 24,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 32),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white.withOpacity(0.6),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            'Write something here ...',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.6),
                              letterSpacing: 1.2,
                              fontFamily: 'Lexend',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                PostItem(
                  images: images,
                  text: 'Đây là bài viết đầu tiên của tôi trên ứng dụng này',
                ),
                PostItem(
                  images: const ['assets/profileImage/anh2.jpg'],
                  text: 'Đây là bài viết đầu tiên của tôi trên ứng dụng này',
                ),
                PostItem(
                  images: const ['assets/profileImage/anh2.jpg'],
                  text: 'Đây là bài viết đầu tiên của tôi trên ứng dụng này',
                ),
              ],
            ),
          )),
    );
  }
}

Widget buildIndicator(bool selected) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
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
