// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const NubankUiCloneApp());
}

/// Aplicação principal com rotas nomeadas.
/// Observação: ajustei o tema para priorizar a paleta "roxinha" parecida com o Nubank.
class NubankUiCloneApp extends StatelessWidget {
  const NubankUiCloneApp({super.key});

  // Cor base usada no app (Nubank-like)
  static const Color nubankPurple = Color(0xFF8A05BE);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nubank UI Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: nubankPurple,
        colorScheme: ColorScheme.fromSeed(seedColor: nubankPurple),
        scaffoldBackgroundColor: const Color(0xFFF6F6F8),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: nubankPurple,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
      ),
      // Rotas nomeadas. A splash screen inicial tem a duração configurável.
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(durationSeconds: 3),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
