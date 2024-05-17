import 'package:daily_reflect/providers/mood_data.dart';
import 'package:daily_reflect/screens/AddMoodScreens/add_note.dart';
import 'package:daily_reflect/screens/AddMoodScreens/select_neutral_mood.dart';
import 'package:daily_reflect/screens/AddMoodScreens/select_reason.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const angryIconUrl = 'assets/icons/angry.gif';
const sadIconUrl = 'assets/icons/disappointed.gif';
const neutralIconUrl = 'assets/icons/neutral.gif';
const smilingIconUrl = 'assets/icons/smile.gif';
const happyIconUrl = 'assets/icons/happy.gif';

class AddMood extends StatefulWidget {
  const AddMood({super.key});

  @override
  State<AddMood> createState() => _AddMoodState();
}

class _AddMoodState extends State<AddMood> {
  int step = 0;
  String mood = 'okay';
  List<String> neutralMoods = [];
  List<String> reasons = [];
  String note = '';

  Widget addMoodStep(int step) {
    if(step == 0) {
      return AddMoodStepOne();
    } else if(step == 1) {
      return AddMoodStepTwo();
    } else if(step == 2) {
      return SelectReason();
    }
    return AddNote();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 700,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(228, 240, 247, 1),
            Color.fromRGBO(224, 221, 248, 1),
            Colors.white,
          ]
        )
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ).createShader(Rect.fromLTRB(0, 400, rectangle.width, rectangle.height));
            },
            blendMode: BlendMode.dstIn,
            child: addMoodStep(step)
          ),
          Column(
            children: [
              TopBar(step: step, goBack: () {
                setState(() {
                  step--;
                });
              }),
              SizedBox(height: step < 3 ? 550 : 480),
              step < 3 ? ContinueButton(onPressed: () {setState(() {
                step++;
              });},) : Consumer<MoodData>(
                builder: (context, data, child) {
                  return SaveButton(onSave: () {
                    Provider.of<MoodData>(context, listen: false).saveData();
                  }, onSkip: () {

                  });
                },
              )
            ],
          ),
        ],
      )
    );
  }
}
class AddMoodStepOne extends StatelessWidget {
  AddMoodStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        const Text(
          'What\'s your mood now?',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )
        ),
        const SizedBox(height: 20),
        const Text(
          'Select mood that reflects the most how you are '
        ),
        const Text(
          'feeling at this moment'
        ),
        const SizedBox(height: 180),
        moodList(),
        const SizedBox(height: 180),
      ],
    );
  }

  Widget moodList() {
    return Consumer<MoodData>(
      builder: (context, moodData, child) {
        String todayMood = moodData.todayMood;   
        var moodDataProvider = Provider.of<MoodData>(context, listen: false);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconCell(iconUrl: angryIconUrl, isPressed: todayMood == 'angry', onPressed: () {
              moodDataProvider.updateTodayMood('angry');
            },),
            IconCell(iconUrl: sadIconUrl, isPressed: todayMood == 'sad', onPressed: () {
              moodDataProvider.updateTodayMood('sad');
            },),
            IconCell(iconUrl: neutralIconUrl, isPressed: todayMood == 'neutral', onPressed: () {
              moodDataProvider.updateTodayMood('neutral');
            },),
            IconCell(iconUrl: smilingIconUrl, isPressed: todayMood == 'okay', onPressed: () {
              moodDataProvider.updateTodayMood('okay');
            },),
            IconCell(iconUrl: happyIconUrl, isPressed: todayMood == 'happy', onPressed: () {
              moodDataProvider.updateTodayMood('happy');
            },),
          ],
        );
      }
    );
  }
}

class IconCell extends StatelessWidget {
  final String iconUrl;
  final bool isPressed;
  final Function()? onPressed;
  const IconCell({super.key, required this.iconUrl, required this.isPressed, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: isPressed ? Color.fromARGB(255, 251, 194, 103) : Colors.transparent,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child: Image.asset(iconUrl, height: 40, width: 40,),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  final step;
  final VoidCallback goBack;
  TopBar({super.key, required this.step, required this.goBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(228, 240, 247, 1),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "${step + 1}/4",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              step == 0 ? calendarBox() : TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  iconColor: MaterialStateColor.resolveWith((states) => Colors.black),
                ),
                onPressed: goBack,
                child: Icon(Icons.arrow_back)
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                ),
                child: Icon(Icons.close, color: Colors.black,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget calendarBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25))
      ),
      child: const Row(
        children: [
          // Current day
          Text(
            'Sun, 4 Jun  ',
            style: TextStyle(
              fontSize: 13
            )
          ),
          Icon(Icons.calendar_month_rounded)
        ],
      )
    );
  }
}

class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ContinueButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(360, 60),
        backgroundColor: Color.fromRGBO(139, 76, 252, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))
        )
      ),
      child: const Text('Continue', style: TextStyle(color: Colors.white, fontSize: 20),),
    );
  }
}

class SaveButton extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onSkip;
  const SaveButton({super.key, required this.onSave, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onSave, 
          style: ElevatedButton.styleFrom(
            minimumSize: Size(360, 60),
            backgroundColor: Color.fromRGBO(139, 76, 252, 1),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))
            )
          ),
          child: const Text('Save', style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
        TextButton(
          onPressed: onSave, 
          style: ElevatedButton.styleFrom(
            minimumSize: Size(360, 60),
            foregroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))
            )
          ),
          child: const Text('Skip and save', style: TextStyle(color: Color.fromRGBO(139, 76, 252, 1), fontSize: 20),),
        )
      ],
    );
  }
}