import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'utils/constants.dart';

/// Ponto de entrada do aplicativo Flutter
///
/// Este é o primeiro método executado quando o app é iniciado.
/// Ele cria e executa a aplicação principal.
void main() {
  runApp(NubankApp());
}

/// Aplicação principal do Nubank Clone
///
/// Esta é a classe raiz do aplicativo que configura:
/// - Tema visual personalizado do Nubank
/// - Sistema de navegação entre telas
/// - Configurações globais do MaterialApp
class NubankApp extends StatelessWidget {
  // Nome da aplicação
  static const String appTitle = 'Nubank Clone';

  // Rotas disponíveis no aplicativo
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      theme: _createNubankTheme(),
      initialRoute: splashRoute,
      routes: _createRoutes(),
    );
  }

  /// Cria o mapa de rotas do aplicativo
  ///
  /// Cada rota mapeia um caminho para uma tela específica.
  /// Isso permite navegação usando nomes em vez de classes.
  Map<String, WidgetBuilder> _createRoutes() {
    return {
      splashRoute: (context) => SplashScreen(),
      loginRoute: (context) => LoginScreen(),
      homeRoute: (context) => HomeScreen(),
    };
  }

  /// Cria o tema visual personalizado do Nubank
  ///
  /// Este método define todas as configurações visuais do app:
  /// - Cores principais (roxo do Nubank)
  /// - Estilos de botões
  /// - Aparência dos campos de entrada
  /// - Cores de fundo e elementos
  ThemeData _createNubankTheme() {
    return ThemeData(
      // Configuração básica de cores
      primaryColor: AppConstants.primaryPurple,
      scaffoldBackgroundColor: AppConstants.backgroundColor,

      // Configuração do tema de botões elevados
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.primaryPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          ),
        ),
      ),

      // Configuração do tema de campos de entrada
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          borderSide: BorderSide(color: AppConstants.primaryPurple, width: 2),
        ),
      ),
    );
  }
}
