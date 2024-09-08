import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/beginners/beginners_workout_knee_pushups.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class BeginnersWorkoutBodyweightSquats extends StatefulWidget {
  const BeginnersWorkoutBodyweightSquats({Key? key}) : super(key: key);

  @override
  State<BeginnersWorkoutBodyweightSquats> createState() =>
      _BeginnersWorkoutBodyweightSquatsState();
}

class _BeginnersWorkoutBodyweightSquatsState
    extends State<BeginnersWorkoutBodyweightSquats> {
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
        title: Text("Beginners Workout Bodyweight Squats"),
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
                "Do 3 X 12 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Begin standing with your feet shoulder-width apart.\n\2 - Lower your body by bending your knees and pushing your hips back as if sitting down in a chair.\n\3 - Keep your chest upright and your knees in line with your toes.\n4 - Push through your heels to return to the starting position, squeezing your glutes at the top.\n5 - Repeat for the specified number of repetitions.\n\6 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BeginnersWorkoutKneePushups()));
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
        "Do 3 sets of 12 repetitions. To perform beginners workout bodyweight squats, begin standing with your feet shoulder-width apart. Lower your body by bending your knees and pushing your hips back as if sitting down in a chair. Keep your chest upright and your knees in line with your toes. Push through your heels to return to the starting position, squeezing your glutes at the top. Repeat for the specified number of repetitions.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
