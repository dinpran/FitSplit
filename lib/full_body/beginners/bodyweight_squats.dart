import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_pushups.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class BodyweightSquats extends StatefulWidget {
  const BodyweightSquats({Key? key}) : super(key: key);

  @override
  State<BodyweightSquats> createState() => _BodyweightSquatsState();
}

class _BodyweightSquatsState extends State<BodyweightSquats> {
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
        title: Text("BodyWeight Squats"),
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
                child: VideoPlayerWidget(videoUrl: "assets/squats.mp4"),
              ),
              Text(
                "Do 3 X 20 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Begin in a plank position with your hands clenched into fists, knuckles touching the ground.\n\2 -Lower your chest toward the ground while keeping your knuckles aligned and elbows close to your body.\n\3 - Push back up to the starting position, maintaining a straight body line and repeat.\n4 - do it as shown in the animation.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BeginnersPushups()));
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
        "Do 3 sets of 20 repetitions. To perform squats, begin standing with your feet shoulder-width apart. Lower your body by bending your knees and pushing your hips back as if sitting down in a chair. Keep your chest upright and your knees in line with your toes. Push through your heels to return to the starting position, squeezing your glutes at the top. Repeat.Take Rest for 1 minute after each set.";

    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.35);
    await flutterTts.speak(instructions);
  }
}
