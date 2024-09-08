import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/beginners/beginners_workout_high_knees_lift_run.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class BeginnersWorkoutMountainClimbers extends StatefulWidget {
  const BeginnersWorkoutMountainClimbers({Key? key}) : super(key: key);

  @override
  State<BeginnersWorkoutMountainClimbers> createState() =>
      _BeginnersWorkoutMountainClimbersState();
}

class _BeginnersWorkoutMountainClimbersState
    extends State<BeginnersWorkoutMountainClimbers> {
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
        title: Text("Beginners Workout Mountain Climbers"),
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
                "Do 3 X 12 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a plank position with your hands directly under your shoulders and your body in a straight line from head to heels.\n\2 - Engage your core and bring one knee towards your chest, then quickly switch legs, bringing the other knee towards your chest while extending the opposite leg back.\n\3 - Continue alternating legs as if you're running in place.\n4 - Repeat for the specified number of repetitions.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            BeginnersWorkoutHighKneesLiftRun()));
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
        "Do 3 sets of 12 repetitions. To perform beginners workout mountain climbers, start in a plank position with your hands directly under your shoulders and your body in a straight line from head to heels. Engage your core and bring one knee towards your chest, then quickly switch legs, bringing the other knee towards your chest while extending the opposite leg back. Continue alternating legs as if you're running in place. Repeat for the specified number of repetitions.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
