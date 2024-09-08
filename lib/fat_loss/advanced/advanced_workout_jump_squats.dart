import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/advanced/advanced_workout_spider_planks.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class AdvancedWorkoutJumpSquats extends StatefulWidget {
  const AdvancedWorkoutJumpSquats({Key? key}) : super(key: key);

  @override
  State<AdvancedWorkoutJumpSquats> createState() =>
      _AdvancedWorkoutJumpSquatsState();
}

class _AdvancedWorkoutJumpSquatsState extends State<AdvancedWorkoutJumpSquats> {
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
        title: Text("Advanced Workout Jump Squats"),
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
                child: VideoPlayerWidget(videoUrl: "assets/jump_squats.mp4"),
              ),
              Text(
                "Do 5 sets of 20 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet shoulder-width apart and your arms at your sides.\n\2 - Lower into a squat position by bending your knees and pushing your hips back.\n\3 - Explosively jump up, extending your legs fully while reaching your arms overhead.\n4 - Land softly back into the squat position and repeat.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdvancedWorkoutSpiderPlanks()));
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
        "Do 5 sets of 20 repetitions. To perform advanced workout jump squats, stand with your feet shoulder-width apart and your arms at your sides. Lower into a squat position by bending your knees and pushing your hips back. Explosively jump up, extending your legs fully while reaching your arms overhead. Land softly back into the squat position and repeat.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
