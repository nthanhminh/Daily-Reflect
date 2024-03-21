class Mood {
  List<String>? _feelings;
  List<String>? _causes;
  String? _note;
  String? _time;
  int? _moodId;

  Mood({required feelings, required causes, required note, required time, required moodId}) {
    _feelings = feelings;
    _causes = causes;
    _note = note;
    _time = time;
    _moodId = moodId;
  }

  int? get moodId => _moodId;

  String? get time => _time;

  String? get note => _note;

  List<String>? get causes => _causes;

  List<String>? get feelings => _feelings;
}