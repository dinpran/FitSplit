import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/beginners/strength_beginners_lunges.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class StrengthBeginnersKneePushups extends StatefulWidget {
  const StrengthBeginnersKneePushups({Key? key}) : super(key: key);

  @override
  State<StrengthBeginnersKneePushups> createState() =>
      _StrengthBeginnersKneePushupsState();
}

class _StrengthBeginnersKneePushupsState
    extends State<StrengthBeginnersKneePushups> {
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
        title: Text("Strength Beginners Knee Pushups"),
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
                child: VideoPlayerWidget(videoUrl: "assets/knee.mp4"),
              ),
              Text(
                "Do 3 sets of 12 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Begin in a plank position with your knees on the ground and your hands shoulder-width apart.\n\2 - Lower your chest toward the ground while keeping your back straight and your elbows close to your body.\n\3 - Push back up to the starting position, keeping your body in a straight line from your knees to your shoulders.\n4 - Repeat the movement as shown in the animation.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StrengthBeginnersLunges()));
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
        "Do 3 sets of 12 repetitions. To perform knee pushups for strength beginners, begin in a plank position with your knees on the ground and your hands shoulder-width apart. Lower your chest toward the ground while keeping your back straight and your elbows close to your body. Push back up to the starting position, keeping your body in a straight line from your knees to your shoulders. Repeat the movement as shown in the animation.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
