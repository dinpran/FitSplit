import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/advanced/advanced_cross_body_mountain_climbers.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class AdvancedSpiderPlanks extends StatefulWidget {
  const AdvancedSpiderPlanks({Key? key}) : super(key: key);

  @override
  State<AdvancedSpiderPlanks> createState() => _AdvancedSpiderPlanksState();
}

class _AdvancedSpiderPlanksState extends State<AdvancedSpiderPlanks> {
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
        title: Text("Advanced Spider Planks"),
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
                "Do 5 X 30 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a high plank position with your hands directly under your shoulders.\n\2 - Lift your right foot off the ground and bring your right knee towards your right elbow as you lower your hips.\n\3 - Return to the starting position and repeat on the left side.\n\4 - Continue alternating sides for the specified number of reps.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            AdvancedCrossBodyMountainClimbers()));
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
        "Do 5 sets of 30 repetitions. To perform advanced spider planks, start in a high plank position with your hands directly under your shoulders. Lift your right foot off the ground and bring your right knee towards your right elbow as you lower your hips. Return to the starting position and repeat on the left side. Continue alternating sides for the specified number of reps.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
