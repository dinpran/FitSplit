import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/advanced/advanced_workout_reverse_lunges.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class AdvancedWorkoutSpiderPlanks extends StatefulWidget {
  const AdvancedWorkoutSpiderPlanks({Key? key}) : super(key: key);

  @override
  State<AdvancedWorkoutSpiderPlanks> createState() =>
      _AdvancedWorkoutSpiderPlanksState();
}

class _AdvancedWorkoutSpiderPlanksState
    extends State<AdvancedWorkoutSpiderPlanks> {
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
        title: Text("Advanced Workout Spider Planks"),
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
                child: VideoPlayerWidget(videoUrl: "assets/spider_planks.mp4"),
              ),
              Text(
                "Do 5 sets of 20 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a high plank position with your hands shoulder-width apart and your body forming a straight line from head to heels.\n\2 - Lift your right foot off the floor and bring your right knee towards your right elbow.\n\3 - Return to the starting position and repeat with your left leg.\n4 - Continue alternating legs for the prescribed number of repetitions.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdvancedWorkoutReverseLunges()));
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
        "Do 5 sets of 20 repetitions. To perform advanced workout spider planks, start in a high plank position with your hands shoulder-width apart and your body forming a straight line from head to heels. Lift your right foot off the floor and bring your right knee towards your right elbow. Return to the starting position and repeat with your left leg. Continue alternating legs for the prescribed number of repetitions.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
