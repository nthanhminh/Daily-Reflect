import 'package:flutter/material.dart';

class TimeUtility {
  static TimeOfDay parseTime(String timeString) {
    List<String> parts = timeString.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    return TimeOfDay(hour: hour, minute: minute);
  }

  static TimeOfDay addMinutesToTime(TimeOfDay originalTime, int minutesToAdd) {
    int totalMinutes = originalTime.hour * 60 + originalTime.minute + minutesToAdd;

    int newHour = totalMinutes ~/ 60;
    int newMinute = totalMinutes % 60;

    if(newHour >= 24) {
      newHour -= 24;
    }

    return TimeOfDay(hour: newHour, minute: newMinute);
  }

  static TimeOfDay subtractMinutesFromTime(TimeOfDay originalTime, int minutesToSubtract) {
    int totalMinutes = originalTime.hour * 60 + originalTime.minute - minutesToSubtract;

    if(totalMinutes < 0) {
      totalMinutes += 24 * 60;
    }

    int newHour = totalMinutes ~/ 60;
    int newMinute = totalMinutes % 60;

    return TimeOfDay(hour: newHour, minute: newMinute);
  }

  static String formatTimeOfDay(TimeOfDay timeOfDay) {
    String hour = timeOfDay.hour.toString().padLeft(2, '0');
    String minute = timeOfDay.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }

  static int minuteDifference(TimeOfDay time1, TimeOfDay time2) {
    final minutes1 = (time1.hour * 60) + time1.minute;
    final minutes2 = (time2.hour * 60) + time2.minute;

    int difference = minutes2 - minutes1;

    if (difference < 0) {
      difference += 24 * 60;
    }

    return difference;
  }

  static bool isTimeGreater(TimeOfDay time1, TimeOfDay time2) {
    // Convert TimeOfDay objects to minutes since midnight
    final minutes1 = (time1.hour * 60) + time1.minute;
    final minutes2 = (time2.hour * 60) + time2.minute;

    // Compare the minute values
    return minutes1 > minutes2;
  }
}