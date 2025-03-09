import 'dart:math';
import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../data/initial_questions.dart';
import 'test_interface_screen.dart';

class QuickTestSelectionScreen extends StatefulWidget {
  const QuickTestSelectionScreen({Key? key}) : super(key: key);

  @override
  State<QuickTestSelectionScreen> createState() =>
      _QuickTestSelectionScreenState();
}

class _QuickTestSelectionScreenState extends State<QuickTestSelectionScreen> {
  int _selectedNumber = 10;
  String _selectedDifficulty = 'easy';
  bool _isLoading = false;

  final List<int> _numberOptions = [10, 20, 30];
  final List<String> _difficultyOptions = ['easy', 'medium', 'hard'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Test'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),

                // Header
                Text(
                  'Customize Your Test',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),

                const SizedBox(height: 8),
                Text(
                  'Select your preferences and start the quiz',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),

                const SizedBox(height: 40),

                // Number of Questions
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NUMBER OF QUESTIONS',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _numberOptions.map((number) {
                            bool isSelected = number == _selectedNumber;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedNumber = number;
                                });
                              },
                              child: Container(
                                width: 70,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  number.toString(),
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Difficulty
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DIFFICULTY LEVEL',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _difficultyOptions.map((diff) {
                            bool isSelected = diff == _selectedDifficulty;
                            Color diffColor;

                            // Color coding for difficulty levels
                            switch (diff) {
                              case 'easy':
                                diffColor = Colors.green;
                                break;
                              case 'medium':
                                diffColor = Colors.orange;
                                break;
                              case 'hard':
                                diffColor = Colors.red;
                                break;
                              default:
                                diffColor = Theme.of(context).primaryColor;
                            }

                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedDifficulty = diff;
                                });
                              },
                              child: Container(
                                width: 90,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? diffColor
                                      : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  diff.toUpperCase(),
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),

                // Start Button
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _startQuickTest,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'START TEST',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startQuickTest() async {
    setState(() {
      _isLoading = true;
    });

    // Filter questions from initial_questions.dart by difficulty
    List<Question> filtered = initialQuestions
        .where((q) => q.difficulty == _selectedDifficulty)
        .toList();

    // Shuffle them
    filtered.shuffle(Random());

    // Take only the selected number
    List<Question> selectedQuestions = filtered.take(_selectedNumber).toList();

    setState(() {
      _isLoading = false;
    });

    // Navigate to TestInterfaceScreen with selected questions
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TestInterfaceScreen(
          questions: selectedQuestions,
        ),
      ),
    );
  }
}
