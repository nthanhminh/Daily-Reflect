import 'package:flutter/material.dart';

const angryIconUrl = 'assets/icons/angry.gif';
const sadIconUrl = 'assets/icons/disappointed.gif';
const neutralIconUrl = 'assets/icons/neutral.gif';
const smilingIconUrl = 'assets/icons/smile.gif';
const happyIconUrl = 'assets/icons/happy.gif';

class AddMoodStepOne extends StatefulWidget {
  const AddMoodStepOne({super.key});

  @override
  State<AddMoodStepOne> createState() => _AddMoodStepOneState();
}

class _AddMoodStepOneState extends State<AddMoodStepOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 800,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(228, 240, 247, 1),
            Color.fromRGBO(239, 237, 252, 1),
            Colors.white,
          ]
        )
      ),
      child: Column(
        children: [
          topBar(),
          const SizedBox(height: 30),
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
          ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(360, 60),
              backgroundColor: Color.fromRGBO(139, 76, 252, 1),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))
              )
            ),
            child: const Text('Continue', style: TextStyle(color: Colors.white, fontSize: 20),),
          ),
        ],
      )
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
                    '1/4',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
  Widget moodList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(angryIconUrl, height: 40, width: 40,),
        Image.asset(sadIconUrl, height: 40, width: 40,),
        Image.asset(neutralIconUrl, height: 40, width: 40,),
        Image.asset(smilingIconUrl, height: 40, width: 40,),
        Image.asset(happyIconUrl, height: 40, width: 40,)
      ],
    );
  }
}

// class IconCell extends StatelessWidget {
//   final String iconUrl;
//   final bool isPressed;
//   void Function()? onPressed;
//   IconCell({super.key, required this.iconUrl, required this.isPressed, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: isPressed ? Colors.yellow : Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(50.0))
//       ),
//       child: GestureDetector(
//         onTap: onPressed,
//         child: Image.network(iconUrl)
//       )
//     );
//   }
// }