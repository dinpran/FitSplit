import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/full_body/full_home.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class AdvancedReverseLunges extends StatefulWidget {
  const AdvancedReverseLunges({Key? key}) : super(key: key);

  @override
  State<AdvancedReverseLunges> createState() => _AdvancedReverseLungesState();
}

class _AdvancedReverseLungesState extends State<AdvancedReverseLunges> {
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
        title: Text("Advanced Reverse Lunges"),
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
                child: VideoPlayerWidget(videoUrl: "assets/reverse_lunges.mp4"),
              ),
              Text(
                "Do 5 X 20 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand tall with feet hip-width apart and engage your core.\n\2 - Take a step backward with your left foot and lower your hips so that your right thigh becomes parallel to the ground with your right knee positioned directly over your ankle.\n\3 - Your left knee should hover just above the ground. Push through your right heel to return to the starting position.\n\4 - Repeat on the other side.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FullHome()));
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
        "Do 5 sets of 20 repetitions. To perform advanced reverse lunges, stand tall with feet hip-width apart and engage your core. Take a step backward with your left foot and lower your hips so that your right thigh becomes parallel to the ground with your right knee positioned directly over your ankle. Your left knee should hover just above the ground. Push through your right heel to return to the starting position. Repeat on the other side.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
