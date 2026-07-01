import 'package:flutter/material.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_textfield.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/text_styles.dart';
import '../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome back'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text('Sign in to continue', style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),
            Text(
              'Access your personalized VentureLink dashboard and keep building with your ALU network.',
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 30),
            AppTextField(
              label: 'Email',
              icon: Icons.email_outlined,
              controller: _emailController,
            ),
            const SizedBox(height: 18),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                AppTextField(
                  label: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: !_showPassword,
                  controller: _passwordController,
                ),
                IconButton(
                  color: AppColors.accent,
                  icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => _showPassword = !_showPassword),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AppButton(label: 'Sign in', onPressed: _login),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.dashboard),
              child: const Text('Continue as guest', style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }
}
