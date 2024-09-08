import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/intermediate/intermediate_warmup_arm_circles.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class IntermediateWarmupJumpingJacks extends StatefulWidget {
  const IntermediateWarmupJumpingJacks({Key? key}) : super(key: key);

  @override
  State<IntermediateWarmupJumpingJacks> createState() =>
      _IntermediateWarmupJumpingJacksState();
}

class _IntermediateWarmupJumpingJacksState
    extends State<IntermediateWarmupJumpingJacks> {
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
        title: Text("Intermediate Warmup Jumping Jacks"),
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
                "Do 1 X 15 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet together and your arms at your sides.\n\2 - Jump up, spreading your legs to the sides while simultaneously raising your arms above your head.\n\3 - Jump back to the starting position with your feet together and arms at your sides.\n4 - Repeat for the specified number of repetitions.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => IntermediateWarmupArmCircles()));
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
        "Do 1 set of 15 repetitions. To perform intermediate warmup jumping jacks, stand with your feet together and your arms at your sides. Jump up, spreading your legs to the sides while simultaneously raising your arms above your head. Jump back to the starting position with your feet together and arms at your sides. Repeat for the specified number of repetitions.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
