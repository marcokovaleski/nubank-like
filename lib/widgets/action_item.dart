import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/app_styles.dart';

/// Widget para botões de ação na tela home
///
/// Exibe um ícone circular com label abaixo
class ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const ActionItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Ícone circular
          Container(
            width: AppConstants.actionItemSize,
            height: AppConstants.actionItemSize,
            decoration: BoxDecoration(
              color: AppConstants.backgroundColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.black, size: AppConstants.iconSize),
          ),

          SizedBox(height: 8),

          // Label do botão
          Text(
            label,
            style: AppTextStyles.actionLabel,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Widget para cards de descoberta
///
/// Exibe um card com título, subtítulo e botão de ação
class DiscoveryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const DiscoveryCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.discoveryCardWidth,
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: AppConstants.cardBackground,
        borderRadius: BorderRadius.circular(AppConstants.cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título do card
          Text(
            title,
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 8),

          // Subtítulo do card
          Text(subtitle, style: AppTextStyles.bodyMedium),

          SizedBox(height: 16),

          // Botão de ação
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: AppConstants.primaryPurple,
              borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
            ),
            child: TextButton(
              onPressed: onTap,
              child: Text('Conhecer', style: AppTextStyles.buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
