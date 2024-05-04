import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'select_neutral_mood.dart';

class SelectReason extends StatefulWidget {
  const SelectReason({super.key});

  @override
  State<SelectReason> createState() => _SelectReasonState();
}

class _SelectReasonState extends State<SelectReason> {
  List<String> selectedReasons = [];
  List<String> searchReasons = [];
  List<String> recentReasons = ['Work', 'Hobbies', 'Family', 'Breakup'];
  List<String> reasons = ['Work', 'Hobbies', 'Family', 'Breakup', 'Weather', 'Wife'];
  final TextEditingController _controller = TextEditingController();

  void searchReason(String query) {
    var suggestions = <String>[];
    if(query != '') {
      suggestions = reasons.where((mood) {
          final input = query.toLowerCase();
          return mood.toLowerCase().contains(input);
        }).toList();
    }
    setState(() {
      searchReasons = suggestions;
    });
  }
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
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(onPressed: () {
                  _controller.clear();
                  searchReason('');
                }, icon: Icon(Icons.clear)),
                contentPadding: EdgeInsets.all(15),
                hintText: 'Search reason',
                hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 8.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))
                  
                )
              ),
              onChanged: searchReason,
            ),
          ),
        const SizedBox(height: 10,),
        searchReasons.isEmpty ? const SizedBox(height: 0) : Container(
            height: 40,
            child: ListView.separated(
              itemCount: searchReasons.length,
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) {
                return SearchedItem(itemName: searchReasons[index], onChoose: () {
                  setState(() {
                    if(!selectedReasons.contains(searchReasons[index])) {
                      selectedReasons.add(searchReasons[index]);
                      _controller.clear();
                      searchReason('');
                    }
                  });
                });
              }),
          ),
        selectedReasons.isEmpty ? const SizedBox(height: 0) : Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Selected (${selectedReasons.length})', style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedReasons.clear();
                    });
                  },
                  child: Text('Clear all', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
                )
              ],
            ),
          ],
        ),
        selectedReasons.isEmpty ? const SizedBox(height: 0) : Container(
          height: 40,
          child: ListView.separated(
            itemCount: selectedReasons.length,
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemBuilder: (context, index) {
              return SelectedItem(itemName: selectedReasons[index], onCancel: () {
                setState(() {
                  selectedReasons.remove(selectedReasons[index]);
                });
              });
            }),
        ),
        const SizedBox(height: 10),
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
            return ReasonCell(
              reason: recentReasons[index],
              isPressed: selectedReasons.contains(recentReasons[index]),
              onPressed: () {
                setState(() {
                  if(!selectedReasons.contains(recentReasons[index])) {
                    selectedReasons.add(recentReasons[index]);
                  } else {
                    selectedReasons.remove(recentReasons[index]);
                  }
                });
              },
            );
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
            return ReasonCell(
              reason: reasons[index],
              isPressed: selectedReasons.contains(reasons[index]),
              onPressed: () {
                setState(() {
                  if(!selectedReasons.contains(reasons[index])) {
                    selectedReasons.add(reasons[index]);
                    if(!recentReasons.contains(reasons[index])) {
                      recentReasons.insert(0, reasons[index]);
                    }
                    if(recentReasons.length > 4) {
                      recentReasons.removeLast();
                    }
                  } else {
                    selectedReasons.remove(reasons[index]);
                  }
                });
              },
            );
          })
        ),
      ],
    );
  }
}

class ReasonCell extends StatelessWidget {
  final reason;
  final isPressed;
  final VoidCallback onPressed;
  const ReasonCell({super.key, required this.reason, required this.isPressed, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 20,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: isPressed ? Colors.white : Colors.transparent
        ),
        child: Text(reason),
      ),
    );
  }
}