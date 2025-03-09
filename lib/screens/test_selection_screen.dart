import 'package:flutter/material.dart';
import 'quick_test_selection_screen.dart';
// If you have a topic-based test screen or a full mock test screen, import them too

class TestSelectionScreen extends StatelessWidget {
  const TestSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Test Type'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Quick Test
            ElevatedButton(
              onPressed: () {
                // Navigate to QuickTestSelectionScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuickTestSelectionScreen(),
                  ),
                );
              },
              child: const Text('Quick Test'),
            ),
            const SizedBox(height: 16),

            // Topic Test
            ElevatedButton(
              onPressed: () {
                // TODO: Implement your Topic Test flow here
                // For example: Navigator.push(context, MaterialPageRoute(...));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Topic Test not implemented yet')),
                );
              },
              child: const Text('Topic Test'),
            ),
            const SizedBox(height: 16),

            // Full Mock Test
            ElevatedButton(
              onPressed: () {
                // TODO: Implement your Full Mock Test flow here
                // e.g., fetch 50 questions from DB or initial_questions.dart
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Full Mock Test not implemented yet')),
                );
              },
              child: const Text('Full Mock Test'),
            ),
          ],
        ),
      ),
    );
  }
}
