import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/fat_loss_home.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class AdvancedWorkoutLunges extends StatefulWidget {
  const AdvancedWorkoutLunges({Key? key}) : super(key: key);

  @override
  State<AdvancedWorkoutLunges> createState() => _AdvancedWorkoutLungesState();
}

class _AdvancedWorkoutLungesState extends State<AdvancedWorkoutLunges> {
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
        title: Text("Advanced Workout Lunges"),
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
                child: VideoPlayerWidget(videoUrl: "assets/lunges.mp4"),
              ),
              Text(
                "Do 5 sets of 20 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand tall with your feet hip-width apart and hands on your hips.\n\2 - Take a big step forward with your right leg, and lower your body until both knees are bent at a 90-degree angle.\n\3 - Keep your torso upright and your core engaged.\n4 - Push back to the starting position and repeat with the left leg.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FatLossHome()));
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
        "Do 5 sets of 20 repetitions. To perform advanced workout lunges, stand tall with your feet hip-width apart and hands on your hips. Take a big step forward with your right leg, and lower your body until both knees are bent at a 90-degree angle. Keep your torso upright and your core engaged. Push back to the starting position and repeat with the left leg.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
