import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/fat_loss/beginners/warmup/beginners_warmup_knee_pushups.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class BeginnersWarmupBodySquats extends StatefulWidget {
  const BeginnersWarmupBodySquats({Key? key}) : super(key: key);

  @override
  State<BeginnersWarmupBodySquats> createState() =>
      _BeginnersWarmupBodySquatsState();
}

class _BeginnersWarmupBodySquatsState extends State<BeginnersWarmupBodySquats> {
  late FlutterTts flutterTts;
  bool isSpeaking = false;

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _speakInstructions(); // Call the TTS function when the screen loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Body Squats"),
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
                "Do 1 X 10 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet shoulder-width apart and toes pointed slightly out.\n\2 - Lower your body down by bending your knees and pushing your hips back.\n\3 - Keep your chest up and maintain a neutral spine.\n\4 - Lower yourself until your thighs are parallel to the ground or as low as comfortable.\n\5 - Push through your heels to return to the starting position.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BeginnersWarmupKneePushups()));
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
        "Do 1 set of 10 repetitions. To perform beginners warmup body squats, stand with your feet shoulder-width apart and toes pointed slightly out. Lower your body down by bending your knees and pushing your hips back. Keep your chest up and maintain a neutral spine. Lower yourself until your thighs are parallel to the ground or as low as comfortable. Push through your heels to return to the starting position.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
