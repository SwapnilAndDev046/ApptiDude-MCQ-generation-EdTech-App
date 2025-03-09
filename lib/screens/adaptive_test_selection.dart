import 'package:flutter/material.dart';
import 'adaptive_test_interface.dart';

class AdaptiveTestSelectionScreen extends StatelessWidget {
  /// Optional user map if you need user info. Remove if not needed.
  final Map<String, dynamic>? user;

  /// Example of a configurable total questions. Adjust or remove as needed.
  final int totalQuestions;

  const AdaptiveTestSelectionScreen({
    Key? key,
    this.user, // make optional or remove if not needed
    this.totalQuestions = 50, // default to 50 if not provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Test Selection'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the Adaptive Test Interface screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdaptiveTestInterfaceScreen(
                  // Pass user & totalQuestions if needed
                  user: user,
                  totalQuestions: totalQuestions,
                ),
              ),
            );
          },
          child: const Text('Start Adaptive Test'),
        ),
      ),
    );
  }
}
