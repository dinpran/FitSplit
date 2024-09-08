import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/intermediate/strength_intermediate_pushups.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthIntermediateBodyweightSquats extends StatefulWidget {
  const StrengthIntermediateBodyweightSquats({Key? key}) : super(key: key);

  @override
  State<StrengthIntermediateBodyweightSquats> createState() =>
      _StrengthIntermediateBodyweightSquatsState();
}

class _StrengthIntermediateBodyweightSquatsState
    extends State<StrengthIntermediateBodyweightSquats> {
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
        title: Text("Strength Intermediate Bodyweight Squats"),
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
                child: VideoPlayerWidget(videoUrl: "assets/squats.mp4"),
              ),
              Text(
                "Do 4 sets of 15 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Begin standing with your feet shoulder-width apart and your arms at your sides.\n\2 - Lower into a squat position by bending your knees and pushing your hips back.\n\3 - Keep your chest upright and your knees in line with your toes.\n4 - Push through your heels to return to the starting position, squeezing your glutes at the top. Repeat.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StrengthIntermediatePushups()));
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
        "Do 4 sets of 15 repetitions. To perform bodyweight squats for intermediate strength training, begin standing with your feet shoulder-width apart and your arms at your sides. Lower into a squat position by bending your knees and pushing your hips back. Keep your chest upright and your knees in line with your toes. Push through your heels to return to the starting position, squeezing your glutes at the top. Repeat.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
