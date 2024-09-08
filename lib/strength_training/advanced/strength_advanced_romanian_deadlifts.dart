import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/advanced/strength_advanced_diamond_pushups.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthAdvancedRomanianDeadlifts extends StatefulWidget {
  const StrengthAdvancedRomanianDeadlifts({Key? key}) : super(key: key);

  @override
  State<StrengthAdvancedRomanianDeadlifts> createState() =>
      _StrengthAdvancedRomanianDeadliftsState();
}

class _StrengthAdvancedRomanianDeadliftsState
    extends State<StrengthAdvancedRomanianDeadlifts> {
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
        title: Text("Strength Advanced Romanian Deadlifts"),
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
                    videoUrl: "assets/romanian_deadlifts.mp4"),
              ),
              Text(
                "Do 5 sets of 8 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet shoulder-width apart, holding a barbell or dumbbells in front of your thighs.\n\2 - Keeping your back flat and knees slightly bent, hinge at your hips to lower the weights towards the ground.\n\3 - Lower until you feel a stretch in your hamstrings, then return to the starting position by driving your hips forward.\n4 - Repeat for the desired number of reps.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Choose a weight that allows you to perform 8 reps with proper form, but is challenging by the end of the set. You can use a barbell, dumbbells, or any other weighted object that you're comfortable with.",
                style: TextStyle(fontSize: 14),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            StrengthAdvancedDiamondPushups()));
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
        "Do 5 sets of 8 repetitions. To perform Romanian Deadlifts for advanced strength training, stand with your feet shoulder-width apart, holding a barbell or dumbbells in front of your thighs. Keeping your back flat and knees slightly bent, hinge at your hips to lower the weights towards the ground. Lower until you feel a stretch in your hamstrings, then return to the starting position by driving your hips forward. Repeat for the desired number of reps. Choose a weight that allows you to perform 8 reps with proper form, but is challenging by the end of the set. You can use a barbell, dumbbells, or any other weighted object that you're comfortable with.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
