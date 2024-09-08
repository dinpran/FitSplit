import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/full_body/full_home.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class IntermediateBurpees extends StatefulWidget {
  const IntermediateBurpees({Key? key}) : super(key: key);

  @override
  State<IntermediateBurpees> createState() => _IntermediateBurpeesState();
}

class _IntermediateBurpeesState extends State<IntermediateBurpees> {
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
        title: Text("Burpees"),
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
                child: VideoPlayerWidget(videoUrl: "assets/burpees.mp4"),
              ),
              Text(
                "Do 4 X 12 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Begin in a standing position.\n\2 - Drop into a squat position with your hands on the ground.\n\3 - Kick your feet back, landing in a plank position.\n\4 - Perform a push-up, then immediately return to the squat position.\n\5 - Jump up from the squat position as explosively as possible.\n\6 - Repeat the sequence.\n\7 - Take Rest for 1 minute after each set.",
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
        "Do 4 sets of 12 repetitions. To perform burpees, begin in a standing position. Drop into a squat position with your hands on the ground. Kick your feet back, landing in a plank position. Perform a push-up, then immediately return to the squat position. Jump up from the squat position as explosively as possible. Repeat the sequence.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
