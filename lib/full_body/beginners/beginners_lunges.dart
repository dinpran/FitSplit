import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart'; // Update import
import 'package:fitsplit/full_body/beginners/beginners_spider_planks.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class BeginnersLunges extends StatefulWidget {
  const BeginnersLunges({Key? key}) : super(key: key);

  @override
  State<BeginnersLunges> createState() => _BeginnersLungesState();
}

class _BeginnersLungesState extends State<BeginnersLunges> {
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
        title: Text("Beginners Lunges"),
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
                child: VideoPlayerWidget(videoUrl: "assets/lunges.mp4"),
              ),
              Text(
                "Do 3 X 12 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Begin standing with your feet shoulder-width apart.\n2 - Take a big step forward with your right leg, lowering your body until both knees are bent at about a 90-degree angle.\n3 - Ensure your front knee is directly above your ankle and your back knee is hovering just above the floor.\n4 - Push off with your right foot to return to the starting position, then repeat on the other side.\n5 - Continue alternating legs for the prescribed number of repetitions.\n\6 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BeginnersSpiderPlanks(),
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
        "Do 3 sets of 12 repetitions. To perform lunges, begin standing with your feet shoulder-width apart. Take a big step forward with your right leg, lowering your body until both knees are bent at about a 90-degree angle. Ensure your front knee is directly above your ankle and your back knee is hovering just above the floor. Push off with your right foot to return to the starting position, then repeat on the other side. Continue alternating legs for the prescribed number of repetitions.Take Rest for 1 minute after each set.";

    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.35);
    await flutterTts.speak(instructions);
  }
}
