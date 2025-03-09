import 'package:flutter/material.dart';
import '../models/topic_model.dart';

class TopicCard extends StatelessWidget {
  final Topic topic;
  final VoidCallback onTap;

  const TopicCard({
    Key? key,
    required this.topic,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.book_outlined,
                    color: theme.primaryColor,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      topic.title,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      topic.progress,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: topic.completedCount / topic.totalCount,
                backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

