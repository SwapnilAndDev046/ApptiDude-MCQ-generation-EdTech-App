import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../databases/database_helper.dart';
import '../data/initial_questions.dart';
import 'results_screen.dart'; // Adjust the import path if needed

class AdaptiveTestInterfaceScreen extends StatefulWidget {
  final Map<String, dynamic>? user;
  final int totalQuestions;

  const AdaptiveTestInterfaceScreen({
    Key? key,
    this.user,
    this.totalQuestions = 50,
  }) : super(key: key);

  @override
  _AdaptiveTestInterfaceScreenState createState() =>
      _AdaptiveTestInterfaceScreenState();
}

class _AdaptiveTestInterfaceScreenState
    extends State<AdaptiveTestInterfaceScreen> {
  bool isLoading = true;

  // Tracking variables
  int currentQuestionNumber = 0;
  int consecutiveCorrect = 0;
  int score = 0;
  String currentDifficulty = 'easy';
  String selectedAnswer = '';

  // Holds fetched questions grouped by difficulty.
  final Map<String, List<Question>> questionsByDifficulty = {
    'easy': [],
    'medium': [],
    'hard': [],
  };

  Question? currentQuestion;

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  /// Fetch questions for each difficulty from the DB.
  /// If none found, fallback to local data in [initialQuestions].
  Future<void> _fetchQuestions() async {
    setState(() => isLoading = true);

    final dbHelper = DatabaseHelper();

    for (String diff in ['easy', 'medium', 'hard']) {
      // Fetch from DB
      List<Question> dbQuestions =
          await dbHelper.getRandomQuestionsByDifficulty(9999, diff);

      // Fallback to local data if DB returns none.
      List<Question> allQuestions = dbQuestions.isNotEmpty
          ? dbQuestions
          : initialQuestions
              .where((q) => q.difficulty.toLowerCase() == diff)
              .toList();

      allQuestions.shuffle();
      questionsByDifficulty[diff] = allQuestions;
    }

    setState(() {
      isLoading = false;
    });
    _loadNextQuestion();
  }

  /// Collects all non-empty option fields into a single list for display.
  List<String> _getOptions(Question q) {
    final options = <String>[];

    if (q.option1.trim().isNotEmpty) options.add(q.option1);
    if (q.option2.trim().isNotEmpty) options.add(q.option2);
    if (q.option3.trim().isNotEmpty) options.add(q.option3);
    if (q.option4.trim().isNotEmpty) options.add(q.option4);

    // option5 might be null or empty
    if (q.option5 != null && q.option5!.trim().isNotEmpty) {
      options.add(q.option5!);
    }

    return options;
  }

  /// Loads the next question based on the current difficulty.
  void _loadNextQuestion() {
    if (currentQuestionNumber >= widget.totalQuestions) {
      // All questions answered, navigate to results.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            userId: widget.user?['userId'] ?? 'UnknownUser',
            score: score,
            totalQuestions: widget.totalQuestions,
          ),
        ),
      );
      return;
    }

    // Get questions for the current difficulty.
    List<Question> available = questionsByDifficulty[currentDifficulty] ?? [];

    if (available.isEmpty) {
      // Fallback to any available question if none remain for this difficulty.
      List<Question> fallback = [];
      questionsByDifficulty.values.forEach((list) => fallback.addAll(list));
      fallback.shuffle();

      if (fallback.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No questions available.')),
        );
        return;
      } else {
        currentQuestion = fallback.removeAt(0);
      }
    } else {
      currentQuestion = available.removeAt(0);
    }

    currentQuestionNumber++;
    setState(() {});
  }

  /// Checks the selected answer, updates difficulty logic, and loads next question.
  void _submitAnswer(String userSelection) {
    if (currentQuestion == null) return;

    // Compare ignoring case/spaces
    bool isCorrect = userSelection.trim().toLowerCase() ==
        currentQuestion!.answer.trim().toLowerCase();

    setState(() {
      if (isCorrect) {
        score++;
        consecutiveCorrect++;

        // Increase difficulty after 3 consecutive correct answers.
        if (consecutiveCorrect >= 3 && currentDifficulty != 'hard') {
          if (currentDifficulty == 'easy') {
            currentDifficulty = 'medium';
          } else if (currentDifficulty == 'medium') {
            currentDifficulty = 'hard';
          }
          consecutiveCorrect = 0;
        }
      } else {
        // On an incorrect answer, reset consecutive count & possibly lower difficulty.
        consecutiveCorrect = 0;
        if (currentDifficulty == 'hard') {
          currentDifficulty = 'medium';
        } else if (currentDifficulty == 'medium') {
          currentDifficulty = 'easy';
        }
      }
    });

    selectedAnswer = '';
    _loadNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    // Gather the options for the current question.
    final options =
        currentQuestion != null ? _getOptions(currentQuestion!) : [];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adaptive Test ($currentQuestionNumber/${widget.totalQuestions})',
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : currentQuestion == null
              ? const Center(child: Text('No question available.'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Display current difficulty.
                      // Text(
                      //   'Difficulty: ${currentDifficulty.toUpperCase()}',
                      //   style: const TextStyle(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      const SizedBox(height: 16),
                      // Display question text.
                      Text(
                        currentQuestion!.questionText,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 24),
                      // Display the collected options in a ListView.
                      Expanded(
                        child: ListView.builder(
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            final option = options[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              child: RadioListTile<String>(
                                title: Text(option),
                                value: option,
                                groupValue: selectedAnswer,
                                onChanged: (value) {
                                  setState(() {
                                    selectedAnswer = value ?? '';
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      // Submit Answer button.
                      ElevatedButton(
                        onPressed: selectedAnswer.isEmpty
                            ? null
                            : () => _submitAnswer(selectedAnswer),
                        child: const Text('Submit Answer'),
                      ),
                    ],
                  ),
                ),
    );
  }
}
