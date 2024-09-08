import 'package:flutter/material.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';
import 'package:fitsplit/strength_training/beginners/strength_beginners_bodyweight_squats.dart';

class StrengthTrainingBeginners extends StatefulWidget {
  const StrengthTrainingBeginners({Key? key}) : super(key: key);

  @override
  State<StrengthTrainingBeginners> createState() =>
      _StrengthTrainingBeginnersState();
}

class _StrengthTrainingBeginnersState extends State<StrengthTrainingBeginners> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beginners Strength Training"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to the Beginners Strength Training Program!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Congratulations on taking the first step toward building strength and improving your fitness. In this program, you will learn fundamental strength training exercises and lay the groundwork for your future workouts.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Here's what you can expect:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildListItem(
                  "Introduction to basic strength training exercises"),
              _buildListItem("Guidance on proper form and technique"),
              _buildListItem(
                  "Structured workout routines tailored for beginners"),
              SizedBox(height: 20),
              Text(
                "Get ready to embark on a rewarding journey to build strength and transform your body!",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add navigation logic to move to the next screen
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            StrengthBeginnersBodyweightSquats(),
                      ),
                    );
                  },
                  child: Text("Get Started"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, color: Colors.green),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
