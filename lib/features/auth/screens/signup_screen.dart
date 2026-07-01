import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_text_styles.dart';
import '../providers/auth_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top gradient header
            Container(
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'Join ALU VentureLink',
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            // Form
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create your account',
                    style: AppTextStyles.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  // Name field
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Full name',
                      prefixIcon: const Icon(Icons.person_outlined),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Email field
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email address',
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  // Password field
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outlined),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Confirm password field
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      prefixIcon: const Icon(Icons.lock_outlined),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword =
                                !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Terms checkbox
                  CheckboxListTile(
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() => _agreeToTerms = value ?? false);
                    },
                    title: RichText(
                      text: TextSpan(
                        text: 'I agree to the ',
                        style: AppTextStyles.bodySmall,
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: 24),
                  // Sign up button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                              setState(() => _isLoading = true);
                              final authProvider =
                                  context.read<AuthProvider>();
                              await authProvider.signup(
                                _nameController.text,
                                _emailController.text,
                                _passwordController.text,
                                'student',
                              );
                              if (mounted) {
                                context.go('/role-selection');
                                setState(() => _isLoading = false);
                              }
                            },
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.white,
                                ),
                              ),
                            )
                          : Text('Create Account',
                              style: AppTextStyles.labelLarge.copyWith(
                                color: AppColors.white,
                              )),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Sign in link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: AppTextStyles.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () => context.go('/login'),
                        child: Text(
                          'Sign in',
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
