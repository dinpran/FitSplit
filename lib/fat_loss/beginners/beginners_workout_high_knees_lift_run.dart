import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/fat_loss_home.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class BeginnersWorkoutHighKneesLiftRun extends StatefulWidget {
  const BeginnersWorkoutHighKneesLiftRun({Key? key}) : super(key: key);

  @override
  State<BeginnersWorkoutHighKneesLiftRun> createState() =>
      _BeginnersWorkoutHighKneesLiftRunState();
}

class _BeginnersWorkoutHighKneesLiftRunState
    extends State<BeginnersWorkoutHighKneesLiftRun> {
  late FlutterTts flutterTts;
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _speakInstructions(); // Start TTS automatically when the screen is opened
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
        title: Text("Beginners Workout High Knees Lift Run"),
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
                child: VideoPlayerWidget(
                    videoUrl: "assets/High_knees_lift_run.mp4"),
              ),
              Text(
                "Do 3 X 12 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet hip-width apart and your arms by your sides.\n\2 - Quickly drive one knee up toward your chest as high as you can while hopping slightly off the ground with the other foot.\n\3 - Alternate legs in a running motion, moving your arms in opposition to your legs.\n4 - Repeat for the specified number of repetitions.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FatLossHome()));
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
        "Do 3 sets of 12 repetitions. To perform beginners workout high knees lift run, stand with your feet hip-width apart and your arms by your sides. Quickly drive one knee up toward your chest as high as you can while hopping slightly off the ground with the other foot. Alternate legs in a running motion, moving your arms in opposition to your legs. Repeat for the specified number of repetitions.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
