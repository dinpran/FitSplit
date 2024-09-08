import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/full_body/intermediate/intermediate_burpees.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class IntermediateHighKneesLiftRun extends StatefulWidget {
  const IntermediateHighKneesLiftRun({Key? key}) : super(key: key);

  @override
  State<IntermediateHighKneesLiftRun> createState() =>
      _IntermediateHighKneesLiftRunState();
}

class _IntermediateHighKneesLiftRunState
    extends State<IntermediateHighKneesLiftRun> {
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
        title: Text("High Knees Lift Run"),
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
                child: VideoPlayerWidget(
                    videoUrl: "assets/High_knees_lift_run.mp4"),
              ),
              Text(
                "Do 4 X 30 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet hip-width apart and your arms at your sides.\n\2 - Lift your right knee as high as possible and quickly place it back down.\n\3 - Alternate legs, pumping them as if you are running in place.\n4 - Count one repetition for each time your right knee reaches its peak.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => IntermediateBurpees()));
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
        "Do 4 sets of 30 repetitions. To perform high knees lift run, stand with your feet hip-width apart and your arms at your sides. Lift your right knee as high as possible and quickly place it back down. Alternate legs, pumping them as if you are running in place. Count one repetition for each time your right knee reaches its peak.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
