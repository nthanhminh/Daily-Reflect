import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../generated/assets.dart';

class StreakBox extends StatelessWidget {
  StreakBox({super.key, required this.streakCount});
  int streakCount;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
          child: Row(
            children: [
              SizedBox(width: 2,),
              SvgPicture.asset(Assets.iconsFireSvgrepoCom, width: 20,height: 20, colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn),),
              SizedBox(width: 7,),
              Text(
                streakCount.toString(),
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
