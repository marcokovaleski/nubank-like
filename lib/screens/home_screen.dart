// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

/// Tela Home com saudação, cartão de saldo e ações visuais (Transferir, Pagar, Depositar).
/// Recebe o argumento 'name' via Navigator (routes). Se não vier, mostra "Usuário".
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock de saldo (apenas visual)
  double accountBalance = 2548.72;

  @override
  Widget build(BuildContext context) {
    // obtém argumentos passados pela navegação (Map esperado)
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String name = (args != null && args['name'] != null)
        ? args['name'] as String
        : 'Usuário';

    const purpleStart = Color(0xFF8A05BE);
    const purpleEnd = Color(0xFFA96CFF);

    return Scaffold(
      // AppBar transparente: visual similar a apps bancários
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
            tooltip: 'Notificações',
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // background gradiente no topo
          Container(
            height: 260,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [purpleStart, purpleEnd],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
          ),
          // Conteúdo principal
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Saudação + pequeno subtítulo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Olá, $name',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(height: 4),
                          const Text('Bem-vindo de volta',
                              style:
                                  TextStyle(color: Colors.white70, fontSize: 14))
                        ],
                      ),
                      // avatar simples
                      const CircleAvatar(
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.person, color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(height: 18),

                  // Card de saldo (visual)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Conta',
                            style: TextStyle(
                                fontSize: 13, color: Colors.black54)),
                        const SizedBox(height: 8),
                        Text(
                          'R\$ ${accountBalance.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text('Saldo disponível',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black45)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Lista horizontal de ações (apenas UI)
                  SizedBox(
                    height: 106,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildActionTile(icon: Icons.send, label: 'Transferir'),
                        _buildActionTile(icon: Icons.qr_code, label: 'Pagar'),
                        _buildActionTile(
                            icon: Icons.account_balance, label: 'Depositar'),
                        _buildActionTile(icon: Icons.credit_card, label: 'Cartão'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Título da seção de movimentos
                  const Text('Últimas movimentações',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  const SizedBox(height: 8),

                  // Lista mock de transações
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      // Mock de itens
                      final amounts = [-120.50, -43.20, 324.00, -30.0, -10.5];
                      final titles = [
                        'Pagamento - Conta de luz',
                        'Pix recebido',
                        'Depósito',
                        'Transferência',
                        'Assinatura'
                      ];
                      final date = ['22/09', '21/09', '20/09', '19/09', '18/09'];
                      final amt = amounts[index];
                      final isCredit = amt >= 0;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              isCredit ? Colors.green.shade50 : Colors.red.shade50,
                          child: Icon(
                            isCredit ? Icons.arrow_downward : Icons.arrow_upward,
                            color: isCredit ? Colors.green : Colors.red,
                          ),
                        ),
                        title: Text(titles[index]),
                        subtitle: Text(date[index]),
                        trailing: Text(
                          '${isCredit ? '' : '- '}R\$ ${amt.abs().toStringAsFixed(2)}',
                          style: TextStyle(
                              color: isCredit ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 80), // espaço final
                ],
              ),
            ),
          )
        ],
      ),
      // Bottom bar só visual — você pode customizar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple[800],
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Carteira'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
        ],
      ),
    );
  }

  // widget helper para os tiles de ação (Transferir, Pagar, ...)
  Widget _buildActionTile({required IconData icon, required String label}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          Material(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                // apenas visual: mostra SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$label — funcionalidade não implementada.')),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 26),
                    const SizedBox(height: 8),
                    Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
