
import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rosabee',

      // Set the visual style for the whole application.
      theme: ThemeData(
        useMaterial3: true,

        // Restrained red-and-white brand palette.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD5001C),
          brightness: Brightness.light,
        ),

        scaffoldBackgroundColor: Colors.white,

        // Simple, flat AppBar.
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF171717),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
        ),

        // Rectangular buttons instead of overly rounded buttons.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD5001C),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
      ),

      // Open the homepage first.
      home: const HomePage(),
    );
  }
}
