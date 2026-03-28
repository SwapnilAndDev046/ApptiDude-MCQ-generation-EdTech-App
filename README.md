# 📚 ApptiDude – MCQ Generation EdTech App

ApptiDude is a Flutter-based educational application designed to help users practice and improve their knowledge through Multiple Choice Questions (MCQs). The app supports multiple test modes, adaptive quizzes, and topic-based learning to enhance performance.

---

## 🚀 Features

- Adaptive test system based on user performance  
- Multiple test modes: Full Mock, Topic-wise, Quick Tests  
- Result analysis and test history tracking  
- User authentication (Login & Signup)  
- Learn section with structured topics and subtopics  
- In-app browser for additional learning resources  
- Clean and responsive UI  

---

## 🏗️ Project Structure

🏗️ Project Structure

```plaintext
ApptiDude-MCQ-generation-EdTech-App/
├── android/                # Android platform code
├── ios/                    # iOS platform code
├── web/                    # Web platform support
├── windows/                # Windows platform support
├── macos/                  # macOS platform support
├── linux/                  # Linux platform support
├── test/                   # Test files

├── lib/                    # Main application code
│   ├── data/
│   │   └── initial_questions.dart
│   │
│   ├── databases/
│   │   └── database_helper.dart
│   │
│   ├── models/
│   │   ├── question_model.dart
│   │   ├── topic_model.dart
│   │   └── test_history_model.dart
│   │
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   ├── onboarding_screen.dart
│   │   ├── login_screen.dart
│   │   ├── sign_up_screen.dart
│   │   ├── dashboard_screen.dart
│   │   ├── profile_screen.dart
│   │   ├── learn_section_screen.dart
│   │   ├── test_selection_screen.dart
│   │   ├── topic_test_selection.dart
│   │   ├── quick_test_selection_screen.dart
│   │   ├── mock_test_selection_screen.dart
│   │   ├── adaptive_test_selection.dart
│   │   ├── adaptive_test_interface.dart
│   │   ├── full_mock_test_screen.dart
│   │   ├── test_interface_screen.dart
│   │   ├── results_screen.dart
│   │   ├── about_screen.dart
│   │   ├── help_support_screen.dart
│   │   └── in_app_browser_screen.dart
│   │
│   ├── widgets/
│   │   ├── topic_card.dart
│   │   └── subtopic_item.dart
│   │
│   ├── theme/
│   │   └── app_theme.dart
│   │
│   └── main.dart           # Entry point

├── .gitignore
├── README.md
├── pubspec.yaml
├── pubspec.lock
├── analysis_options.yaml
```


## 🛠️ Tech Stack

- Flutter (Dart)  
- SQLite (Local Database)  
- REST-ready structure (for future backend integration)  

---

## 📱 Core Functionalities

- Adaptive and static MCQ testing  
- Topic-based question selection  
- Real-time score calculation  
- Local storage of test history and questions  
- Smooth navigation across multiple screens  

---

## ▶️ Getting Started

1. Clone the repository  
   git clone https://github.com/your-username/your-repo-name.git  

2. Navigate to project folder  
   cd your-repo-name  

3. Install dependencies  
   flutter pub get  

4. Run the app  
   flutter run  

---

## 📌 Future Enhancements

- Backend integration (Spring Boot / Firebase)  
- Cloud-based data storage  
- Advanced performance analytics  
- User profile management  
- Multi-language support  

---

## 📧 Contact

GitHub: https://github.com/your-username  
LinkedIn: https://linkedin.com/in/your-profile  

---

## ⭐ Support

If you found this project helpful, please give it a star ⭐
