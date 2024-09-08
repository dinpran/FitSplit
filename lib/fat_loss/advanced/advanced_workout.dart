import 'package:flutter/material.dart';
import 'package:fitsplit/fat_loss/advanced/advanced_workout_burpees.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';

class AdvancedWorkout extends StatefulWidget {
  const AdvancedWorkout({super.key});

  @override
  State<AdvancedWorkout> createState() => _AdvancedWorkoutState();
}

class _AdvancedWorkoutState extends State<AdvancedWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WORKOUT"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Get Ready For Workout",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 155,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AdvancedWorkoutBurpees(),
                  ),
                );
              },
              child: Icon(Icons.start),
            )
          ],
        ),
      ),
    );
    ;
  }
}
