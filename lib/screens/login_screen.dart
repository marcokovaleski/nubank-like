import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/constants.dart';
import '../utils/app_styles.dart';

/// Tela de Login - Interface para autenticação do usuário
///
/// Esta tela permite ao usuário inserir CPF/e-mail e senha
/// para acessar a tela principal do aplicativo
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores para os campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Chave para validação do formulário
  final _formKey = GlobalKey<FormState>();

  // Estado para controlar visibilidade da senha
  bool _hidePassword = true;

  // Estado para controlar carregamento do botão
  bool _isLoading = false;

  @override
  void dispose() {
    // Limpa os controladores para evitar vazamentos de memória
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Extrai o nome do usuário a partir do e-mail inserido
  String _getUserNameFromEmail(String email) {
    if (email.contains('@')) {
      // Pega a parte antes do @ e formata como nome
      String name = email.split('@')[0];
      return name.replaceAll('.', ' ').replaceAll('_', ' ');
    }
    return 'Usuário';
  }

  /// Processa o login quando o botão é pressionado
  ///
  /// Este método valida os campos, simula uma requisição de login
  /// e navega para a tela principal se tudo estiver correto.
  void _handleLogin() async {
    // Valida o formulário antes de prosseguir
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simula delay de login (como se fosse uma requisição real)
      await Future.delayed(Duration(seconds: 1));

      // Verifica se o widget ainda está montado antes de navegar
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 40),
              _buildTitle(),
              SizedBox(height: 10),
              _buildSubtitle(),
              SizedBox(height: 40),
              _buildLoginForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// Cabeçalho com logo e nome do app
  Widget _buildHeader() {
    return Row(
      children: [
        // Logo do Nubank
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppConstants.primaryPurple,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/nubank-icon.svg',
              width: 24,
              height: 24,
            ),
          ),
        ),
        SizedBox(width: 12),
        Text(
          AppConstants.appName,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppConstants.primaryPurple,
          ),
        ),
      ],
    );
  }

  /// Título da tela
  Widget _buildTitle() {
    return Text(AppConstants.welcomeMessage, style: AppTextStyles.titleLarge);
  }

  /// Subtítulo da tela
  Widget _buildSubtitle() {
    return Text(
      AppConstants.loginSubtitle,
      style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[600]),
    );
  }

  /// Formulário de login
  Widget _buildLoginForm() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildEmailField(),
              SizedBox(height: 16),
              _buildPasswordField(),
              SizedBox(height: 24),
              _buildLoginButton(),
              SizedBox(height: 16),
              _buildForgotPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// Campo de e-mail/CPF
  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'CPF ou e-mail',
        prefixIcon: Icon(
          Icons.person_outline,
          color: AppConstants.primaryPurple,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppConstants.emailRequiredMessage;
        }
        return null;
      },
    );
  }

  /// Campo de senha
  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _hidePassword,
      decoration: InputDecoration(
        labelText: 'Senha',
        prefixIcon: Icon(Icons.lock_outline, color: AppConstants.primaryPurple),
        suffixIcon: IconButton(
          icon: Icon(
            _hidePassword ? Icons.visibility_off : Icons.visibility,
            color: AppConstants.primaryPurple,
          ),
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppConstants.passwordRequiredMessage;
        }
        if (value.length < AppConstants.minPasswordLength) {
          return AppConstants.passwordTooShortMessage;
        }
        return null;
      },
    );
  }

  /// Botão de login
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.primaryPurple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  /// Botão "Esqueci minha senha"
  Widget _buildForgotPasswordButton() {
    return TextButton(
      onPressed: () {
        // Mostra uma mensagem informativa
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Funcionalidade em desenvolvimento'),
            backgroundColor: AppConstants.primaryPurple,
          ),
        );
      },
      child: Text(
        'Esqueci minha senha',
        style: TextStyle(
          color: AppConstants.primaryPurple,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
