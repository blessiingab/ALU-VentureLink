import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_text_styles.dart';

class AdvancedSplashScreen extends StatefulWidget {
  const AdvancedSplashScreen({Key? key}) : super(key: key);

  @override
  State<AdvancedSplashScreen> createState() => _AdvancedSplashScreenState();
}

class _AdvancedSplashScreenState extends State<AdvancedSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _rotateController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _navigateToNextScreen();
  }

  void _setupAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    );

    _rotateController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _rotateAnimation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(
      CurvedAnimation(parent: _rotateController, curve: Curves.linear),
    );

    _fadeController.forward();
    _scaleController.forward();
    _rotateController.repeat();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    if (mounted) {
      context.go('/login');
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.darkGradient,
        ),
        child: Stack(
          children: [
            // Animated background elements
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.2),
                      AppColors.secondary.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              left: -50,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.accent.withOpacity(0.2),
                      AppColors.secondary.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
            ),
            // Main content
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Rotating badge
                    AnimatedBuilder(
                      animation: _rotateAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _rotateAnimation.value,
                          child: child,
                        );
                      },
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: AppColors.purpleGradient,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.4),
                                blurRadius: 30,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                              child: Center(
                                child: Icon(
                                  Icons.rocket_launch,
                                  size: 50,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Brand name
                    Text(
                      'VentureLink',
                      style: AppTextStyles.displayMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Tagline with gradient
                    ShaderMask(
                      shaderCallback: (bounds) => AppColors.cyanGradient.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: Text(
                        'Connect • Innovate • Grow',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom loading indicator
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.secondary.withOpacity(0.8),
                    ),
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
