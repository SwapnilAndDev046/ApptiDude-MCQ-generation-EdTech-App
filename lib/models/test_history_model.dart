class TestHistory {
  final int? id; // Auto-incremented by the database
  final int userId; // ID of the user who took the test
  final String testType; // e.g., "Quick Test", "Topic Test", "Full Mock Test"
  final int score;
  final int totalQuestions;
  final String date; // ISO format: "2025-03-08T12:34:56"
  final String? topic; // Optional, for topic tests

  TestHistory({
    this.id,
    required this.userId,
    required this.testType,
    required this.score,
    required this.totalQuestions,
    required this.date,
    this.topic,
  });

  factory TestHistory.fromMap(Map<String, dynamic> map) {
    return TestHistory(
      id: map['id'] as int?,
      userId: map['user_id'] as int,
      testType: map['test_type'] as String,
      score: map['score'] as int,
      totalQuestions: map['total_questions'] as int,
      date: map['date'] as String,
      topic: map['topic'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{
      'user_id': userId,
      'test_type': testType,
      'score': score,
      'total_questions': totalQuestions,
      'date': date,
    };
    if (topic != null) {
      data['topic'] = topic;
    }
    return data;
  }
}
