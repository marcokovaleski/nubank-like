import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/action_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  String _userName = 'Usuário';
  bool _isBalanceVisible = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Captura o nome do usuário passado como argumento
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null && args.containsKey('name')) {
      _userName = args['name'] as String;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: AppConstants.backgroundGradient,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [_buildHeader(context), _buildBody(context)],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Cabeçalho roxo com saudação e botões
  Widget _buildHeader(BuildContext context) {
    return Container(
      color: AppConstants.primaryPurple,
      padding: const EdgeInsets.fromLTRB(20, 20, 16, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Linha de botões no topo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // Navegação para perfil
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.person,
                    color: AppConstants.primaryPurple,
                    size: 24,
                  ),
                ),
              ),
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
                      setState(() => _isBalanceVisible = !_isBalanceVisible);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.help_outline, color: Colors.white),
                    onPressed: () {
                      // Central de ajuda
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.mail_outline, color: Colors.white),
                    onPressed: () {
                      // Mensagens
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            '${AppConstants.helloMessage}, $_userName',
            style: AppTextStyles.titleMedium.copyWith(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Corpo branco com cartão de saldo, botões de ações e destaques
  Widget _buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cartão de saldo posicionado no topo
          _buildBalanceCard(context),
          const SizedBox(height: 32),
          // Botões de ações
          _buildActionButtons(context),
          const SizedBox(height: 32),
          // Divisor
          const Divider(thickness: 0.5, color: Color(0xFFE0E0E0)),
          const SizedBox(height: 16),
          // Seção de fatura atual
          _buildCreditCardSection(context),
          const SizedBox(height: 24),
          // Divisor
          const Divider(thickness: 0.5, color: Color(0xFFE0E0E0)),
          const SizedBox(height: 16),
          // Seção de descoberta
          _buildDiscoverySection(context),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saldo em conta:',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppConstants.textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _isBalanceVisible ? 'R\$ 3,06' : '••••••',
                style: AppTextStyles.balanceText.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppConstants.textSecondary,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            const SizedBox(width: 20),
            ...HomeActions.actions.map(
              (action) => Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ActionItem(
                  icon: action['icon'] as IconData,
                  label: action['label'] as String,
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditCardSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cartão de crédito',
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppConstants.textSecondary,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppConstants.textSecondary,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Fatura atual',
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w500,
              color: AppConstants.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _isBalanceVisible ? 'R\$ 1.027,51' : '••••••',
            style: AppTextStyles.balanceText.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _isBalanceVisible ? 'Limite disponível de R\$ 466,49' : '••••••',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppConstants.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                const SizedBox(width: 8),
                Text(
                  'Meus cartões',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppConstants.primaryPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppConstants.primaryPurple,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscoverySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            AppConstants.discoverMore,
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              const SizedBox(width: 20),
              ...DiscoveryCards.cards.map(
                (card) => DiscoveryCard(
                  title: card['title']!,
                  content: card['content']!,
                  buttonText: card['buttonText']!,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}
