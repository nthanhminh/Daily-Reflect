import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectReason extends StatefulWidget {
  const SelectReason({super.key});

  @override
  State<SelectReason> createState() => _SelectReasonState();
}

class _SelectReasonState extends State<SelectReason> {
  List<String> recentReasons = ['Work', 'Hobbies', 'Family', 'Breakup'];
  List<String> reasons = ['Work', 'Hobbies', 'Family', 'Breakup', 'Weather', 'Wife'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        const Text(
          'What\'s reason making you',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        const Text(
            'feel this way?',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )
          ),
        const SizedBox(height: 10),
        const Text('Select reasons that reflated your emotions'),
        const SizedBox(height: 20),
        SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            hintText: 'Search reason',
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
          return List<ListTile>.generate(reasons.length, (index) {
            return ListTile(
              title: Text(reasons[index]),
              onTap: () {setState(() {
                controller.closeView(reasons[index]);
              });}
            );
          });
        }),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          child: Text('Recently used', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        GridView.count(crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2/1,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: List<ReasonCell>.generate(recentReasons.length, (index) {
            return ReasonCell(reason: recentReasons[index]);
          })
        ),
        const SizedBox(height: 10),
                Container(
          width: double.infinity,
          child: Text('All reasons', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        GridView.count(crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2/1,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: List<ReasonCell>.generate(reasons.length, (index) {
            return ReasonCell(reason: reasons[index]);
          })
        ),
      ],
    );
  }
}

class ReasonCell extends StatelessWidget {
  final reason;
  const ReasonCell({super.key, required this.reason});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.transparent
      ),
      child: Text(reason),
    );
  }
}