import 'package:flutter/material.dart';
import 'constants.dart';

/// Estilos de texto reutilizáveis para o aplicativo
///
/// Este arquivo centraliza todos os estilos de texto utilizados no app,
/// facilitando a manutenção e garantindo consistência visual.
class AppTextStyles {
  // ===== TÍTULOS =====

  /// Título principal das telas
  static const TextStyle titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppConstants.textPrimary,
  );

  /// Título secundário
  static const TextStyle titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppConstants.textPrimary,
  );

  /// Título pequeno
  static const TextStyle titleSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppConstants.textPrimary,
  );

  // ===== CORPO DO TEXTO =====

  /// Texto grande
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppConstants.textPrimary,
  );

  /// Texto médio (padrão)
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppConstants.textSecondary,
  );

  /// Texto pequeno
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppConstants.textLight,
  );

  // ===== ESPECIAIS =====

  /// Texto do saldo (valores monetários)
  static const TextStyle balanceText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppConstants.textPrimary,
  );

  /// Texto de botões
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  /// Texto de labels de ação
  static const TextStyle actionLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppConstants.textPrimary,
  );
}
