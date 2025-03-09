import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/question_model.dart';
import '../models/test_history_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'apti_dude.db');
    return await openDatabase(
      path,
      version: 2, // Bump to version 2
      onCreate: (db, version) async {
        // Create questions table
        await db.execute('''
          CREATE TABLE questions (
            id INTEGER PRIMARY KEY,
            subtopic_id INTEGER,
            question TEXT,
            option1 TEXT,
            option2 TEXT,
            option3 TEXT,
            option4 TEXT,
            option5 TEXT,
            answer TEXT,
            difficulty TEXT
          )
        ''');
        // Create users table
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT UNIQUE,
            password TEXT
          )
        ''');
        // Create test_history table
        await db.execute('''
          CREATE TABLE test_history (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            test_type TEXT,
            score INTEGER,
            total_questions INTEGER,
            date TEXT,
            topic TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // If the DB was version 1, create test_history now
        if (oldVersion < 2) {
          await db.execute('''
            CREATE TABLE IF NOT EXISTS test_history (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              user_id INTEGER,
              test_type TEXT,
              score INTEGER,
              total_questions INTEGER,
              date TEXT,
              topic TEXT
            )
          ''');
        }
      },
    );
  }

  // Insert a new user
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('users', user);
  }

  // Get a user by email
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  // Update a user by id
  Future<int> updateUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.update(
      'users',
      user,
      where: 'id = ?',
      whereArgs: [user['id']],
    );
  }

  // Insert a new question
  Future<int> insertQuestion(Question question) async {
    final db = await database;
    return await db.insert('questions', question.toMap());
  }

  // Fetch random questions for Quick Test
  Future<List<Question>> getRandomQuestions(int limit) async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT * FROM questions ORDER BY RANDOM() LIMIT ?',
      [limit],
    );
    return result.map((row) => Question.fromMap(row)).toList();
  }

  // Fetch questions by subtopic for Topic Test
  Future<List<Question>> getQuestionsBySubtopic(int subtopicId) async {
    final db = await database;
    final result = await db.query(
      'questions',
      where: 'subtopic_id = ?',
      whereArgs: [subtopicId],
    );
    return result.map((row) => Question.fromMap(row)).toList();
  }

  // Fetch random questions for Quick Test filtered by difficulty (case-insensitive)
  Future<List<Question>> getRandomQuestionsByDifficulty(
      int limit, String difficulty) async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT * FROM questions WHERE LOWER(difficulty) = ? ORDER BY RANDOM() LIMIT ?',
      [difficulty.toLowerCase(), limit],
    );
    return result.map((row) => Question.fromMap(row)).toList();
  }

  // Insert a new test history record
  Future<int> insertTestHistory(TestHistory history) async {
    final db = await database;
    return await db.insert('test_history', history.toMap());
  }

  // Fetch test history for a specific user by userId
  Future<List<TestHistory>> getTestHistoryForUser(int userId) async {
    final db = await database;
    final result = await db.query(
      'test_history',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'date DESC',
    );
    return result.map((row) => TestHistory.fromMap(row)).toList();
  }
}
