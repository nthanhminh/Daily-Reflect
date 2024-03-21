class MoodOfDay {
  late final int dayOfWeek;
  late final int dayOfMonth;
  late final int? moodId;
  late final bool isToday;

  MoodOfDay({ required this.dayOfMonth, required this.moodId, required this.dayOfWeek, required this.isToday});
}