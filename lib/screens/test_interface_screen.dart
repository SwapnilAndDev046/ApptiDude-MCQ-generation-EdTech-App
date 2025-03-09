import 'package:flutter/material.dart';
import '../models/question_model.dart';

class TestInterfaceScreen extends StatefulWidget {
  final List<Question> questions;
  final dynamic user; // Optional user data for quick/topic test
  final int? numberOfQuestions; // Optional
  final String? difficulty; // Optional

  const TestInterfaceScreen({
    Key? key,
    required this.questions,
    this.user,
    this.numberOfQuestions,
    this.difficulty,
  }) : super(key: key);

  @override
  State<TestInterfaceScreen> createState() => _TestInterfaceScreenState();
}

class _TestInterfaceScreenState extends State<TestInterfaceScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex;
  bool _isAnswerSubmitted = false;
  int _correctAnswersCount = 0;

  // Placeholder user ID; replace with actual user ID from login logic if needed.
  final int currentUserId = 1;

  @override
  Widget build(BuildContext context) {
    // If no questions, show a message.
    if (widget.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Test')),
        body: const Center(child: Text("No questions available")),
      );
    }

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
        title: Text(
          'Question ${_currentQuestionIndex + 1}/${widget.questions.length}',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar (question-based, no timer)
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / widget.questions.length,
              backgroundColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display question text
                    Text(
                      currentQuestion.questionText,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 32),
                    // Display options
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
                                color: _getOptionBorderColor(index),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              color: _getOptionBackgroundColor(index),
                            ),
                            child: Row(
                              children: [
                                // Radio-like circle
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _getOptionBorderColor(index),
                                      width: 2,
                                    ),
                                    color: _selectedAnswerIndex == index
                                        ? _getOptionBorderColor(index)
                                        : Colors.transparent,
                                  ),
                                  child: _isAnswerSubmitted &&
                                          _isCorrectIndex(index)
                                      ? const Icon(
                                          Icons.check,
                                          size: 16,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 16),
                                // Option text
                                Expanded(
                                  child: Text(
                                    options[index],
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            // Submit/Next/Finish button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          _isAnswerSubmitted ? _nextOrFinish : _submitAnswer,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(56),
                      ),
                      child: Text(_getButtonLabel()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Called when an option is tapped, if the answer isn't already submitted.
  void _selectAnswer(int index) {
    if (!_isAnswerSubmitted) {
      setState(() {
        _selectedAnswerIndex = index;
      });
    }
  }

  /// Submit the current question's answer if one is selected and not yet submitted.
  void _submitAnswer() {
    if (_selectedAnswerIndex != null && !_isAnswerSubmitted) {
      if (_isCorrectIndex(_selectedAnswerIndex!)) {
        _correctAnswersCount++;
      }
      setState(() {
        _isAnswerSubmitted = true;
      });
    }
  }

  /// Moves to the next question or finishes the test if it's the last question.
  void _nextOrFinish() {
    bool isLastQuestion = _currentQuestionIndex == widget.questions.length - 1;
    if (!isLastQuestion) {
      _nextQuestion();
    } else {
      _finishTest();
    }
  }

  /// Go to the next question.
  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _selectedAnswerIndex = null;
      _isAnswerSubmitted = false;
    });
  }

  /// Finish the test and navigate to results.
  void _finishTest() {
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

  /// Checks if the option at [index] is correct for the current question.
  bool _isCorrectIndex(int index) {
    final currentQuestion = widget.questions[_currentQuestionIndex];
    final List<String> options = [
      currentQuestion.option1,
      currentQuestion.option2,
      currentQuestion.option3,
      currentQuestion.option4,
    ];
    return options[index] == currentQuestion.answer;
  }

  /// Returns the border color for each option.
  Color _getOptionBorderColor(int index) {
    if (!_isAnswerSubmitted) {
      return _selectedAnswerIndex == index
          ? Theme.of(context).primaryColor
          : Theme.of(context).colorScheme.outline;
    } else {
      if (_isCorrectIndex(index)) {
        return Colors.green;
      } else if (index == _selectedAnswerIndex) {
        return Colors.red;
      } else {
        return Theme.of(context).colorScheme.outline;
      }
    }
  }

  /// Returns the background color for each option.
  Color _getOptionBackgroundColor(int index) {
    if (!_isAnswerSubmitted) {
      return _selectedAnswerIndex == index
          ? Theme.of(context).primaryColor.withOpacity(0.1)
          : Colors.transparent;
    } else {
      if (_isCorrectIndex(index)) {
        return Colors.green.withOpacity(0.1);
      } else if (index == _selectedAnswerIndex) {
        return Colors.red.withOpacity(0.1);
      } else {
        return Colors.transparent;
      }
    }
  }

  /// Returns the label for the bottom button (Submit/Next/Finish).
  String _getButtonLabel() {
    bool isLastQuestion = _currentQuestionIndex == widget.questions.length - 1;
    if (!isLastQuestion) {
      return _isAnswerSubmitted ? 'Next Question' : 'Submit Answer';
    } else {
      return _isAnswerSubmitted ? 'Finish Test' : 'Submit Test';
    }
  }
}
