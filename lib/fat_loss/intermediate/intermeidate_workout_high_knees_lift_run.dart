import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/fat_loss_home.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class IntermediateWorkoutHighKnees extends StatefulWidget {
  const IntermediateWorkoutHighKnees({Key? key}) : super(key: key);

  @override
  State<IntermediateWorkoutHighKnees> createState() =>
      _IntermediateWorkoutHighKneesState();
}

class _IntermediateWorkoutHighKneesState
    extends State<IntermediateWorkoutHighKnees> {
  late FlutterTts flutterTts;
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _speakInstructions(); // Start TTS automatically when the screen is opened
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
        title: Text("Intermediate Workout High Knees"),
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
                    videoUrl: "assets/High_knees_lift_run.mp4"),
              ),
              Text(
                "Do 4 X 15 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand tall with your feet hip-width apart and your arms at your sides.\n\2 - Begin jogging in place, lifting your knees as high as possible towards your chest.\n\3 - Pump your arms back and forth as you lift your knees, keeping your core engaged.\n4 - Move as quickly as possible while maintaining good form.\n\5 - Take Rest for 1 minute after each set.",
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
        "Do 4 sets of 15 repetitions. To perform intermediate workout high knees, stand tall with your feet hip-width apart and your arms at your sides. Begin jogging in place, lifting your knees as high as possible towards your chest. Pump your arms back and forth as you lift your knees, keeping your core engaged. Move as quickly as possible while maintaining good form.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
