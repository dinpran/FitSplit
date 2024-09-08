import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/strength_training/strength_home.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthIntermediateTricepDips extends StatefulWidget {
  const StrengthIntermediateTricepDips({Key? key}) : super(key: key);

  @override
  State<StrengthIntermediateTricepDips> createState() =>
      _StrengthIntermediateTricepDipsState();
}

class _StrengthIntermediateTricepDipsState
    extends State<StrengthIntermediateTricepDips> {
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
        title: Text("Strength Intermediate Tricep Dips"),
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
                child: VideoPlayerWidget(videoUrl: "assets/tricep_dips.mp4"),
              ),
              Text(
                "Do 4 sets of 15 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Sit on the edge of a sturdy chair or bench with your hands gripping the edge.\n\2 - Walk your feet out and lower your body down, bending your elbows until they reach a 90-degree angle.\n\3 - Push through your palms to straighten your arms and lift your body back up to the starting position.\n4 - Repeat for the desired number of reps.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
        "Do 4 sets of 15 repetitions. To perform tricep dips for intermediate strength training, sit on the edge of a sturdy chair or bench with your hands gripping the edge. Walk your feet out and lower your body down, bending your elbows until they reach a 90-degree angle. Push through your palms to straighten your arms and lift your body back up to the starting position. Repeat for the desired number of reps.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
