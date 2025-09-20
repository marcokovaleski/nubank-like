// lib/screens/login_screen.dart
import 'package:flutter/material.dart';

/// Tela de login com campos para "CPF ou e-mail" e "Senha".
/// Ao pressionar "Entrar" valida campos e navega para a Home (pushReplacement).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userFieldController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _userFieldController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _deriveNameFromInput(String input) {
    // Se for e-mail, pega a parte antes do '@' e capitaliza.
    if (input.contains('@')) {
      final beforeAt = input.split('@')[0];
      // substitui pontos e underlines por espaços e capitaliza palavras
      final parts = beforeAt.split(RegExp(r'[._\-]')).where((s) => s.isNotEmpty);
      return parts
          .map((p) =>
              p.isEmpty ? p : '${p[0].toUpperCase()}${p.substring(1).toLowerCase()}')
          .join(' ');
    }
    // Para CPF ou outra entrada, retorna "Usuário"
    return 'Usuário';
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      final raw = _userFieldController.text.trim();
      final displayName = _deriveNameFromInput(raw);
      // Substitui a rota de login pela home e passa o nome como argumento
      Navigator.of(context)
          .pushReplacementNamed('/home', arguments: {'name': displayName});
    }
  }

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF8A05BE);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top area com logo + pequeno subtítulo
              Row(
                children: const [
                  // substitua por Image.asset se tiver logo local
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 20,
                    child: Text('nu',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'NuClone',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              const Text(
                'Fazer login',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text('Entre com CPF ou e-mail e a sua senha.'),
              const SizedBox(height: 22),

              // Card branco com o formulário
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 18.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // CPF ou e-mail
                        TextFormField(
                          controller: _userFieldController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'CPF ou e-mail',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return 'Informe CPF ou e-mail';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        // Senha com toggle de visibilidade
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _hidePassword,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(_hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () =>
                                  setState(() => _hidePassword = !_hidePassword),
                            ),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'Informe a senha';
                            }
                            if (v.length < 4) {
                              return 'Senha muito curta';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),
                        // Botão de login
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _onLoginPressed,
                            child: const Text('Entrar'),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            // ação visual apenas (sem backend)
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Fluxo de recuperação de senha não implementado.')),
                            );
                          },
                          child: const Text('Esqueci minha senha'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              // Dica / footer
              const Center(
                child: Text(
                  'Esta é uma réplica de interface — sem integração real.',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
