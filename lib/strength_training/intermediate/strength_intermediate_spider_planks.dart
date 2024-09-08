import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/intermediate/strength_intermediate_tricep_dips.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthIntermediateSpiderPlanks extends StatefulWidget {
  const StrengthIntermediateSpiderPlanks({Key? key}) : super(key: key);

  @override
  State<StrengthIntermediateSpiderPlanks> createState() =>
      _StrengthIntermediateSpiderPlanksState();
}

class _StrengthIntermediateSpiderPlanksState
    extends State<StrengthIntermediateSpiderPlanks> {
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
        title: Text("Strength Intermediate Spider Planks"),
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
                "Do 4 sets of 15 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a traditional plank position with your hands directly under your shoulders and your body in a straight line from head to heels.\n\2 - Bring your right knee toward your right elbow, then return to the starting position.\n\3 - Repeat on the left side, bringing your left knee toward your left elbow.\n4 - Continue alternating sides for the desired number of reps.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            StrengthIntermediateTricepDips()));
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
        "Do 4 sets of 15 repetitions. To perform spider planks for intermediate strength training, start in a traditional plank position with your hands directly under your shoulders and your body in a straight line from head to heels. Bring your right knee toward your right elbow, then return to the starting position. Repeat on the left side, bringing your left knee toward your left elbow. Continue alternating sides for the desired number of reps.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
