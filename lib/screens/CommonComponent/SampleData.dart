import '../../models/Mood.dart';
import '../../models/WeekOfArticles.dart';

class SampleData {
  static List<Mood> moods = [
  Mood (
  time: '1:00',
  feelings: ['I want to set the world on fire'],
  causes: ['No apparent reason'],
  note:
  'Ảo ma canada mafia Argentina Malaysia California Australia Austria Venezuela Romania Lazada Sri Lanka Sakura Haibara Edogawa Conan Naruto Nami Roronoa Zoro Sanji Kaido Shanks nhảy chachacha Chaien đấm Nobita và làm Shizuka nhòe đi Mascara',
  moodId: 4),
  Mood (
  time: '2:00',
  feelings: ['I want to set the world on fire'],
  causes: ['No apparent reason'],
  note:
  'Ảo ma canada mafia Argentina Malaysia California Australia Austria Venezuela Romania Lazada Sri Lanka Sakura Haibara Edogawa Conan Naruto Nami Roronoa Zoro Sanji Kaido Shanks nhảy chachacha Chaien đấm Nobita và làm Shizuka nhòe đi Mascara',
  moodId: 0),
    Mood (
        time: '3:00',
        feelings: ['I want to set the world on fire'],
        causes: ['No apparent reason'],
        note:
        'Ảo ma canada mafia Argentina Malaysia California Australia Austria Venezuela Romania Lazada Sri Lanka Sakura Haibara Edogawa Conan Naruto Nami Roronoa Zoro Sanji Kaido Shanks nhảy chachacha Chaien đấm Nobita và làm Shizuka nhòe đi Mascara',
        moodId: 2),
    Mood (
        time: '4:00',
        feelings: ['I want to set the world on fire'],
        causes: ['No apparent reason'],
        note:
        'Ảo ma canada mafia Argentina Malaysia California Australia Austria Venezuela Romania Lazada Sri Lanka Sakura Haibara Edogawa Conan Naruto Nami Roronoa Zoro Sanji Kaido Shanks nhảy chachacha Chaien đấm Nobita và làm Shizuka nhòe đi Mascara',
        moodId: 3),
    Mood (
        time: '5:00',
        feelings: ['I want to set the world on fire'],
        causes: ['No apparent reason'],
        note:
        'Ảo ma canada mafia Argentina Malaysia California Australia Austria Venezuela Romania Lazada Sri Lanka Sakura Haibara Edogawa Conan Naruto Nami Roronoa Zoro Sanji Kaido Shanks nhảy chachacha Chaien đấm Nobita và làm Shizuka nhòe đi Mascara',
        moodId: 4),
  ];

  static List<WeekOfArticles> weeksOfMoods = [
    WeekOfArticles(moodsForTheWeek: moods, weekTime: 'Eternity'),
  WeekOfArticles(moodsForTheWeek: moods, weekTime: 'Aeons')
  ];
}