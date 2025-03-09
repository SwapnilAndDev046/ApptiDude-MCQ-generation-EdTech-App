import 'package:flutter/material.dart';
import '../models/topic_model.dart';
import '../widgets/subtopic_item.dart';
import '../screens/in_app_browser_screen.dart'; // In-app browser screen

class LearnSectionScreen extends StatefulWidget {
  const LearnSectionScreen({Key? key}) : super(key: key);

  @override
  State<LearnSectionScreen> createState() => _LearnSectionScreenState();
}

class _LearnSectionScreenState extends State<LearnSectionScreen> {
  final List<TopicCategory> _topicCategories = getSampleTopicCategories();
  // String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Show filter options
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: _topicCategories.length,
        itemBuilder: (context, categoryIndex) {
          final category = _topicCategories[categoryIndex];

          return ExpansionTile(
            title: Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            initiallyExpanded: categoryIndex == 0,
            children: category.topics.map((topic) {
              return ExpansionTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        topic.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      topic.progress,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
                children: topic.subTopics.map((subtopic) {
                  return SubtopicItem(
                    subtopic: subtopic,
                    onCompletionChanged: (value) {
                      setState(() {
                        subtopic.isCompleted = value ?? false;
                      });
                    },
                    onNotesChanged: (notes) {
                      setState(() {
                        subtopic.notes = notes.isEmpty ? null : notes;
                      });
                    },
                    onProblemLinkTap: () {
                      if (subtopic.problemLink != null &&
                          subtopic.problemLink!.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InAppBrowserScreen(
                              url: subtopic.problemLink!,
                              title: subtopic.title,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("No problem link available")),
                        );
                      }
                    },
                  );
                }).toList(),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
