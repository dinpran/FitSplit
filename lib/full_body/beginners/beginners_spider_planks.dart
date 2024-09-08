import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_jumping_jacks.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart'; // Update import
import 'package:fitsplit/videoplayerwidget.dart';

class BeginnersSpiderPlanks extends StatefulWidget {
  const BeginnersSpiderPlanks({Key? key}) : super(key: key);

  @override
  State<BeginnersSpiderPlanks> createState() => _BeginnersSpiderPlanksState();
}

class _BeginnersSpiderPlanksState extends State<BeginnersSpiderPlanks> {
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
        title: Text("Beginners Spider Planks"),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                ),
                child: VideoPlayerWidget(videoUrl: "assets/spider_planks.mp4"),
              ),
              Text(
                "Do 3 X 12 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Start in a plank position with your hands shoulder-width apart and your body forming a straight line from head to heels.\n2 - Lift your right foot off the ground and bring your right knee towards your right elbow, aiming to touch it if possible.\n3 - Return to the plank position and repeat on the other side with your left knee and left elbow.\n4 - Continue alternating sides for the prescribed number of repetitions.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BeginnersJumpingJacks(),
                    ));
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
        "Do 3 sets of 12 repetitions. To perform spider planks, start in a plank position with your hands shoulder-width apart and your body forming a straight line from head to heels. Lift your right foot off the ground and bring your right knee towards your right elbow, aiming to touch it if possible. Return to the plank position and repeat on the other side with your left knee and left elbow. Continue alternating sides for the prescribed number of repetitions.Take Rest for 1 minute after each set.";

    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.35);
    await flutterTts.speak(instructions);
  }
}
