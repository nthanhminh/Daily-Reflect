import 'package:flutter/material.dart';
import 'dart:convert';

class MoodData extends ChangeNotifier {
  String todayMood = 'neutral';

  List<String> selectedNeutralMoods = [];
  List<String> recentNeutralMoods = [
    'Confused',
    'Excited',
    'Cool',
    'Surprised'
  ];
  List<String> selectedReasons = [];
  List<String> recentReasons = ['Work', 'Hobbies', 'Family', 'Breakup'];
  String note = '';
  void updateTodayMood(String value) {
    todayMood = value;
    notifyListeners();
  }

  void addNeutralMood(String value) {
    selectedNeutralMoods.add(value);
    notifyListeners();
  }

  void removeNeutralMood(String value) {
    selectedNeutralMoods.remove(value);
    notifyListeners();
  }

  void addRecentNeutralMood(String value) {
    recentNeutralMoods.insert(0, value);
    notifyListeners();
  }

  void removeRecentNeutralMood() {
    recentNeutralMoods.removeLast();
    notifyListeners();
  }

  void removeSpecificRecentNeutralMood(String value) {
    recentNeutralMoods.remove(value);
    notifyListeners();
  }

  void clearSelectedNeutralMoods() {
    selectedNeutralMoods.clear();
    notifyListeners();
  }

  void addSelectedReasons(String value) {
    selectedReasons.add(value);
    notifyListeners();
  }

  void removeSelectedReasons(String value) {
    selectedReasons.remove(value);
    notifyListeners();
  }

  void clearSelectedReasons() {
    selectedReasons.clear();
    notifyListeners();
  }

  void addRecentReason(String value) {
    recentReasons.insert(0, value);
    notifyListeners();
  }

  void removeRecentReason() {
    recentReasons.removeLast();
    notifyListeners();
  }

  void updateNote(String value) {
    note = value;
    notifyListeners();
  }

  Future<void> saveData() async {
    Map<String, dynamic> jsonData = {
      'todayMood': todayMood,
      'neutralMoods': selectedNeutralMoods,
      'reasons': selectedReasons,
      'note': note,
    };

    // Convert JSON map to a JSON string
    String jsonString = jsonEncode(jsonData);

    print('Got the data: $jsonString');
  }
}
