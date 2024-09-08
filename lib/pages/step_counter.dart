import 'package:fitsplit/pages/habit_tracker.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler

class StepCounter extends StatefulWidget {
  const StepCounter({super.key});

  @override
  State<StepCounter> createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  late Stream<StepCount> _stepCountStream;
  int _steps = 0;
  String _error = '';
  DateTime _lastResetDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _initializeSettings();
  }

  Future<void> _initializeSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve last reset date and steps
    int? lastResetTimestamp = prefs.getInt('lastResetDate');
    _steps = prefs.getInt('steps') ?? 0;

    if (lastResetTimestamp != null) {
      _lastResetDate = DateTime.fromMillisecondsSinceEpoch(lastResetTimestamp);

      // Check if a new day has started
      if (_isNewDay()) {
        _resetSteps();
      }
    } else {
      _resetSteps();
    }

    // Request permissions and start listening
    await _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    final status = await Permission.activityRecognition.request();
    if (status.isGranted) {
      _startListening(); // Call your step counter start method
    } else {
      // Handle the case where permissions are not granted
      setState(() {
        _error = 'Permission denied. Cannot access step count.';
      });
    }
  }

  bool _isNewDay() {
    DateTime now = DateTime.now();
    return now.year != _lastResetDate.year ||
        now.month != _lastResetDate.month ||
        now.day != _lastResetDate.day;
  }

  void _resetSteps() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('steps', 0);
    prefs.setInt('lastResetDate', DateTime.now().millisecondsSinceEpoch);
    setState(() {
      _steps = 0;
    });
  }

  void _startListening() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(_onStepCount).onError(_onError);
  }

  void _onStepCount(StepCount event) async {
    DateTime today = DateTime.now();
    String dateKey = DateFormat('yyyy-MM-dd').format(today);

    setState(() {
      _steps = event.steps;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('steps_$dateKey', _steps);
  }

  void _onError(error) {
    print('Error: $error');
    setState(() {
      _error = 'Failed to get step count. Error: $error';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FIT SPLIT PRO",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Steps Taken Today:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              _error.isNotEmpty ? _error : _steps.toString(),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.directions_walk,
              size: 100,
              color: Colors.black54,
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const HabitTracker()),
            //     );
            //   },
            //   child: const Text('View Habit Tracker'),
            // ),
          ],
        ),
      ),
    );
  }
}
