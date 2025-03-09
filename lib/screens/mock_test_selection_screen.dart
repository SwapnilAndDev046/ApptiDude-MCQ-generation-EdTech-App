// import 'dart:math';
import 'package:flutter/material.dart';
// import '../models/question_model.dart';
import '../databases/database_helper.dart';
import '../screens/full_mock_test_screen.dart'; // Updated import for full mock test interface
import '../data/initial_questions.dart'; // Local data for testing

class MockTestSelectionScreen extends StatefulWidget {
  final Map<String, dynamic> user;

  const MockTestSelectionScreen({Key? key, required this.user})
      : super(key: key);

  @override
  State<MockTestSelectionScreen> createState() =>
      _MockTestSelectionScreenState();
}

class _MockTestSelectionScreenState extends State<MockTestSelectionScreen> {
  int selectedQuestions = 50;
  String selectedDifficulty = 'easy';
  bool _isLoading = false;

  final List<int> _numberOptions = [50, 90];
  final List<String> _difficultyOptions = ['easy', 'medium', 'hard'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Mock Test'),
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
                  'Customize Your Mock Test',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Select your preferences and start the mock test',
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
                            bool isSelected = number == selectedQuestions;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedQuestions = number;
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
                            bool isSelected = diff == selectedDifficulty;
                            Color diffColor;
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
                                  selectedDifficulty = diff;
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
                    onPressed: _isLoading ? null : _startMockTest,
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

  Future<void> _startMockTest() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final dbHelper = DatabaseHelper();
      // Convert difficulty to lowercase to match stored values (e.g., "easy")
      final difficultyLower = selectedDifficulty.toLowerCase();

      // Option 1: Fetch questions from the database.
      final dbQuestions = await dbHelper.getRandomQuestionsByDifficulty(
        9999, // High limit to fetch all matching questions.
        difficultyLower,
      );
      print(
          "DB: Fetched ${dbQuestions.length} questions for difficulty $difficultyLower");

      // If database returns no questions, fall back to local data.
      final allQuestions = dbQuestions.isNotEmpty
          ? dbQuestions
          : initialQuestions
              .where((q) => q.difficulty.toLowerCase() == difficultyLower)
              .toList();
      print("Total questions available: ${allQuestions.length}");

      // Shuffle and select the desired number of questions.
      allQuestions.shuffle();
      final mockQuestions = allQuestions.take(selectedQuestions).toList();

      if (mockQuestions.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("No questions available for selected criteria")),
        );
        return;
      }

      // Set time limit based on selected questions.
      final timeLimit = (selectedQuestions == 50) ? 120 : 145;

      // Navigate to FullMockTestScreen with required parameters.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullMockTestScreen(
            user: widget.user,
            questions: mockQuestions,
            numberOfQuestions: selectedQuestions,
            difficulty: selectedDifficulty,
            testDurationMinutes: timeLimit,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching questions: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
