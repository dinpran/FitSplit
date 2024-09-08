import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/beginners/strength_beginners_spider_planks.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthBeginnersLunges extends StatefulWidget {
  const StrengthBeginnersLunges({Key? key}) : super(key: key);

  @override
  State<StrengthBeginnersLunges> createState() =>
      _StrengthBeginnersLungesState();
}

class _StrengthBeginnersLungesState extends State<StrengthBeginnersLunges> {
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
        title: Text("Strength Beginners Lunges"),
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
                child: VideoPlayerWidget(videoUrl: "assets/lunges.mp4"),
              ),
              Text(
                "Do 3 sets of 12 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet hip-width apart and your hands on your hips.\n\2 - Take a big step forward with your right leg and lower your body until both knees are bent at a 90-degree angle.\n\3 - Keep your chest up and your spine straight.\n4 - Push back up to the starting position and repeat with the other leg.\n\5 - Take Rest for 1 minute after each set.",
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
        "Do 3 sets of 12 repetitions. To perform lunges for strength beginners, stand with your feet hip-width apart and your hands on your hips. Take a big step forward with your right leg and lower your body until both knees are bent at a 90-degree angle. Keep your chest up and your spine straight. Push back up to the starting position and repeat with the other leg.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
