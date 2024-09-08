import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fitsplit/full_body/beginners/beginners_pushups.dart';

class BeginnersRest extends StatefulWidget {
  const BeginnersRest({Key? key}) : super(key: key);

  @override
  State<BeginnersRest> createState() => _BeginnersRestState();
}

class _BeginnersRestState extends State<BeginnersRest> {
  late TextToSpeech textToSpeech;
  int count = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    textToSpeech = TextToSpeech();
    startCount();
  }

  @override
  void dispose() {
    super.dispose();
    textToSpeech.dispose(); // Disposing text-to-speech instance
    timer.cancel();
  }

  void startCount() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (count < 5) {
          // Change the duration to 5 seconds for demonstration
          count++;
          textToSpeech.toggleTextToSpeech(count.toString());
        } else {
          timer.cancel();
          _navigateToBeginnersKneePushups(); // Navigate to Knee Pushups page after timer finishes
        }
      });
    });
  }

  void _navigateToBeginnersKneePushups() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => BeginnersPushups()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest Timer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Time Remaining",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CountdownDisplay(count: 5 - count), // Adjust the total time here
            SizedBox(height: 20),
            CircularProgressIndicator(
              value: count / 5, // Adjust the total time here
              strokeWidth: 10,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

class CountdownDisplay extends StatelessWidget {
  final int count;

  const CountdownDisplay({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$count seconds",
      style: TextStyle(fontSize: 48.0, color: _getTextColor(count)),
    );
  }

  Color _getTextColor(int count) {
    if (count <= 2) {
      return Colors.red; // Change the color scheme as needed
    } else if (count <= 4) {
      return Colors.orange; // Change the color scheme as needed
    } else {
      return Colors.green; // Change the color scheme as needed
    }
  }
}

class TextToSpeech {
  late FlutterTts flutterTts;
  bool isSpeaking = false;

  TextToSpeech() {
    flutterTts = FlutterTts();
  }

  Future<void> toggleTextToSpeech(String text) async {
    if (isSpeaking) {
      await flutterTts.stop();
    } else {
      await _speakInstructions(text);
    }
    isSpeaking = !isSpeaking;
  }

  Future<void> _speakInstructions(String text) async {
    await flutterTts.setVolume(1.0);
    await flutterTts
        .setSpeechRate(0.5); // Adjust speech rate here (0.5 is slower)
    await flutterTts.speak(text);
  }

  void dispose() {
    flutterTts.stop();
  }
}
