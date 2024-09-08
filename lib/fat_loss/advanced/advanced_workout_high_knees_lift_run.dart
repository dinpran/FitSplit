import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/advanced/adanced_workout_lunges.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class AdvancedWorkoutHighKneesLiftRun extends StatefulWidget {
  const AdvancedWorkoutHighKneesLiftRun({Key? key}) : super(key: key);

  @override
  State<AdvancedWorkoutHighKneesLiftRun> createState() =>
      _AdvancedWorkoutHighKneesLiftRunState();
}

class _AdvancedWorkoutHighKneesLiftRunState
    extends State<AdvancedWorkoutHighKneesLiftRun> {
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
        title: Text("Advanced Workout High Knees Lift Run"),
        automaticallyImplyLeading: false,
        centerTitle: true,
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
                "Do 5 sets of 20 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Run in place while lifting your knees as high as possible.\n\2 - Keep your torso upright and your arms pumping.\n\3 - Aim for a quick pace and lift your knees to hip level or higher.\n\4 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdvancedWorkoutLunges()));
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
        "Do 5 sets of 20 repetitions. To perform advanced workout high knees lift run, run in place while lifting your knees as high as possible. Keep your torso upright and your arms pumping. Aim for a quick pace and lift your knees to hip level or higher.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
