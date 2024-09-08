import 'package:fitsplit/strength_training/advanced/strength_advanced_single_arm_dumbell_rows.dart';
import 'package:fitsplit/videoplayerwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/advanced/strength_advanced_single_arm_dumbell_rows.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthAdvancedDiamondPushups extends StatefulWidget {
  const StrengthAdvancedDiamondPushups({Key? key}) : super(key: key);

  @override
  State<StrengthAdvancedDiamondPushups> createState() =>
      _StrengthAdvancedDiamondPushupsState();
}

class _StrengthAdvancedDiamondPushupsState
    extends State<StrengthAdvancedDiamondPushups> {
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
        title: Text("Strength Advanced Diamond Pushups"),
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
                    VideoPlayerWidget(videoUrl: "assets/diamond_pushups.mp4"),
              ),
              Text(
                "Do 5 sets of 10 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a high plank position with your hands close together under your chest, forming a diamond shape with your thumbs and index fingers.\n\2 - Lower your body towards the ground, keeping your elbows close to your sides.\n\3 - Push back up to the starting position, extending your arms fully.\n4 - Repeat for the desired number of reps.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Choose a modification or knee pushups if you're unable to perform full diamond pushups with proper form.",
                style: TextStyle(fontSize: 14),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            StrengthAdvancedSingleArmDumbbellRows()));
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
        "Do 5 sets of 10 repetitions. To perform Diamond Pushups for advanced strength training, start in a high plank position with your hands close together under your chest, forming a diamond shape with your thumbs and index fingers. Lower your body towards the ground, keeping your elbows close to your sides. Push back up to the starting position, extending your arms fully. Repeat for the desired number of reps. Choose a modification or knee pushups if you're unable to perform full diamond pushups with proper form.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
