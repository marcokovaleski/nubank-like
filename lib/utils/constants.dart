import 'package:flutter/material.dart';

/// Constantes do aplicativo Nubank-like
class AppConstants {
  // Cores principais do Nubank
  static const Color primaryPurple = Color(0xFF8A05BE);
  static const Color lightPurple = Color(0xFFA96CFF);
  static const Color darkPurple = Color(0xFF6B0A9A);
  static const Color backgroundColor = Color(0xFFF6F6F8);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textLight = Color(0xFF999999);

  // Gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryPurple, lightPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryPurple, backgroundColor],
    stops: [0.4, 0.4],
  );

  // Textos
  static const String appName = 'NuClone';
  static const String welcomeMessage = 'Bem-vindo ao NuClone';
  static const String loginTitle = 'Fazer login';
  static const String loginSubtitle = 'Entre com CPF ou e-mail e a sua senha.';
  static const String helloMessage = 'Olá';
  static const String accountLabel = 'Conta';
  static const String discoverMore = 'Descubra mais';

  // Valores padrão
  static const double defaultPadding = 20.0;
  static const double cardRadius = 12.0;
  static const double buttonRadius = 8.0;
  static const double iconSize = 24.0;
  static const double avatarRadius = 20.0;

  // Durações
  static const int splashDuration = 3;
  static const Duration animationDuration = Duration(milliseconds: 300);
}

/// Estilos de texto reutilizáveis
class AppTextStyles {
  static const TextStyle titleLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppConstants.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppConstants.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppConstants.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppConstants.textSecondary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppConstants.textLight,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle balanceText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppConstants.textPrimary,
  );

  static const TextStyle actionLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppConstants.textPrimary,
  );
}

/// Ações disponíveis na tela home
class HomeActions {
  static const List<Map<String, dynamic>> actions = [
    {'icon': Icons.pix, 'label': 'Área Pix'},
    {'icon': Icons.swap_horiz, 'label': 'Transferir'},
    {'icon': Icons.qr_code, 'label': 'Pagar'},
    {'icon': Icons.account_balance_wallet, 'label': 'Pegar emprestado'},
    {'icon': Icons.savings, 'label': 'Caixinha'},
    {'icon': Icons.phone_android, 'label': 'Recarga de celular'},
  ];
}

/// Cards de descoberta
class DiscoveryCards {
  static const List<Map<String, String>> cards = [
    {
      'title': 'WhatsApp',
      'content': 'Pagamentos rápidos e sem tarifa direto no WhatsApp.',
      'buttonText': 'Quero conhecer',
    },
    {
      'title': 'Indique seus amigos',
      'content': 'Mostre como é fácil ter uma vida sem burocracia.',
      'buttonText': 'Indicar',
    },
    {
      'title': 'Cartão de crédito',
      'content': 'Peça seu cartão de crédito sem anuidade.',
      'buttonText': 'Pedir cartão',
    },
  ];
}
