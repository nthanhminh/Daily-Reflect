import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMoodStepTwo extends StatefulWidget {
  const AddMoodStepTwo({super.key});

  @override
  State<AddMoodStepTwo> createState() => _AddMoodStepTwoState();
}

class _AddMoodStepTwoState extends State<AddMoodStepTwo> {
  int recentMoodIndex = -1;
  int allMoodIndex = -1;
  List<String> moods = ['Aww', 'Happy', 'Confused', 'Excited', 'Cool', 'Surprised', 'Peaceful', 'Stressed'];
  List<String> recentMoods = ['Confused', 'Excited', 'Cool', 'Surprised', 'Peaceful', 'Amazed'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Text(
            'Choose the emotion that',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )
          ),
          const Text(
            'make you feel neutral',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )
          ),
          const SizedBox(height: 10),
          const Text(
            'Select at least 1 emotion'
          ),
          const SizedBox(height: 20,),
          SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              hintText: 'Search emotion',
              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white), 
              elevation: MaterialStateProperty.all(0.0),
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(moods.length, (index) {
              return ListTile(
                title: Text(moods[index]),
                onTap: () {setState(() {
                  controller.closeView(moods[index]);
                });}
              );
            });
          }),
          Container(
            padding: EdgeInsets.only(top: 20),
            width: double.infinity,
            child: Text('Recently used', style: TextStyle(fontWeight: FontWeight.bold),),
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
                isPressed: recentMoodIndex == index,
                onPressed: () {
                  setState(() {
                    allMoodIndex = -1;
                    recentMoodIndex = index;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: Text('All emotions', style: TextStyle(fontWeight: FontWeight.bold)),
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
                isPressed: allMoodIndex == index,
                onPressed: () {
                  setState(() {
                    allMoodIndex = index;
                    recentMoodIndex = -1;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class Emoji extends StatelessWidget {
  final String iconName;
  late String iconUrl = 'assets/icons/' + iconName.toLowerCase() + '.gif';
  final bool isPressed;
  void Function()? onPressed;
  Emoji({super.key, required this.iconName, required this.isPressed, required this.onPressed});

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
              borderRadius: BorderRadius.circular(50)
            ),
            child: Center(
              child: Image.asset(iconUrl, height: 40, width: 40,),
            ),
          ),
        ),
        Text(iconName)
      ],
    );
  }
}