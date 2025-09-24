// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// Tela de login com design aprimorado e melhor UX.
/// Campos para "CPF ou e-mail" e "Senha" com validação e navegação para Home.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userFieldController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hidePassword = true;
  bool _isLoading = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

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
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _userFieldController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  String _deriveNameFromInput(String input) {
    if (input.contains('@')) {
      final beforeAt = input.split('@')[0];
      final parts = beforeAt
          .split(RegExp(r'[._\-]'))
          .where((s) => s.isNotEmpty);
      return parts
          .map(
            (p) => p.isEmpty
                ? p
                : '${p[0].toUpperCase()}${p.substring(1).toLowerCase()}',
          )
          .join(' ');
    }
    return 'Usuário';
  }

  void _onLoginPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      // Simula um delay de login
      await Future.delayed(const Duration(milliseconds: 1500));

      if (!mounted) return;

      final raw = _userFieldController.text.trim();
      final displayName = _deriveNameFromInput(raw);

      Navigator.of(
        context,
      ).pushReplacementNamed('/home', arguments: {'name': displayName});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                    vertical: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 32),
                      _buildTitle(),
                      const SizedBox(height: 8),
                      _buildSubtitle(),
                      const SizedBox(height: 32),
                      _buildLoginForm(),
                      const SizedBox(height: 24),
                      _buildFooter(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppConstants.primaryPurple,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppConstants.primaryPurple.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'nu',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          AppConstants.appName,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppConstants.primaryPurple,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(AppConstants.loginTitle, style: AppTextStyles.titleLarge);
  }

  Widget _buildSubtitle() {
    return Text(AppConstants.loginSubtitle, style: AppTextStyles.bodyMedium);
  }

  Widget _buildLoginForm() {
    return Card(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
          color: AppConstants.cardBackground,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildEmailField(),
              const SizedBox(height: 16),
              _buildPasswordField(),
              const SizedBox(height: 24),
              _buildLoginButton(),
              const SizedBox(height: 16),
              _buildForgotPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _userFieldController,
      keyboardType: TextInputType.emailAddress,
      style: AppTextStyles.bodyLarge,
      decoration: InputDecoration(
        labelText: 'CPF ou e-mail',
        labelStyle: AppTextStyles.bodyMedium,
        prefixIcon: Icon(
          Icons.person_outline,
          color: AppConstants.primaryPurple,
        ),
        filled: true,
        fillColor: AppConstants.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          borderSide: BorderSide(color: AppConstants.primaryPurple, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
      validator: (v) {
        if (v == null || v.trim().isEmpty) {
          return 'Informe CPF ou e-mail';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _hidePassword,
      style: AppTextStyles.bodyLarge,
      decoration: InputDecoration(
        labelText: 'Senha',
        labelStyle: AppTextStyles.bodyMedium,
        prefixIcon: Icon(Icons.lock_outline, color: AppConstants.primaryPurple),
        suffixIcon: IconButton(
          icon: Icon(
            _hidePassword ? Icons.visibility_off : Icons.visibility,
            color: AppConstants.primaryPurple,
          ),
          onPressed: () => setState(() => _hidePassword = !_hidePassword),
        ),
        filled: true,
        fillColor: AppConstants.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          borderSide: BorderSide(color: AppConstants.primaryPurple, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          borderSide: const BorderSide(color: Colors.red, width: 1),
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
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _onLoginPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.primaryPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          ),
          elevation: 4,
          shadowColor: AppConstants.primaryPurple.withOpacity(0.3),
        ),
        child: _isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text('Entrar', style: AppTextStyles.buttonText),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return TextButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Funcionalidade de recuperação de senha em desenvolvimento',
            ),
            backgroundColor: AppConstants.primaryPurple,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
            ),
          ),
        );
      },
      style: TextButton.styleFrom(foregroundColor: AppConstants.primaryPurple),
      child: Text(
        'Esqueci minha senha',
        style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Text(
        'Esta é uma réplica de interface — sem integração real.',
        style: AppTextStyles.bodySmall.copyWith(color: AppConstants.textLight),
        textAlign: TextAlign.center,
      ),
    );
  }
}
