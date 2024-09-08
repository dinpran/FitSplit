import 'package:flutter/material.dart';

class Intermediate extends StatefulWidget {
  const Intermediate({super.key});

  @override
  State<Intermediate> createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
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
              title: 'PUSH',
              description:
                  'Strengthen your chest, shoulders, and triceps with these push exercises.',
              color: Colors.greenAccent,
              icon: Icons.fitness_center,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Beginners()),
                // );
              },
            ),
            SizedBox(height: 16),
            _buildWorkoutCategory(
              title: 'PULL',
              description:
                  'Focus on your back and biceps with these effective pull exercises.',
              color: Colors.orangeAccent,
              icon: Icons.run_circle,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Intermediate()),
                // );
              },
            ),
            SizedBox(height: 16),
            _buildWorkoutCategory(
              title: 'LEG',
              description:
                  'Tone and build your legs with these targeted leg exercises.',
              color: Colors.redAccent,
              icon: Icons.star,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Advanced()),
                // );
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
