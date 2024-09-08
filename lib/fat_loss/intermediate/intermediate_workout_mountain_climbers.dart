import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/intermediate/intermediate_workour_spider_planks.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/full_body/intermediate/intermediate_spider_planks.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class IntermediateWorkoutMountainClimbers extends StatefulWidget {
  const IntermediateWorkoutMountainClimbers({Key? key}) : super(key: key);

  @override
  State<IntermediateWorkoutMountainClimbers> createState() =>
      _IntermediateWorkoutMountainClimbersState();
}

class _IntermediateWorkoutMountainClimbersState
    extends State<IntermediateWorkoutMountainClimbers> {
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
        title: Text("Intermediate Workout Mountain Climbers"),
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
                    VideoPlayerWidget(videoUrl: "assets/mountain_climbers.mp4"),
              ),
              Text(
                "Do 4 X 20 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a plank position with your hands directly under your shoulders.\n\2 - Drive one knee towards your chest, then quickly switch legs, bringing the other knee towards your chest.\n\3 - Continue alternating legs as if you're running in place, keeping your core engaged and your body in a straight line.\n4 - Repeat the movement for the prescribed number of reps.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            IntermediateWorkoutSpiderPlanks()));
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
        "Do 4 sets of 20 repetitions. To perform intermediate workout mountain climbers, start in a plank position with your hands directly under your shoulders. Drive one knee towards your chest, then quickly switch legs, bringing the other knee towards your chest. Continue alternating legs as if you're running in place, keeping your core engaged and your body in a straight line. Repeat the movement for the prescribed number of reps.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
