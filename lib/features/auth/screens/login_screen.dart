import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_text_styles.dart';
import '../providers/auth_provider.dart';

class AdvancedLoginScreen extends StatefulWidget {
  const AdvancedLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdvancedLoginScreen> createState() => _AdvancedLoginScreenState();
}

class _AdvancedLoginScreenState extends State<AdvancedLoginScreen>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic));
    _slideController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.1),
                  AppColors.secondary.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Animated background elements
          Positioned(
            top: -100,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.2),
                    AppColors.primary.withOpacity(0.05),
                  ],
                ),
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: AppColors.purpleGradient,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white.withOpacity(0.2),
                            border: Border.all(
                              color: AppColors.white.withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Center(
                                child: Icon(
                                  Icons.rocket_launch,
                                  size: 35,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Welcome Back',
                          style: AppTextStyles.headlineMedium.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Form
                SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign in to your account',
                          style: AppTextStyles.bodyLarge,
                        ),
                        const SizedBox(height: 32),
                        // Email field with icon
                        _buildGlassTextField(
                          controller: _emailController,
                          hint: 'Email address',
                          icon: Icons.mail_outline,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        // Password field
                        _buildGlassTextField(
                          controller: _passwordController,
                          hint: 'Password',
                          icon: Icons.lock_outline,
                          obscureText: _obscurePassword,
                          onSuffixTap: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          suffixIcon: _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        const SizedBox(height: 12),
                        // Forgot password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot password?',
                              style: AppTextStyles.labelMedium.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Login button with gradient
                        Container(
                          decoration: BoxDecoration(
                            gradient: AppColors.purpleGradient,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: _isLoading
                                    ? null
                                    : () async {
                                        setState(() => _isLoading = true);
                                        final authProvider =
                                            context.read<AuthProvider>();
                                        await authProvider.login(
                                          _emailController.text,
                                          _passwordController.text,
                                        );
                                        if (mounted) {
                                          context.go('/role-selection');
                                          setState(() => _isLoading = false);
                                        }
                                      },
                                borderRadius: BorderRadius.circular(16),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16),
                                  child: Center(
                                    child: _isLoading
                                        ? SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                AppColors.white,
                                              ),
                                            ),
                                          )
                                        : Text(
                                            'Sign In',
                                            style:
                                                AppTextStyles.labelLarge.copyWith(
                                              color: AppColors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        // Divider with text
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: AppColors.grey200,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'or',
                                style: AppTextStyles.bodySmall,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: AppColors.grey200,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        // Social buttons
                        Row(
                          children: [
                            Expanded(
                              child: _buildSocialButton(
                                icon: Icons.g_mobiledata,
                                label: 'Google',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildSocialButton(
                                icon: Icons.facebook,
                                label: 'Facebook',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        // Sign up link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: AppTextStyles.bodyMedium,
                            ),
                            GestureDetector(
                              onTap: () => context.go('/signup'),
                              child: Text(
                                'Sign up',
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    IconData? suffixIcon,
    VoidCallback? onSuffixTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey200, width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: AppTextStyles.bodyMedium,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.grey500,
              ),
              prefixIcon: Icon(
                icon,
                color: AppColors.primary,
              ),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(suffixIcon, color: AppColors.grey500),
                      onPressed: onSuffixTap,
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              filled: true,
              fillColor: AppColors.white.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey200, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColors.grey700, size: 20),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: AppTextStyles.labelMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
