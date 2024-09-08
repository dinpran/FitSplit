import 'package:flutter/material.dart';
import 'food_data.dart';

class CalorieCounter extends StatefulWidget {
  const CalorieCounter({super.key});

  @override
  State<CalorieCounter> createState() => _CalorieCounterState();
}

class _CalorieCounterState extends State<CalorieCounter> {
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _servingController = TextEditingController();
  Map<String, double>? _nutritionalInfo;
  bool _isLoading = false;
  String _errorMessage = '';

  void _fetchNutritionalInfo(String food, double servingSize) {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    // Normalize input
    final normalizedFood = food.toLowerCase();
    final foodDetails = foodData[normalizedFood];

    if (foodDetails != null) {
      final servingSizeInGrams = foodDetails['serving_size']!;
      final scaleFactor = servingSize / servingSizeInGrams;

      setState(() {
        _nutritionalInfo = {
          'calories': foodDetails['calories']! * scaleFactor,
          'protein': foodDetails['protein']! * scaleFactor,
          'carbs': foodDetails['carbs']! * scaleFactor,
          'fats': foodDetails['fats']! * scaleFactor,
        };
        _errorMessage = '';
      });
    } else {
      setState(() {
        _errorMessage = 'No results found';
        _nutritionalInfo = null;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CALORIE COUNTER',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _foodController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter food item',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _servingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter serving size (grams)',
              ),
              keyboardType: TextInputType.number, // Correct use of keyboardType
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final food = _foodController.text;
                final servingSize =
                    double.tryParse(_servingController.text) ?? 100.0;
                _fetchNutritionalInfo(food, servingSize);
              },
              child: const Text('Get Nutritional Info'),
            ),
            SizedBox(height: 20),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_nutritionalInfo != null)
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      'Nutritional Information:',
                    ),
                    SizedBox(height: 10),
                    _buildNutritionalDetail(
                        'Calories', _nutritionalInfo!['calories']),
                    _buildNutritionalDetail(
                        'Protein', _nutritionalInfo!['protein']),
                    _buildNutritionalDetail(
                        'Carbs', _nutritionalInfo!['carbs']),
                    _buildNutritionalDetail('Fats', _nutritionalInfo!['fats']),
                  ],
                ),
              )
            else if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionalDetail(String label, double? value) {
    return ListTile(
      title: Text(label),
      trailing: Text(value != null ? '${value.toStringAsFixed(2)} g' : 'N/A'),
    );
  }
}
