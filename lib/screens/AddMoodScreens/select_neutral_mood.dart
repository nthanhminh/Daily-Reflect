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
      crossAxisAlignment: CrossAxisAlignment.center,
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
        const SizedBox(height: 20),
        const Text(
          'Select at least 1 emotion'
        ),
        const SizedBox(height: 400),
      ],
    );
  }
}