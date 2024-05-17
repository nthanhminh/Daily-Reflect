import 'package:flutter/material.dart';
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
              Icon(
                Symbols.calendar_add_on_rounded,
                size: 25,
                weight: 300,
                color: Colors.purple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
