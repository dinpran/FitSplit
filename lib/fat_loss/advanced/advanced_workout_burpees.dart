import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/advanced/advnaced_workout_pushups.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class AdvancedWorkoutBurpees extends StatefulWidget {
  const AdvancedWorkoutBurpees({Key? key}) : super(key: key);

  @override
  State<AdvancedWorkoutBurpees> createState() => _AdvancedWorkoutBurpeesState();
}

class _AdvancedWorkoutBurpeesState extends State<AdvancedWorkoutBurpees> {
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
        title: Text("Advanced Workout Burpees"),
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
                child: VideoPlayerWidget(videoUrl: "assets/burpees.mp4"),
              ),
              Text(
                "Do 5 sets of 20 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a standing position with your feet shoulder-width apart.\n\2 - Drop into a squat position and place your hands on the ground.\n\3 - Kick your feet back into a plank position, keeping your arms extended.\n4 - Perform a push-up, then immediately return your feet to the squat position.\n5 - Jump up explosively from the squat position.\n6 - Land softly and return to the starting position.\n\7 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdvancedWorkoutPushups()));
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
        "Do 5 sets of 20 repetitions. To perform advanced workout burpees, start in a standing position with your feet shoulder-width apart. Drop into a squat position and place your hands on the ground. Kick your feet back into a plank position, keeping your arms extended. Perform a push-up, then immediately return your feet to the squat position. Jump up explosively from the squat position. Land softly and return to the starting position.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
