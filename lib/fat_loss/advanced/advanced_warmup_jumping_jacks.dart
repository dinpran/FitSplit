import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/advanced/advanced_warmup_arm_circles.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class AdvancedWarmupJumpingJacks extends StatefulWidget {
  const AdvancedWarmupJumpingJacks({Key? key}) : super(key: key);

  @override
  State<AdvancedWarmupJumpingJacks> createState() =>
      _AdvancedWarmupJumpingJacksState();
}

class _AdvancedWarmupJumpingJacksState
    extends State<AdvancedWarmupJumpingJacks> {
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
        title: Text("Advanced Warm-up Jumping Jacks"),
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
                child: VideoPlayerWidget(videoUrl: "assets/jumping_jacks.mp4"),
              ),
              Text(
                "Do 1 set of 20 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet together and your arms at your sides.\n\2 - Jump your feet out wide while raising your arms overhead.\n\3 - Quickly return to the starting position by jumping your feet back together and lowering your arms.\n4 - Repeat the movement for the specified number of repetitions.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdvancedWarmupArmCircles()));
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
        "Do 1 set of 20 repetitions. To perform advanced warm-up jumping jacks, stand with your feet together and your arms at your sides. Jump your feet out wide while raising your arms overhead. Quickly return to the starting position by jumping your feet back together and lowering your arms. Repeat the movement for the specified number of repetitions.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
