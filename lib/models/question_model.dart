class Question {
  final int id;
  final int subtopicId; // corresponds to the subtopic's unique id
  final String questionText;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String? option5; // Optional fifth option
  final String answer;
  final String difficulty; // e.g., 'easy', 'medium', 'hard'

  Question({
    required this.id,
    required this.subtopicId,
    required this.questionText,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    this.option5, // If the question only has 4 options, leave this null
    required this.answer,
    required this.difficulty,
  });

  // Convert a Map into a Question
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as int,
      subtopicId: map['subtopic_id'] as int,
      questionText: map['question'] as String,
      option1: map['option1'] as String,
      option2: map['option2'] as String,
      option3: map['option3'] as String,
      option4: map['option4'] as String,
      option5: map['option5'] as String?, // may be null if not provided
      answer: map['answer'] as String,
      difficulty: map['difficulty'] as String,
    );
  }

  // Convert a Question into a Map (for inserting/updating)
  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{
      'id': id,
      'subtopic_id': subtopicId,
      'question': questionText,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'answer': answer,
      'difficulty': difficulty,
    };
    // Only add option5 if it is not null
    if (option5 != null) {
      data['option5'] = option5;
    }
    return data;
  }
}
