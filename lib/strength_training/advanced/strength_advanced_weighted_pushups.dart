import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/advanced/strength_advanced_romanian_deadlifts.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthAdvancedWeightedPushups extends StatefulWidget {
  const StrengthAdvancedWeightedPushups({Key? key}) : super(key: key);

  @override
  State<StrengthAdvancedWeightedPushups> createState() =>
      _StrengthAdvancedWeightedPushupsState();
}

class _StrengthAdvancedWeightedPushupsState
    extends State<StrengthAdvancedWeightedPushups> {
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
        title: Text("Strength Advanced Weighted Pushups"),
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
                    VideoPlayerWidget(videoUrl: "assets/weighted_pushups.mp4"),
              ),
              Text(
                "Do 5 sets of 8 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a high plank position with a weight plate on your upper back.\n\2 - Lower your body down until your chest nearly touches the ground, keeping your core engaged and your body in a straight line.\n\3 - Push through your palms to return to the starting position, maintaining proper form throughout.\n4 - Repeat for the desired number of reps.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            StrengthAdvancedRomanianDeadlifts()));
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
        "Do 5 sets of 8 repetitions. To perform weighted pushups for advanced strength training, start in a high plank position with a weight plate on your upper back. Lower your body down until your chest nearly touches the ground, keeping your core engaged and your body in a straight line. Push through your palms to return to the starting position, maintaining proper form throughout. Repeat for the desired number of reps.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
