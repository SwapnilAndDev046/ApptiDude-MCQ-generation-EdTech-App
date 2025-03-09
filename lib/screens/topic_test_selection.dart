import 'package:flutter/material.dart';
import '../models/topic_model.dart';
import '../data/initial_questions.dart'; // Import your questions list
import 'test_interface_screen.dart';

class TopicTestSelectionScreen extends StatelessWidget {
  final List<TopicCategory> categories;

  const TopicTestSelectionScreen({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter out categories whose title contains "NON VERBAL REASONING"
    final filteredCategories = categories
        .where(
            (cat) => !cat.title.toLowerCase().contains('non verbal reasoning'))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Topic Test Selection'),
      ),
      body: ListView.builder(
        itemCount: filteredCategories.length,
        itemBuilder: (context, catIndex) {
          final category = filteredCategories[catIndex];
          return ExpansionTile(
            title: Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            children: category.topics.map((topic) {
              return ListTile(
                title: Text(topic.title),
                // Debug info (optional)
                trailing: ElevatedButton(
                  onPressed: () {
                    // Fetch questions from initial_questions.dart by subtopic id
                    final questions = initialQuestions
                        .where((q) => q.subtopicId == topic.id)
                        .toList();

                    // Navigate to TestInterfaceScreen with the fetched questions
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestInterfaceScreen(
                          questions: questions,
                        ),
                      ),
                    );
                  },
                  child: const Text('Start Test'),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
