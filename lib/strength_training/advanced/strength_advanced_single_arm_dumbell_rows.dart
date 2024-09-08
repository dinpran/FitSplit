import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/strength_training/strength_home.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthAdvancedSingleArmDumbbellRows extends StatefulWidget {
  const StrengthAdvancedSingleArmDumbbellRows({Key? key}) : super(key: key);

  @override
  State<StrengthAdvancedSingleArmDumbbellRows> createState() =>
      _StrengthAdvancedSingleArmDumbbellRowsState();
}

class _StrengthAdvancedSingleArmDumbbellRowsState
    extends State<StrengthAdvancedSingleArmDumbbellRows> {
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
        title: Text("Strength Advanced Single Arm Dumbbell Rows"),
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
                    videoUrl: "assets/single_arm_dumbell_rows.mp4"),
              ),
              Text(
                "Do 5 sets of 10 reps per arm",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet shoulder-width apart, holding a dumbbell in one hand with your palm facing your body.\n\2 - Bend forward at your hips, keeping your back flat and your opposite hand resting on a bench or knee for support.\n\3 - Pull the dumbbell up towards your rib cage, keeping your elbow close to your body.\n4 - Lower the dumbbell back down in a controlled manner.\n5 - Repeat for the desired number of reps on one arm before switching to the other arm.\n\6 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Choose a weight that challenges you but allows you to maintain proper form throughout the exercise.",
                style: TextStyle(fontSize: 14),
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
        "Do 5 sets of 10 repetitions per arm. To perform Single Arm Dumbbell Rows for advanced strength training, stand with your feet shoulder-width apart, holding a dumbbell in one hand with your palm facing your body. Bend forward at your hips, keeping your back flat and your opposite hand resting on a bench or knee for support. Pull the dumbbell up towards your rib cage, keeping your elbow close to your body. Lower the dumbbell back down in a controlled manner. Repeat for the desired number of reps on one arm before switching to the other arm. Choose a weight that challenges you but allows you to maintain proper form throughout the exercise.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
