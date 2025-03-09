import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/test_selection_screen.dart';
import 'screens/learn_section_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/results_screen.dart';
import 'theme/app_theme.dart';
import 'databases/database_helper.dart'; // Handles SQLite database operations

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the SQLite database
  await DatabaseHelper().database;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const AptiDudeApp());
}

class AptiDudeApp extends StatelessWidget {
  const AptiDudeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AptiDude',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/test_selection': (context) => const TestSelectionScreen(),
        '/learn_section': (context) => const LearnSectionScreen(),
        // Note: Do not define static routes for '/dashboard', '/profile', or '/results'
      },
      // Use onGenerateRoute for dynamic routes that require parameters
      onGenerateRoute: (settings) {
        if (settings.name == '/dashboard') {
          final args = settings.arguments as Map<String, dynamic>?;
          if (args == null) {
            // Fallback: Provide an empty user map or display an error screen
            return MaterialPageRoute(
              builder: (context) => const DashboardScreen(user: {}),
            );
          }
          return MaterialPageRoute(
            builder: (context) => DashboardScreen(user: args),
          );
        }
        if (settings.name == '/profile') {
          final args = settings.arguments as Map<String, dynamic>?;
          if (args == null) {
            // Fallback: Provide an empty user map or display an error screen
            return MaterialPageRoute(
              builder: (context) => const ProfileScreen(user: {}),
            );
          }
          return MaterialPageRoute(
            builder: (context) => ProfileScreen(user: args),
          );
        }
        if (settings.name == '/results') {
          final args = settings.arguments as Map<String, dynamic>?;
          if (args == null ||
              args['userId'] == null ||
              args['score'] == null ||
              args['totalQuestions'] == null) {
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(child: Text('Results arguments missing!')),
              ),
            );
          }
          return MaterialPageRoute(
            builder: (context) => ResultsScreen(
              userId: args['userId'] as int,
              score: args['score'] as int,
              totalQuestions: args['totalQuestions'] as int,
            ),
          );
        }
        return null;
      },
    );
  }
}
