import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/intermediate/intermediate_warmup_bodyweight_squats.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class IntermediateWarmupArmCircles extends StatefulWidget {
  const IntermediateWarmupArmCircles({Key? key}) : super(key: key);

  @override
  State<IntermediateWarmupArmCircles> createState() =>
      _IntermediateWarmupArmCirclesState();
}

class _IntermediateWarmupArmCirclesState
    extends State<IntermediateWarmupArmCircles> {
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
        title: Text("Intermediate Warmup Arm Circles"),
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
                "1 - Stand with your feet shoulder-width apart and extend your arms out to the sides at shoulder height.\n\2 - Rotate your arms forward in small circles, gradually increasing the size of the circles.\n\3 - After completing the specified number of reps, reverse the direction of the circles and repeat.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            IntermediateWarmupBodyweightSquats()));
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
        "Do 1 set of 10 repetitions. To perform intermediate warmup arm circles, stand with your feet shoulder-width apart and extend your arms out to the sides at shoulder height. Rotate your arms forward in small circles, gradually increasing the size of the circles. After completing the specified number of reps, reverse the direction of the circles and repeat.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
