import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          const SizedBox(height: 60),
          const Text(
            'Anything you want to add',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )
          ),
          const SizedBox(height: 10),
          const Text(
            'Add your notes on any thought that reflating your mood'
          ),
          const SizedBox(height: 30,),
          const SizedBox(
            width: 400,
            height: 260,
            child: TextField(
              maxLines: 9,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: const BorderSide(color: Colors.white, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: const BorderSide(color: Colors.white, width: 0.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: const BorderSide(color: Colors.white, width: 0.0),
                )
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {}, 
            style: ElevatedButton.styleFrom(
              maximumSize: Size(240, 60),
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))
              )
            ),
            child: Center(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.mic, color: Colors.white)
                  ),
                  SizedBox(width: 20,),
                  Text('Record voice note', style: TextStyle(color: Colors.black, fontSize: 15)),
                ],
              ),
            )
          )
      ],
    );
  }
}