import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/beginners/strength_beginners_glute_bridges.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthBeginnersSpiderPlanks extends StatefulWidget {
  const StrengthBeginnersSpiderPlanks({Key? key}) : super(key: key);

  @override
  State<StrengthBeginnersSpiderPlanks> createState() =>
      _StrengthBeginnersSpiderPlanksState();
}

class _StrengthBeginnersSpiderPlanksState
    extends State<StrengthBeginnersSpiderPlanks> {
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
        title: Text("Strength Beginners Spider Planks"),
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
                child: VideoPlayerWidget(videoUrl: "assets/spider_planks.mp4"),
              ),
              Text(
                "Do 3 sets of 12 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a high plank position with your hands directly under your shoulders and your body in a straight line from head to heels.\n\2 - Lift your right foot off the ground and bring your right knee towards your right elbow, engaging your core.\n\3 - Return to the starting position and repeat with the left side.\n4 - Continue alternating sides for the prescribed number of reps.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StrengthBeginnersGluteBridges()));
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
        "Do 3 sets of 12 repetitions. To perform spider planks for strength beginners, start in a high plank position with your hands directly under your shoulders and your body in a straight line from head to heels. Lift your right foot off the ground and bring your right knee towards your right elbow, engaging your core. Return to the starting position and repeat with the left side. Continue alternating sides for the prescribed number of reps.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
