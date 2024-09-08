import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/intermediate/intermeidate_workout_high_knees_lift_run.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class IntermediateWorkoutSpiderPlanks extends StatefulWidget {
  const IntermediateWorkoutSpiderPlanks({Key? key}) : super(key: key);

  @override
  State<IntermediateWorkoutSpiderPlanks> createState() =>
      _IntermediateWorkoutSpiderPlanksState();
}

class _IntermediateWorkoutSpiderPlanksState
    extends State<IntermediateWorkoutSpiderPlanks> {
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
        title: Text("Intermediate Workout Spider Planks"),
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
                "Do 4 X 15 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a high plank position with your hands directly under your shoulders and your body forming a straight line from head to heels.\n\2 - Lift your right foot off the ground and bring your right knee towards your right elbow.\n\3 - Return your right leg to the starting position and repeat on the left side.\n4 - Continue alternating legs, moving as quickly as possible while maintaining good form.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => IntermediateWorkoutHighKnees()));
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
        "Do 4 sets of 15 repetitions. To perform intermediate workout spider planks, start in a high plank position with your hands directly under your shoulders and your body forming a straight line from head to heels. Lift your right foot off the ground and bring your right knee towards your right elbow. Return your right leg to the starting position and repeat on the left side. Continue alternating legs, moving as quickly as possible while maintaining good form.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
