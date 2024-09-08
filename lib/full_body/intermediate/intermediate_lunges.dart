import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/full_body/intermediate/intermediate_spider_planks.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class IntermediateLunges extends StatefulWidget {
  const IntermediateLunges({Key? key}) : super(key: key);

  @override
  State<IntermediateLunges> createState() => _IntermediateLungesState();
}

class _IntermediateLungesState extends State<IntermediateLunges> {
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
        title: Text("Lunges"),
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
                child: VideoPlayerWidget(videoUrl: "assets/lunges.mp4"),
              ),
              Text(
                "Do 4 X 15 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand tall with your feet hip-width apart.\n\2 - Take a big step forward with your right leg, bending your right knee until it forms a 90-degree angle.\n\3 - Lower your body until your left knee almost touches the ground.\n4 - Push back up to the starting position, using your right foot to return to standing.\n5 - Repeat on the other side.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => IntermediateSpiderPlanks()));
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
        "Do 4 sets of 15 repetitions. To perform lunges, stand tall with your feet hip-width apart. Take a big step forward with your right leg, bending your right knee until it forms a 90-degree angle. Lower your body until your left knee almost touches the ground. Push back up to the starting position, using your right foot to return to standing. Repeat on the other side.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
