import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/app_styles.dart';
import '../widgets/action_item.dart';

/// Tela Principal - Interface principal do aplicativo Nubank
///
/// Esta tela exibe:
/// - Saudação do usuário
/// - Saldo da conta
/// - Botões de ação (Pix, Transferir, etc.)
/// - Seção de cartão de crédito
/// - Cards de descoberta
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // Controla se o saldo está visível ou oculto
  bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildBalanceSection(),
              _buildActionButtons(),
              _buildCreditCardSection(),
              _buildDiscoverySection(),
            ],
          ),
        ),
      ),
    );
  }

  /// Cabeçalho roxo com saudação e botões
  Widget _buildHeader() {
    return Container(
      color: AppConstants.primaryPurple,
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Botões do cabeçalho
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Avatar do usuário
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: AppConstants.primaryPurple),
              ),

              // Botões de ação
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _isBalanceVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isBalanceVisible = !_isBalanceVisible;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.help_outline, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.security, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20),

          // Saudação
          Text(
            'Olá, Usuário',
            style: AppTextStyles.titleSmall.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  /// Seção de saldo da conta
  Widget _buildBalanceSection() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saldo em conta:',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 4),
              Text(
                _isBalanceVisible ? 'R\$ 3,06' : '••••••',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
        ],
      ),
    );
  }

  /// Botões de ação (Pix, Transferir, etc.)
  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: 16,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ActionItem(
              icon: Icons.pix,
              label: 'Área Pix Transferir',
              onTap: () {},
            ),
            SizedBox(width: 20),
            ActionItem(icon: Icons.payment, label: 'Pagar', onTap: () {}),
            SizedBox(width: 20),
            ActionItem(
              icon: Icons.monetization_on,
              label: 'Pegar emprestado',
              onTap: () {},
            ),
            SizedBox(width: 20),
            ActionItem(
              icon: Icons.savings,
              label: 'Caixinha Turbo',
              onTap: () {},
            ),
            SizedBox(width: 20),
            ActionItem(
              icon: Icons.phone_android,
              label: 'Recarga de celular',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  /// Seção do cartão de crédito
  Widget _buildCreditCardSection() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cartão de crédito',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Fatura atual',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            _isBalanceVisible ? 'R\$ 1.027,51' : '••••••',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4),
          Text(
            _isBalanceVisible ? 'Limite disponível de R\$ 466,49' : '••••••',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.credit_card,
                  color: AppConstants.primaryPurple,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Meus cartões',
                  style: TextStyle(
                    color: AppConstants.primaryPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Seção de descoberta
  Widget _buildDiscoverySection() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Descubra mais',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DiscoveryCard(
                  title: 'Seguro Vida',
                  subtitle:
                      'Cuide de quem você ama de um jeito simples e que cabe no seu bolso',
                  onTap: () {},
                ),
                SizedBox(width: 16),
                DiscoveryCard(
                  title: 'Área de Seguros do Nu',
                  subtitle:
                      'Toda proteção para você e para quem você ama num só lugar',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
