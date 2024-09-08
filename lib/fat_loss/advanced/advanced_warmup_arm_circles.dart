import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/advanced/advanced_warmup_bodyweight_squats.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class AdvancedWarmupArmCircles extends StatefulWidget {
  const AdvancedWarmupArmCircles({Key? key}) : super(key: key);

  @override
  State<AdvancedWarmupArmCircles> createState() =>
      _AdvancedWarmupArmCirclesState();
}

class _AdvancedWarmupArmCirclesState extends State<AdvancedWarmupArmCircles> {
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
        title: Text("Advanced Warm-up Arm Circles"),
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
                child:
                    VideoPlayerWidget(videoUrl: "assets/arm_circles_side.mp4"),
              ),
              Text(
                "Do 1 set of 20 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet shoulder-width apart and extend your arms out to the sides at shoulder height.\n\2 - Make small circular motions with your arms, gradually increasing the size of the circles.\n\3 - After the specified number of repetitions, reverse the direction of the circles.\n4 - Repeat the movement for the specified number of repetitions.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            AdvancedWarmupBodyweightSquats()));
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
        "Do 1 set of 20 repetitions. To perform advanced warm-up arm circles, stand with your feet shoulder-width apart and extend your arms out to the sides at shoulder height. Make small circular motions with your arms, gradually increasing the size of the circles. After the specified number of repetitions, reverse the direction of the circles. Repeat the movement for the specified number of repetitions.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
