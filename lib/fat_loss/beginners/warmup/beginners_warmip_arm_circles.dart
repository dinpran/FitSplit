import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/beginners/warmup/beginners_warmup_jumping_jacks.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class BeginnersWarmupArmCircles extends StatefulWidget {
  const BeginnersWarmupArmCircles({Key? key}) : super(key: key);

  @override
  State<BeginnersWarmupArmCircles> createState() =>
      _BeginnersWarmupArmCirclesState();
}

class _BeginnersWarmupArmCirclesState extends State<BeginnersWarmupArmCircles> {
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
        title: Text("Beginners Warmup Arm Circles"),
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
                    VideoPlayerWidget(videoUrl: "assets/arm_circles_side.mp4"),
              ),
              Text(
                "Do 1 X 10 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet hip-width apart and extend your arms straight out to the sides, parallel to the floor.\n\2 - Rotate your arms in small, controlled circles forward for the specified number of repetitions.\n\3 - Then, reverse the direction and perform the same number of circles backward.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BeginnersWarmupJumpingJacks()));
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
        "Do 1 set of 10 repetitions. To perform beginners warmup arm circles, stand with your feet hip-width apart and extend your arms straight out to the sides, parallel to the floor. Rotate your arms in small, controlled circles forward for the specified number of repetitions. Then, reverse the direction and perform the same number of circles backward.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
