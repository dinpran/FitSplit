import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/intermediate/strength_intermediate_lunges.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthIntermediatePushups extends StatefulWidget {
  const StrengthIntermediatePushups({Key? key}) : super(key: key);

  @override
  State<StrengthIntermediatePushups> createState() =>
      _StrengthIntermediatePushupsState();
}

class _StrengthIntermediatePushupsState
    extends State<StrengthIntermediatePushups> {
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
        title: Text("Strength Intermediate Pushups"),
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
                child: VideoPlayerWidget(videoUrl: "assets/pushups.mp4"),
              ),
              Text(
                "Do 4 sets of 15 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Begin in a plank position with your hands slightly wider than shoulder-width apart.\n\2 - Lower your body until your chest nearly touches the floor, keeping your elbows close to your body.\n\3 - Push back up to the starting position, keeping your body in a straight line from head to heels.\n4 - Repeat the movement.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StrengthIntermediateLunges()));
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
        "Do 4 sets of 15 repetitions. To perform pushups for intermediate strength training, begin in a plank position with your hands slightly wider than shoulder-width apart. Lower your body until your chest nearly touches the floor, keeping your elbows close to your body. Push back up to the starting position, keeping your body in a straight line from head to heels. Repeat the movement.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
