import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/text_styles.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  Widget _statusCard({
    required IconData icon,
    required String title,
    required String value,
    required Color accent,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.softSurface,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: accent.withOpacity(0.2),
            child: Icon(icon, color: accent),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.cardSubtitle),
                const SizedBox(height: 8),
                Text(value, style: AppTextStyles.cardTitle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _taskCard({
    required String label,
    required String description,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: color.withOpacity(0.14),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.arrow_forward_ios, color: color, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.cardTitle),
                const SizedBox(height: 6),
                Text(description, style: AppTextStyles.cardSubtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Hello, Sara', style: AppTextStyles.headline),
                        SizedBox(height: 10),
                        Text('Your venture pipeline is ready. Review new matches and keep your momentum.', style: AppTextStyles.subtitle),
                      ],
                    ),
                  ),
                  Container(
                    height: 58,
                    width: 58,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(Icons.notifications_none, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              _statusCard(
                icon: Icons.work_outline,
                title: 'Open applications',
                value: '8 active',
                accent: AppColors.accent,
              ),
              const SizedBox(height: 16),
              _statusCard(
                icon: Icons.people_outline,
                title: 'Team matches',
                value: '4 recommended',
                accent: AppColors.success,
              ),
              const SizedBox(height: 16),
              _statusCard(
                icon: Icons.show_chart_outlined,
                title: 'Impact score',
                value: '+24% growth',
                accent: AppColors.warning,
              ),
              const SizedBox(height: 28),
              const Text('Suggested actions', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 16),
              _taskCard(
                label: 'Submit pitch deck',
                description: 'Share your latest startup pitch with the ALU review team.',
                color: AppColors.primary,
              ),
              _taskCard(
                label: 'Invite team members',
                description: 'Add collaborators so your project stays in sync.',
                color: AppColors.accent,
              ),
              _taskCard(
                label: 'Review applications',
                description: 'See new student proposals and approve the best fits.',
                color: AppColors.warning,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
