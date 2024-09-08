import 'package:flutter/material.dart';
import 'package:fitsplit/fat_loss/intermediate/intermediate_workout_jump_squats.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';
import 'package:flutter_tts/flutter_tts.dart';

class IntermediateWorkoutBurpees extends StatefulWidget {
  const IntermediateWorkoutBurpees({Key? key}) : super(key: key);

  @override
  State<IntermediateWorkoutBurpees> createState() =>
      _IntermediateWorkoutBurpeesState();
}

class _IntermediateWorkoutBurpeesState
    extends State<IntermediateWorkoutBurpees> {
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
        title: Text("Intermediate Workout Burpees"),
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
                "Do 4 X 15 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a standing position with your feet shoulder-width apart.\n\2 - Lower your body into a squat position, placing your hands on the floor in front of you.\n\3 - Jump your feet back into a plank position, keeping your arms extended.\n\4 - Perform a push-up, lowering your chest to the floor.\n\5 - Jump your feet back to the squat position, then explosively jump up into the air, reaching your arms overhead.\n\6 - Land softly and immediately lower back into a squat for the next repetition.\n\7 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => IntermediateWorkoutJumpSquats()));
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
        "Do 4 sets of 15 repetitions. To perform intermediate workout burpees, start in a standing position with your feet shoulder-width apart. Lower your body into a squat position, placing your hands on the floor in front of you. Jump your feet back into a plank position, keeping your arms extended. Perform a push-up, lowering your chest to the floor. Jump your feet back to the squat position, then explosively jump up into the air, reaching your arms overhead. Land softly and immediately lower back into a squat for the next repetition.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
