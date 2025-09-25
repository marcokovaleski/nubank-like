import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/constants.dart';

/// Tela de Splash - Primeira tela que aparece ao abrir o app
///
/// Esta tela exibe o logo do Nubank e um indicador de carregamento
/// por alguns segundos antes de navegar para a tela de login.
/// É a primeira impressão que o usuário tem do aplicativo.
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Inicia o timer para navegar automaticamente
    _startNavigationTimer();
  }

  /// Inicia um timer e navega para a tela de login
  ///
  /// Este método simula o tempo de carregamento inicial do app
  /// e depois navega para a próxima tela.
  void _startNavigationTimer() async {
    // Aguarda o tempo definido nas constantes
    await Future.delayed(Duration(seconds: AppConstants.splashDurationSeconds));

    // Verifica se o widget ainda está montado antes de navegar
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppConstants.primaryPurple, // Roxo característico do Nubank
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(),
            SizedBox(height: 30),
            _buildLoadingIndicator(),
          ],
        ),
      ),
    );
  }

  /// Constrói o logo do Nubank
  ///
  /// Exibe o ícone SVG do Nubank com tamanho padronizado
  Widget _buildLogo() {
    return SvgPicture.asset(
      'assets/icons/nubank-icon.svg',
      width: AppConstants.logoSize,
      height: AppConstants.logoSize,
    );
  }

  /// Constrói o indicador de carregamento
  ///
  /// Exibe um spinner branco para indicar que o app está carregando
  Widget _buildLoadingIndicator() {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
