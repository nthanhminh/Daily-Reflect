import 'package:daily_reflect/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/symbols.dart';


class CalendarBox extends StatelessWidget {
  CalendarBox({super.key, required this.day});
  late final String day;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Row(
            children: [
              Text(
                day,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 5,),
              SvgPicture.asset(Assets.iconsCalendarDaysSvgrepoCom, width: 20,height: 20, colorFilter: ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn))
            ],
          ),
        ),
      ),
    );
  }
}
