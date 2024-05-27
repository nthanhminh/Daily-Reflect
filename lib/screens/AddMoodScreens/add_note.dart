import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daily_reflect/providers/mood_data.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodData>(
      builder: (context, data, child) {
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
              SizedBox(
                width: 400,
                height: 200,
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {
                    Provider.of<MoodData>(context, listen: false).updateNote(value);
                  },
                  maxLines: 9,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
    );
  }
}