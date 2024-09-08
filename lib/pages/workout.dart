import 'package:fitsplit/fat_loss/fat_loss_home.dart';
import 'package:fitsplit/full_body/full_home.dart';
import 'package:fitsplit/pages/advanced/advanced.dart';
import 'package:fitsplit/pages/beginners/beginners.dart';
import 'package:fitsplit/pages/intermediate/intermediate.dart';
import 'package:fitsplit/strength_training/strength_home.dart';
import 'package:flutter/material.dart'; // Import the Advanced screen

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Workout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildWorkoutCategory(
              title: 'FAT LOSS',
              description:
                  'Start your fitness journey with these easy workouts.',
              color: Colors.greenAccent,
              icon: Icons.fitness_center,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FatLossHome()),
                );
              },
            ),
            SizedBox(height: 16),
            _buildWorkoutCategory(
              title: 'FULL BODY',
              description: 'Challenge yourself with these full body workouts.',
              color: Colors.orangeAccent,
              icon: Icons.run_circle,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FullHome()),
                );
              },
            ),
            SizedBox(height: 16),
            _buildWorkoutCategory(
              title: 'STRENGTH TRAINING',
              description: 'Push your limits with these intense workouts.',
              color: Colors.redAccent,
              icon: Icons.star,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StrengthHome()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutCategory({
    required String title,
    required String description,
    required Color color,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
