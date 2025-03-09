import 'dart:async';
import 'package:flutter/material.dart';
import '../models/question_model.dart';

class FullMockTestScreen extends StatefulWidget {
  final List<Question> questions;
  final dynamic user; // Optional user data
  final int numberOfQuestions; // e.g., 50 or 90
  final String difficulty; // e.g., 'easy', 'medium', 'hard'
  final int testDurationMinutes; // e.g., 120 for 50, 145 for 90

  const FullMockTestScreen({
    Key? key,
    required this.questions,
    this.user,
    required this.numberOfQuestions,
    required this.difficulty,
    required this.testDurationMinutes,
  }) : super(key: key);

  @override
  State<FullMockTestScreen> createState() => _FullMockTestScreenState();
}

class _FullMockTestScreenState extends State<FullMockTestScreen> {
  int _currentQuestionIndex = 0;
  // Maintain a list of selected answer indices per question
  late List<int?> _selectedAnswers;
  int _correctAnswersCount = 0;
  // bool _isSubmitted = false;

  // Timer variables for full mock test mode.
  Timer? _timer;
  late int _remainingTime; // in seconds

  // Placeholder user ID; replace with actual user ID from your login logic.
  final int currentUserId = 1;

  @override
  void initState() {
    super.initState();
    // Initialize the selected answers list with nulls.
    _selectedAnswers = List<int?>.filled(widget.questions.length, null);
    // Set remaining time based on the provided test duration.
    _remainingTime = widget.testDurationMinutes * 60;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Start a countdown timer.
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime <= 0) {
        timer.cancel();
        _submitTest();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  // Format remaining time as mm:ss.
  String _formattedTime() {
    final minutes = _remainingTime ~/ 60;
    final seconds = _remainingTime % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // Calculate the total correct answers.
  void _calculateScore() {
    _correctAnswersCount = 0;
    for (int i = 0; i < widget.questions.length; i++) {
      final question = widget.questions[i];
      final options = [
        question.option1,
        question.option2,
        question.option3,
        question.option4,
      ];
      if (_selectedAnswers[i] != null &&
          options[_selectedAnswers[i]!] == question.answer) {
        _correctAnswersCount++;
      }
    }
  }

  // Submit the test and navigate to the results screen.
  void _submitTest() {
    _timer?.cancel();
    _calculateScore();
    Navigator.pushReplacementNamed(
      context,
      '/results',
      arguments: {
        'userId': currentUserId,
        'score': _correctAnswersCount,
        'totalQuestions': widget.questions.length,
      },
    );
  }

  // Navigate to the next question if available.
  void _nextQuestion() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  // Navigate to the previous question if available.
  void _prevQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  // Jump to a specific question via drop-up navigator.
  void _jumpToQuestion(int index) {
    setState(() {
      _currentQuestionIndex = index;
    });
  }

  // Show a drop-up panel with a grid of question numbers.
  void _showQuestionNavigator() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.4,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: widget.questions.length,
            itemBuilder: (context, index) {
              bool attempted = _selectedAnswers[index] != null;
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _jumpToQuestion(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: attempted ? Colors.green : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: attempted ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[_currentQuestionIndex];
    final List<String> options = [
      currentQuestion.option1,
      currentQuestion.option2,
      currentQuestion.option3,
      currentQuestion.option4,
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Question ${_currentQuestionIndex + 1} of ${widget.questions.length}'),
            Text(
              'Time Left: ${_formattedTime()}',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / widget.questions.length,
              backgroundColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
            // Question text and options
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentQuestion.questionText,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 32),
                    ...List.generate(options.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: () => _selectAnswer(index),
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    _selectedAnswers[_currentQuestionIndex] ==
                                            index
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              color: _selectedAnswers[_currentQuestionIndex] ==
                                      index
                                  ? Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              options[index],
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            // Bottom navigation: Previous, Go To (Navigator), Next/Submit button.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: _currentQuestionIndex > 0 ? _prevQuestion : null,
                  ),
                  ElevatedButton(
                    onPressed: _showQuestionNavigator,
                    child: const Text('Go To'),
                  ),
                  IconButton(
                    icon: Icon(
                      _currentQuestionIndex == widget.questions.length - 1
                          ? Icons.check
                          : Icons.chevron_right,
                    ),
                    onPressed: () {
                      if (_currentQuestionIndex ==
                          widget.questions.length - 1) {
                        _submitTest();
                      } else {
                        _nextQuestion();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// When an option is tapped, save the selection.
  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswers[_currentQuestionIndex] = index;
    });
  }

  /// Returns true if the selected answer for the current question is correct.
  bool _isAnswerCorrect() {
    final question = widget.questions[_currentQuestionIndex];
    final List<String> options = [
      question.option1,
      question.option2,
      question.option3,
      question.option4,
    ];
    final selectedIndex = _selectedAnswers[_currentQuestionIndex];
    if (selectedIndex == null) return false;
    return options[selectedIndex] == question.answer;
  }

  /// Submit the test: calculate score and navigate to results screen.
  void _finishTest() {
    _timer?.cancel();
    // Calculate total correct answers.
    _correctAnswersCount = 0;
    for (int i = 0; i < widget.questions.length; i++) {
      final question = widget.questions[i];
      final List<String> options = [
        question.option1,
        question.option2,
        question.option3,
        question.option4,
      ];
      if (_selectedAnswers[i] != null &&
          options[_selectedAnswers[i]!] == question.answer) {
        _correctAnswersCount++;
      }
    }
    Navigator.pushReplacementNamed(
      context,
      '/results',
      arguments: {
        'userId': currentUserId,
        'score': _correctAnswersCount,
        'totalQuestions': widget.questions.length,
      },
    );
  }
}
