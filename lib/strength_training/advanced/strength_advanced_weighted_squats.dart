import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/advanced/strength_advanced_weighted_pushups.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthAdvancedWeightedSquats extends StatefulWidget {
  const StrengthAdvancedWeightedSquats({Key? key}) : super(key: key);

  @override
  State<StrengthAdvancedWeightedSquats> createState() =>
      _StrengthAdvancedWeightedSquatsState();
}

class _StrengthAdvancedWeightedSquatsState
    extends State<StrengthAdvancedWeightedSquats> {
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
        title: Text("Strength Advanced Weighted Squats"),
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
                    VideoPlayerWidget(videoUrl: "assets/weighted_squats.mp4"),
              ),
              Text(
                "Do 5 sets of 8 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet shoulder-width apart, holding a dumbbell in each hand at shoulder height.\n\2 - Lower your body down into a squat position, keeping your back straight and your knees aligned with your toes.\n\3 - Push through your heels to return to the starting position, squeezing your glutes at the top.\n4 - Repeat for the desired number of reps.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            StrengthAdvancedWeightedPushups()));
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
        "Do 5 sets of 8 repetitions. To perform weighted squats for advanced strength training, stand with your feet shoulder-width apart, holding a dumbbell in each hand at shoulder height. Lower your body down into a squat position, keeping your back straight and your knees aligned with your toes. Push through your heels to return to the starting position, squeezing your glutes at the top. Repeat for the desired number of reps.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
