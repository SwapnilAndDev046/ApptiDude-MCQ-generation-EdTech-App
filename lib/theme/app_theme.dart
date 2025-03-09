import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF4A89DC);
  static const Color primaryLightColor = Color(0xFF5D9CEC);
  static const Color primaryDarkColor = Color(0xFF3A6BC1);
  static const Color accentColor = Color(0xFF8CC152);
  static const Color backgroundColor = Color(0xFFF5F7FA);
  static const Color cardColor = Colors.white;
  static const Color textPrimaryColor = Color(0xFF434A54);
  static const Color textSecondaryColor = Color(0xFF656D78);
  static const Color errorColor = Color(0xFFDA4453);

  // Dark Theme Colors
  static const Color darkBackgroundColor = Color(0xFF1E2129);
  static const Color darkCardColor = Color(0xFF2A2D37);
  static const Color darkTextPrimaryColor = Color(0xFFE6E9ED);
  static const Color darkTextSecondaryColor = Color(0xFFAAB2BD);

  // Typography
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    displaySmall: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: textPrimaryColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: textPrimaryColor,
    ),
    titleLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: textPrimaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: textPrimaryColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: textPrimaryColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      color: textSecondaryColor,
    ),
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: darkTextPrimaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: darkTextPrimaryColor,
    ),
    displaySmall: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: darkTextPrimaryColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: darkTextPrimaryColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: darkTextPrimaryColor,
    ),
    titleLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: darkTextPrimaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: darkTextPrimaryColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: darkTextPrimaryColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      color: darkTextSecondaryColor,
    ),
  );

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      error: errorColor,
      background: backgroundColor,
      surface: cardColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardColor,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: const BorderSide(color: primaryColor),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFCCD1D9)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFCCD1D9)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: errorColor),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    cardTheme: CardTheme(
      color: cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFE6E9ED),
      thickness: 1,
      space: 1,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return Colors.transparent;
      }),
      side: const BorderSide(color: Color(0xFFAAB2BD)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor,
      error: errorColor,
      background: darkBackgroundColor,
      surface: darkCardColor,
    ),
    scaffoldBackgroundColor: darkBackgroundColor,
    cardColor: darkCardColor,
    textTheme: darkTextTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkCardColor,
      foregroundColor: darkTextPrimaryColor,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryLightColor,
        side: const BorderSide(color: primaryLightColor),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryLightColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2A2D37),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF434A54)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF434A54)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryLightColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: errorColor),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    cardTheme: CardTheme(
      color: darkCardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFF434A54),
      thickness: 1,
      space: 1,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return Colors.transparent;
      }),
      side: const BorderSide(color: Color(0xFF656D78)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );

  /// Returns the appropriate ThemeData based on [isDarkMode].
  static ThemeData getTheme(bool isDarkMode) {
    return isDarkMode ? darkTheme : lightTheme;
  }

  /// Returns the corresponding ThemeMode based on [isDarkMode].
  static ThemeMode getThemeMode(bool isDarkMode) {
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
