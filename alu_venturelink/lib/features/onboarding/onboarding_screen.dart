import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/text_styles.dart';
import '../../core/widgets/custom_button.dart';
import '../../routes/app_routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  Widget _featureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A2F7E), Color(0xFF0C1D3A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: AppColors.accent),
          const SizedBox(height: 18),
          Text(title, style: AppTextStyles.cardTitle),
          const SizedBox(height: 8),
          Text(description, style: AppTextStyles.cardSubtitle),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -120,
              right: -100,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [AppColors.primary.withOpacity(0.45), Colors.transparent],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -130,
              left: -90,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [AppColors.accent.withOpacity(0.35), Colors.transparent],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Text('ALU VentureLink', style: AppTextStyles.headline.copyWith(fontSize: 36)),
                  const SizedBox(height: 14),
                  Text(
                    'Designed for founders, students, and mentors who want to turn ideas into impact.',
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 32),
                  _featureCard(
                    icon: Icons.lightbulb_outline,
                    title: 'Match with funding',
                    description: 'Explore curated startup opportunities and student engagement options.',
                  ),
                  const SizedBox(height: 16),
                  _featureCard(
                    icon: Icons.group_outlined,
                    title: 'Collaborate with ease',
                    description: 'Connect with project teams, mentors, and ALU communities in one place.',
                  ),
                  const SizedBox(height: 16),
                  _featureCard(
                    icon: Icons.bar_chart,
                    title: 'Track your progress',
                    description: 'Monitor applications, student matches, and startup growth in real time.',
                  ),
                  const Spacer(),
                  AppButton(
                    label: 'Get started',
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.login),
                  ),
                  const SizedBox(height: 14),
                  AppButton(
                    label: 'Explore later',
                    secondary: true,
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.dashboard),
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
