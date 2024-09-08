import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/strength_home.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthBeginnersGluteBridges extends StatefulWidget {
  const StrengthBeginnersGluteBridges({Key? key}) : super(key: key);

  @override
  State<StrengthBeginnersGluteBridges> createState() =>
      _StrengthBeginnersGluteBridgesState();
}

class _StrengthBeginnersGluteBridgesState
    extends State<StrengthBeginnersGluteBridges> {
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
        title: Text("Strength Beginners Glute Bridges"),
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
                child: VideoPlayerWidget(videoUrl: "assets/glute_bridges.mp4"),
              ),
              Text(
                "Do 3 sets of 12 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Lie on your back with your knees bent and feet flat on the floor, hip-width apart.\n\2 - Keep your arms at your sides, palms down.\n\3 - Push through your heels and lift your hips up towards the ceiling, squeezing your glutes at the top.\n4 - Lower your hips back down to the starting position with control and repeat.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StrengthHome()));
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
        "Do 3 sets of 12 repetitions. To perform glute bridges for strength beginners, lie on your back with your knees bent and feet flat on the floor, hip-width apart. Keep your arms at your sides, palms down. Push through your heels and lift your hips up towards the ceiling, squeezing your glutes at the top. Lower your hips back down to the starting position with control and repeat.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
