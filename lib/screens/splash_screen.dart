// lib/screens/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';

/// Splash screen simples e configurável.
/// Exibe um "logo" estilizado e navega automaticamente para a tela de login.
class SplashScreen extends StatefulWidget {
  final int durationSeconds;

  const SplashScreen({super.key, this.durationSeconds = 3});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Timer configurável que, ao completar, substitui a rota atual pela tela de login.
    _timer = Timer(Duration(seconds: widget.durationSeconds), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Cores similares ao Nubank (roxinho, degrade)
    const purpleStart = Color(0xFF8A05BE);
    const purpleEnd = Color(0xFFA96CFF);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [purpleStart, purpleEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // "Logotipo" textual estilizado (substitua por asset se quiser)
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'nu',
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Bem-vindo ao NuClone',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                const CircularProgressIndicator(
                  // indicador sutil em branco
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
