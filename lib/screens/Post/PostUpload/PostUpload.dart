import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostUpload extends StatefulWidget {
  const PostUpload({super.key});

  @override
  State<PostUpload> createState() => _PostUploadState();
}

class _PostUploadState extends State<PostUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUI(context));
  }
}

Widget _buildUI(BuildContext context) {
  return Container(
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 32),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Colors.white.withOpacity(0.6),
                    )),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 8, right: 16),
                    child: Text(
                      'Create your new post',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lexend',
                        letterSpacing: 1.2,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 32),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(28)
                  ),
                  child: Text(
                    'Post',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                      letterSpacing: 1.2,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 32),
            padding: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/profileImage/profile1.png'),
                  radius: 24,
                ),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                            'Kaito',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 18,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w500
                            ),
                        ),
                      ),
                      SizedBox(height: 6,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IntrinsicWidth(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Only me',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 15,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(width: 6,),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 28,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.greenAccent,
                      size: 32,
                    )
                ),
              ],
            )
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: TextFormField(
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Lexend',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null, // Allows unlimited lines
              decoration: InputDecoration(
                hintText: 'Enter your text here',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                ),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    ),
  );
}
