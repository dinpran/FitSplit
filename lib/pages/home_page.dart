import 'package:flutter/material.dart';
import 'step_counter.dart';
import 'habit_tracker.dart';
import 'calorie_tracker.dart'; // Import the CalorieCounter page
import 'workout.dart'; // Import the WorkoutPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const StepCounter(),
    const HabitTracker(),
    const CalorieCounter(),
    const Workout(), // Add WorkoutPage to the pages list
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: 'Steps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Habits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Calories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center), // Icon for the Workout page
            label: 'Workout',
          ),
        ],
        currentIndex: _currentIndex, // Current index for navigation
        onTap: _onItemTapped, // Handler for item taps
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
