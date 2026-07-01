import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool secondary;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.secondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: secondary ? AppColors.softSurface : AppColors.primary,
        foregroundColor: Colors.white,
        elevation: secondary ? 0 : 5,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 26),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.4)),
    );
  }
}
