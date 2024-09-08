import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/advanced/advanced_spider_planks.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/videoplayerwidget.dart';

class AdvancedWeightedSquats extends StatefulWidget {
  const AdvancedWeightedSquats({Key? key}) : super(key: key);

  @override
  State<AdvancedWeightedSquats> createState() => _AdvancedWeightedSquatsState();
}

class _AdvancedWeightedSquatsState extends State<AdvancedWeightedSquats> {
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
        title: Text("Weighted Squats"),
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
                child:
                    VideoPlayerWidget(videoUrl: "assets/weighted_squats.mp4"),
              ),
              Text(
                "Do 5 X 20 reps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "1 - Stand with your feet shoulder-width apart and hold a dumbbell or any weighted object at your chest level.\n\2 - Lower your body by bending your knees and pushing your hips back as if sitting down in a chair.\n\3 - Keep your chest upright and your knees in line with your toes.\n\4 - Push through your heels to return to the starting position, squeezing your glutes at the top.\n\5 - Repeat for the specified number of reps. \n\6 - Take Rest for 1 minute after each set.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdvancedSpiderPlanks()));
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
        "Do 5 sets of 20 repetitions. To perform weighted squats, stand with your feet shoulder-width apart and hold a dumbbell or any weighted object at your chest level. Lower your body by bending your knees and pushing your hips back as if sitting down in a chair. Keep your chest upright and your knees in line with your toes. Push through your heels to return to the starting position, squeezing your glutes at the top. Repeat for the specified number of reps.Take Rest for 1 minute after each set.";

    try {
      await flutterTts.setVolume(1.0);
      await flutterTts.setSpeechRate(0.35);
      await flutterTts.speak(instructions);
    } catch (e) {
      print("Error speaking instructions: $e");
    }
  }
}
