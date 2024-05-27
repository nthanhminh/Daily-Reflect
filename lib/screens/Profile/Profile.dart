import 'package:flutter/material.dart';

import '../Common/PostItem.dart';
import 'Friend.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late final _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF121212),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 32, right: 16,left: 16),
              // alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: 32,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    onPressed: (){},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12,),
            Container(
              padding: const EdgeInsets.only(left: 16,),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profileImage/profile4.png'),
                        radius: 48,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Jacob West',
                        style: TextStyle(
                            color: Color(0xFFF9F9F9),
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16,),
                  Column(
                    children: [
                      Text(
                        '54',
                        style: TextStyle(
                          color: Color(0xFFF9F9F9),
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 0,),
                      Text(
                        'Posts',
                        style: TextStyle(
                            color: Color(0xFFF9F9F9),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16,),
                  Column(
                    children: [
                      Text(
                        '18',
                        style: TextStyle(
                            color: Color(0xFFF9F9F9),
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 0,),
                      Text(
                        'Friends',
                        style: TextStyle(
                          color: Color(0xFFF9F9F9),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey.withOpacity(0.1),
            ),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(
                  icon: Icon(Icons.grid_on,size: 32),
                ),
                Tab(
                  icon: Icon(Icons.contact_page_rounded,size: 32,),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 32,),
                        PostItem(images: const ['assets/profileImage/anh2.jpg'], text: 'Đây là bài viết đầu tiên của tôi trên ứng dụng này',),
                        PostItem(images: const ['assets/profileImage/anh2.jpg'], text: 'Đây là bài viết đầu tiên của tôi trên ứng dụng này',),
                      ],
                    ),

                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 32,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                showModalBottomSheet(context: context, isScrollControlled: true,builder: (BuildContext context){
                                    return Container(
                                      height: 650,
                                      color: const Color(0xFF121212),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 32,left: 16,right: 16),
                                            child: TextField(
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.8)
                                              ),
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.qr_code_sharp, color: Colors.white.withOpacity(0.8),),
                                                hintText: 'Type the invitation code',
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30)
                                                ),
                                                contentPadding: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
                                                filled: true,
                                                fillColor: Colors.grey.withOpacity(0.4),
                                                hintStyle: TextStyle(
                                                  color: Colors.white.withOpacity(0.8),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(30)
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 48,),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 32),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.3),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              'Add Friend',
                                              style: TextStyle(
                                                color: Colors.lightBlueAccent.withOpacity(0.8),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                });
                              },
                              child: IntrinsicWidth(
                                child: Container(
                                  width: 240,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.add_box_sharp,color: Colors.lightBlueAccent,size: 36,),
                                      SizedBox(width: 8,),
                                      Text(
                                        'Add New Friend',
                                        style: TextStyle(
                                            color: Colors.lightBlueAccent,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32,),
                            InkWell(
                              onTap: (){
                                showModalBottomSheet(context: context, builder: (BuildContext){
                                  return Container(
                                    height: 600,
                                    color: const Color(0xFF121212),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:const EdgeInsets.only(top: 32),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    borderRadius: BorderRadius.circular(30),
                                                  ),
                                                  child: Text(
                                                      '0x3ydfzxkjdscapuwqfiefwieufhiewq',
                                                    style: TextStyle(
                                                      color: Colors.white.withOpacity(0.8),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: (){},
                                                icon: Icon(
                                                  Icons.copy_sharp,
                                                  color: Colors.white.withOpacity(0.8),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 32,),
                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 32),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Text(
                                            'Share',
                                            style: TextStyle(
                                              color: Colors.lightBlueAccent.withOpacity(0.8),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                              },
                              child: IntrinsicWidth(
                                child: Container(
                                  width: 240,
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.add_box_sharp,color: Colors.lightBlueAccent,size: 36,),
                                      SizedBox(width: 8,),
                                      Text(
                                        'My Invitation Code',
                                        style: TextStyle(
                                            color: Colors.lightBlueAccent,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32,),
                        Friend(image: 'assets/profileImage/profile1.png', name: 'M.Owen', id: 1),
                        Friend(image: 'assets/profileImage/profile2.png', name: 'M.Ballack', id: 2),
                      ],
                    ),

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
