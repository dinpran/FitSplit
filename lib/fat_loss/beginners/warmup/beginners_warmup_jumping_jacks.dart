import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/beginners/beginners_workout.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class BeginnersWarmupJumpingJacks extends StatefulWidget {
  const BeginnersWarmupJumpingJacks({Key? key}) : super(key: key);

  @override
  State<BeginnersWarmupJumpingJacks> createState() =>
      _BeginnersWarmupJumpingJacksState();
}

class _BeginnersWarmupJumpingJacksState
    extends State<BeginnersWarmupJumpingJacks> {
  late FlutterTts flutterTts;
  bool isSpeaking = false;

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _speakInstructions(); // Call the TTS function when the screen loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beginners Warmup Jumping Jacks"),
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
                child: VideoPlayerWidget(videoUrl: "assets/jumping_jacks.mp4"),
              ),
              Text(
                "Do 1 X 10 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet together and your arms at your sides.\n\2 - Jump up while spreading your legs to the sides and raising your arms above your head, forming a 'jumping jack' shape.\n\3 - Land softly and return to the starting position.\n4 - Repeat for the specified number of repetitions.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BeginnersWorkout()));
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
        "Do 1 set of 10 repetitions. To perform beginners warmup jumping jacks, stand with your feet together and your arms at your sides. Jump up while spreading your legs to the sides and raising your arms above your head, forming a 'jumping jack' shape. Land softly and return to the starting position. Repeat for the specified number of repetitions.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
