import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/beginners/strength_beginners_spider_planks.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthIntermediateLunges extends StatefulWidget {
  const StrengthIntermediateLunges({Key? key}) : super(key: key);

  @override
  State<StrengthIntermediateLunges> createState() =>
      _StrengthIntermediateLungesState();
}

class _StrengthIntermediateLungesState
    extends State<StrengthIntermediateLunges> {
  late FlutterTts flutterTts;
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _speakInstructions(); // Call the TTS function when the screen loads
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Strength Intermediate Lunges"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(35)),
                child:
                    VideoPlayerWidget(videoUrl: "assets/weighted_lunges.mp4"),
              ),
              Text(
                "Do 4 sets of 12 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet shoulder-width apart, holding a dumbbell in each hand.\n\2 - Take a large step forward with one leg and lower your body until both knees are bent at a 90-degree angle.\n\3 - Keep your torso upright and your back knee just above the ground.\n4 - Push through your front heel to return to the starting position and repeat on the other side.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StrengthBeginnersSpiderPlanks()));
                  },
                  child: Icon(Icons.arrow_right),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _speakInstructions() async {
    String instructions =
        "Do 4 sets of 12 repetitions. To perform lunges with dumbbells for intermediate strength training, stand with your feet shoulder-width apart, holding a dumbbell in each hand. Take a large step forward with one leg and lower your body until both knees are bent at a 90-degree angle. Keep your torso upright and your back knee just above the ground. Push through your front heel to return to the starting position and repeat on the other side.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
