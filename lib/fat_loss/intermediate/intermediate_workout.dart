import 'package:flutter/material.dart';
import 'package:fitsplit/fat_loss/intermediate/intermediate_workout_burpees.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';

class IntermediateWorkout extends StatefulWidget {
  const IntermediateWorkout({super.key});

  @override
  State<IntermediateWorkout> createState() => _IntermediateWorkoutState();
}

class _IntermediateWorkoutState extends State<IntermediateWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WORKOUT"),
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
                    builder: (context) => IntermediateWorkoutBurpees(),
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
