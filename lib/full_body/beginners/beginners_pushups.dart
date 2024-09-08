import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_lunges.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart'; // Update import
import 'package:fitsplit/videoplayerwidget.dart';

class BeginnersPushups extends StatefulWidget {
  const BeginnersPushups({Key? key}) : super(key: key);

  @override
  State<BeginnersPushups> createState() => _BeginnersPushupsState();
}

class _BeginnersPushupsState extends State<BeginnersPushups> {
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
        title: Text("Beginners Pushups"),
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
                child: VideoPlayerWidget(videoUrl: "assets/knee.mp4"),
              ),
              Text(
                "Do 3 X 10 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Begin in a plank position with your hands shoulder-width apart and your body in a straight line from head to heels.\n2 - Lower your body by bending your elbows until your chest nearly touches the floor.\n3 - Push back up to the starting position, keeping your core engaged and body in a straight line.\n4 - Repeat the movement as shown in the animation.\n\5 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BeginnersLunges(),
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
        "Do 3 sets of 10 repetitions. To perform pushups, begin in a plank position with your hands shoulder-width apart and your body in a straight line from head to heels. Lower your body by bending your elbows until your chest nearly touches the floor. Push back up to the starting position, keeping your core engaged and body in a straight line. Repeat the movement as shown in the animation.Take Rest for 1 minute after each set.";

    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.35);
    await flutterTts.speak(instructions);
  }
}
