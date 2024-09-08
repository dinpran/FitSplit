import 'package:flutter/material.dart';
import 'package:fitsplit/fat_loss/beginners/beginners_workout_jumping_jacks.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';

class BeginnersWorkout extends StatefulWidget {
  const BeginnersWorkout({super.key});

  @override
  State<BeginnersWorkout> createState() => _BeginnersWorkoutState();
}

class _BeginnersWorkoutState extends State<BeginnersWorkout> {
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
                    builder: (context) => BeginnersWorkoutJumpingJacks(),
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
