import 'package:flutter/material.dart';
import 'package:fitsplit/full_body/beginners/bodyweight_squats.dart';

class FullBeginners extends StatefulWidget {
  const FullBeginners({Key? key}) : super(key: key);

  @override
  State<FullBeginners> createState() => _FullBeginnersState();
}

class _FullBeginnersState extends State<FullBeginners> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beginners"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to the Beginners Program!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Congratulations on taking the step towards your fitness journey. In this program, you will learn the Effective full body excercises and develop a strong foundation for your future workouts.",
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
              _buildListItem("Introduction to effective Full Body Exercise"),
              _buildListItem("Guidance on proper form and technique"),
              _buildListItem("Effective workout routines for beginners"),
              SizedBox(height: 20),
              Text(
                "Get ready to embark on an exciting fitness journey and start seeing results!",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add navigation logic to move to the next screen
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BodyweightSquats(),
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
