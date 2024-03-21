import 'package:flutter/material.dart';

class AddMoodStepTwo extends StatefulWidget {
  const AddMoodStepTwo({super.key});

  @override
  State<AddMoodStepTwo> createState() => _AddMoodStepTwoState();
}

class _AddMoodStepTwoState extends State<AddMoodStepTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topBar(),
        const SizedBox(height: 10),
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
        const SizedBox(height: 20),
        const Text(
          'Select at least 1 emotion'
        ),
        const SizedBox(height: 400),
      ],
    );
  }

  Widget topBar() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: const Text(
              '2/4',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.arrow_back)
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              child: TextButton(
                child: Icon(Icons.close, color: Colors.black,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ),
          ],
        )
      ],
    );
  }
}