import 'package:daily_reflect/providers/mood_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMoodStepTwo extends StatefulWidget {
  const AddMoodStepTwo({super.key});

  @override
  State<AddMoodStepTwo> createState() => _AddMoodStepTwoState();
}

class _AddMoodStepTwoState extends State<AddMoodStepTwo> {
  List<String> searchMoods = [];
  final List<String> moods = [
    'Aww',
    'Happy',
    'Confused',
    'Excited',
    'Cool',
    'Surprised',
    'Peaceful',
    'Stressed'
  ];
  final TextEditingController _controller = TextEditingController();

  void searchMood(String query) {
    var suggestions = <String>[];
    if (query != '') {
      suggestions = moods.where((mood) {
        final input = query.toLowerCase();
        return mood.toLowerCase().contains(input);
      }).toList();
    }

    setState(() {
      searchMoods = suggestions;
      print(searchMoods);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodData>(
      builder: (context, data, child) {
        var dataProvider = Provider.of<MoodData>(context, listen: false);
        List<String> selectedMoods = data.selectedNeutralMoods;
        List<String> recentMoods = data.recentNeutralMoods;
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text('Choose the emotion that',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              const Text('make you feel neutral',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 10),
              const Text('Select at least 1 emotion'),
              const SizedBox(
                height: 20,
              ),

              // search textfield
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _controller.clear();
                            searchMood('');
                          },
                          icon: Icon(Icons.clear)),
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Search neutral mood',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 8.0,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                  onChanged: searchMood,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // suggested moods
              searchMoods.isEmpty
                  ? const SizedBox(height: 0)
                  : Container(
                      height: 40,
                      child: ListView.separated(
                          itemCount: searchMoods.length,
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            return SearchedItem(
                                itemName: searchMoods[index],
                                onChoose: () {
                                  if (!selectedMoods
                                      .contains(searchMoods[index])) {
                                    dataProvider
                                        .addNeutralMood(searchMoods[index]);
                                    if (!recentMoods
                                        .contains(searchMoods[index])) {
                                      dataProvider.addRecentNeutralMood(
                                          searchMoods[index]);
                                      if (recentMoods.length > 4) {
                                        dataProvider.removeRecentNeutralMood();
                                      }
                                    } else {
                                      dataProvider
                                          .removeSpecificRecentNeutralMood(
                                              searchMoods[index]);
                                      dataProvider.addRecentNeutralMood(
                                          searchMoods[index]);
                                    }
                                    _controller.clear();
                                    searchMood('');
                                  }
                                });
                          }),
                    ),

              // selected mood line
              selectedMoods.isEmpty
                  ? const SizedBox(height: 0)
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Selected (${selectedMoods.length})',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextButton(
                                onPressed: () {
                                  dataProvider.clearSelectedNeutralMoods();
                                },
                                child: Text('Clear all',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)))
                          ],
                        ),
                      ],
                    ),
              selectedMoods.isEmpty
                  ? const SizedBox(height: 0)
                  : Container(
                      height: 40,
                      child: ListView.separated(
                          itemCount: selectedMoods.length,
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            return SelectedItem(
                                itemName: selectedMoods[index],
                                onCancel: () {
                                  dataProvider
                                      .removeNeutralMood(selectedMoods[index]);
                                });
                          }),
                    ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Recently used',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List<Emoji>.generate(recentMoods.length, (index) {
                  return Emoji(
                    iconName: recentMoods[index],
                    isPressed: selectedMoods.contains(recentMoods[index]),
                    onPressed: () {
                      if (!selectedMoods.contains(recentMoods[index])) {
                        dataProvider.addNeutralMood(recentMoods[index]);
                      } else {
                        dataProvider.removeNeutralMood(recentMoods[index]);
                      }
                    },
                  );
                }),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Text('All emotions',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List<Emoji>.generate(moods.length, (index) {
                  return Emoji(
                    iconName: moods[index],
                    isPressed: selectedMoods.contains(moods[index]),
                    onPressed: () {
                      if (!selectedMoods.contains(moods[index])) {
                        dataProvider.addNeutralMood(moods[index]);
                        if (!recentMoods.contains(moods[index])) {
                          dataProvider.addRecentNeutralMood(moods[index]);
                          if (recentMoods.length > 4) {
                            dataProvider.removeRecentNeutralMood();
                          }
                        } else {
                          dataProvider
                              .removeSpecificRecentNeutralMood(moods[index]);
                          dataProvider.addRecentNeutralMood(moods[index]);
                        }
                      } else {
                        dataProvider.removeNeutralMood(moods[index]);
                      }
                    },
                  );
                }),
              ),
              const SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }
}

class Emoji extends StatelessWidget {
  final String iconName;
  final bool isPressed;
  final Function()? onPressed;
  Emoji(
      {super.key,
      required this.iconName,
      required this.isPressed,
      required this.onPressed});

  late final String iconUrl = 'assets/icons/' + iconName.toLowerCase() + '.gif';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: isPressed ? Colors.white : Color.fromARGB(15, 0, 0, 0),
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Image.asset(
                iconUrl,
                height: 40,
                width: 40,
              ),
            ),
          ),
        ),
        Text(iconName, style: TextStyle(fontSize: 12))
      ],
    );
  }
}

class SelectedItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onCancel;
  const SelectedItem(
      {super.key, required this.itemName, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(itemName, style: TextStyle(fontSize: 14)),
        TextButton(
            onPressed: onCancel,
            child: Icon(Icons.close, size: 15, color: Colors.black))
      ]),
    );
  }
}

class SearchedItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onChoose;
  const SearchedItem(
      {super.key, required this.itemName, required this.onChoose});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(children: [
        GestureDetector(
          child: Text(itemName, style: TextStyle(fontSize: 14)),
          onTap: onChoose,
        ),
      ]),
    );
  }
}
