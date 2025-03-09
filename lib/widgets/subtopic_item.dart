import 'package:flutter/material.dart';
import '../models/topic_model.dart';

class SubtopicItem extends StatelessWidget {
  final SubTopic subtopic;
  final Function(bool?) onCompletionChanged;
  final Function(String) onNotesChanged;
  final VoidCallback onProblemLinkTap;

  const SubtopicItem({
    Key? key,
    required this.subtopic,
    required this.onCompletionChanged,
    required this.onNotesChanged,
    required this.onProblemLinkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(left: 24, right: 16, top: 4, bottom: 4),
      elevation: 0,
      color: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row with checkbox
            Row(
              children: [
                Checkbox(
                  value: subtopic.isCompleted,
                  onChanged: onCompletionChanged,
                ),
                Expanded(
                  child: Text(
                    subtopic.title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      decoration: subtopic.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                      color: subtopic.isCompleted
                          ? theme.textTheme.bodySmall?.color
                          : theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ),
              ],
            ),
            // Display notes if available
            if (subtopic.notes != null && subtopic.notes!.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(left: 36, top: 4, bottom: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  subtopic.notes!,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            // Action chips
            Padding(
              padding: const EdgeInsets.only(left: 36),
              child: Wrap(
                spacing: 8,
                children: [
                  ActionChip(
                    avatar: const Icon(Icons.link, size: 16),
                    label: const Text('Problem Link'),
                    onPressed: onProblemLinkTap,
                  ),
                  ActionChip(
                    avatar: Icon(
                      subtopic.isCompleted
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      size: 16,
                    ),
                    label: const Text('Done'),
                    onPressed: () => onCompletionChanged(!subtopic.isCompleted),
                  ),
                  ActionChip(
                    avatar: const Icon(Icons.note_alt_outlined, size: 16),
                    label: const Text('Notes'),
                    onPressed: () {
                      _showNotesDialog(context);
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

  void _showNotesDialog(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: subtopic.notes);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Notes for ${subtopic.title}'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Add your notes here...',
          ),
          maxLines: 5,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              onNotesChanged(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
