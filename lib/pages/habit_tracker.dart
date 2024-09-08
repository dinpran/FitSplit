import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class HabitTracker extends StatefulWidget {
  const HabitTracker({super.key});

  @override
  State<HabitTracker> createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  Map<String, int> _dailySteps = {};

  @override
  void initState() {
    super.initState();
    _loadSteps();
  }

  Future<void> _loadSteps() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    final Map<String, int> steps = {};
    for (var key in keys) {
      if (key.startsWith('steps_')) {
        final date = key.substring(6);
        final stepsCount = prefs.getInt(key) ?? 0;
        steps[date] = stepsCount;
      }
    }

    setState(() {
      _dailySteps = steps;
    });
  }

  String _formatDate(String date) {
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HABIT TRACKER",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _dailySteps.isEmpty
          ? Center(
              child: Text(
                'No data available',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView(
              children: _dailySteps.entries.map((entry) {
                return ListTile(
                  title: Text(_formatDate(entry.key)),
                  trailing: Text('${entry.value} steps'),
                );
              }).toList(),
            ),
    );
  }
}
