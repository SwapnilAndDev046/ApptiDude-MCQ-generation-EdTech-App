import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting
import '../databases/database_helper.dart';
import '../models/test_history_model.dart';
import '../screens/quick_test_selection_screen.dart'; // Make sure this file exists

class ResultsScreen extends StatefulWidget {
  final int userId; // The current signed-in user's ID
  final int score; // Number of questions answered correctly
  final int totalQuestions; // Total number of questions in the test

  const ResultsScreen({
    Key? key,
    required this.userId,
    required this.score,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late Future<List<TestHistory>> _historyFuture;

  @override
  void initState() {
    super.initState();
    // Insert current test history and then load history.
    _insertCurrentTestHistory();
    _loadHistory();
  }

  /// Inserts the current test result into the test_history table.
  Future<void> _insertCurrentTestHistory() async {
    final dbHelper = DatabaseHelper();
    await dbHelper.insertTestHistory(
      TestHistory(
        userId: widget.userId,
        testType: 'Quick Test', // Change accordingly if needed
        score: widget.score,
        totalQuestions: widget.totalQuestions,
        date: DateTime.now().toIso8601String(),
        topic: null, // For topic tests, pass the topic name here
      ),
    );
  }

  /// Loads the test history for the current user.
  void _loadHistory() {
    _historyFuture = DatabaseHelper().getTestHistoryForUser(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Results & History'),
      ),
      body: FutureBuilder<List<TestHistory>>(
        future: _historyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No test history available"));
          } else {
            final history = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildScoreCard(context),
                  const SizedBox(height: 24),
                  Text(
                    'Recent Tests',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: history.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final record = history[index];
                      final dateTime = DateTime.parse(record.date);
                      final formattedDate =
                          DateFormat('yyyy-MM-dd  HH:mm').format(dateTime);
                      return ListTile(
                        title: Text(
                          record.testType +
                              (record.topic != null
                                  ? ' - ${record.topic}'
                                  : ''),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          "Score: ${record.score ?? 'N/A'}/${record.totalQuestions ?? 'N/A'}  $formattedDate",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.visibility_outlined),
                          onPressed: () {
                            // Optionally, navigate to a detailed result view.
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Performance Analysis',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  _buildPerformanceAnalysis(context),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Retry Test button: start Quick Test Selection
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuickTestSelectionScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Retry Test'),
                ),
              ),
              const SizedBox(width: 16),
              // Back to Home button: navigate to Dashboard with test tab active
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    // Pass arguments if needed (e.g., initialIndex: 1 for test section)
                    Navigator.pushReplacementNamed(
                      context,
                      '/dashboard',
                      arguments: {
                        'initialIndex': 1,
                        // Add other user details if necessary
                      },
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: Score label and count
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Score',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  '${widget.score}/${widget.totalQuestions} Correct',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            // Right side: Circular percentage display
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: Center(
                child: Text(
                  '${((widget.score / widget.totalQuestions) * 100).toInt()}%',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceAnalysis(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPerformanceItem(
              context,
              'Strengths',
              'Number Systems, Percentages',
              Icons.trending_up,
              Colors.green,
            ),
            const Divider(),
            _buildPerformanceItem(
              context,
              'Areas to Improve',
              'Profit & Loss, Averages',
              Icons.trending_down,
              Colors.orange,
            ),
            const Divider(),
            _buildPerformanceItem(
              context,
              'Suggested Topics',
              'Ratio & Proportion, Simple Interest',
              Icons.lightbulb_outline,
              Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceItem(
    BuildContext context,
    String title,
    String content,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
