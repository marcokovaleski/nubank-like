import 'package:flutter/material.dart';

/// Constantes do aplicativo Nubank Clone
///
/// Este arquivo centraliza todas as constantes utilizadas no app,
/// como cores, textos e valores padrão, facilitando a manutenção
class AppConstants {
  // ===== CORES PRINCIPAIS =====
  static const Color primaryPurple = Color(0xFF8A05BE);
  static const Color backgroundColor = Color(0xFFF6F6F8);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textLight = Color(0xFF999999);

  // ===== DIMENSÕES =====
  static const double defaultPadding = 20.0;
  static const double cardRadius = 12.0;
  static const double buttonRadius = 8.0;
  static const double iconSize = 24.0;
  static const double logoSize = 80.0;
  static const double actionItemSize = 60.0;
  static const double discoveryCardWidth = 280.0;

  // ===== DURAÇÕES =====
  static const int splashDurationSeconds = 3;

  // ===== TEXTOS =====
  static const String appName = 'Nubank Clone';
  static const String welcomeMessage = 'Olá! Que bom te ver por aqui.';
  static const String loginSubtitle =
      'Digite seu CPF ou e-mail para continuar.';

  // ===== VALIDAÇÕES =====
  static const int minPasswordLength = 4;
  static const String emailRequiredMessage =
      'Por favor, digite seu CPF ou e-mail';
  static const String passwordRequiredMessage = 'Por favor, digite sua senha';
  static const String passwordTooShortMessage =
      'Senha deve ter pelo menos 4 caracteres';
}
