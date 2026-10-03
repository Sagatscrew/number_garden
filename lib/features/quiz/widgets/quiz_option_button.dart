import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class QuizOptionButton extends StatelessWidget {
  final String text;
  final bool? isCorrect;
  final bool isSelected;
  final VoidCallback? onTap;

  const QuizOptionButton({
    super.key,
    required this.text,
    this.isCorrect,
    this.isSelected = false,
    this.onTap,
  });

  /// Metnin uzunluğuna göre font boyutu belirle
  double _getFontSize() {
    final length = text.length;
    if (length <= 2) return 40; // "5", "10" gibi sayılar
    if (length <= 5) return 28; // "Daire", "Kare"
    if (length <= 8) return 22; // "Üçgen", "Yıldız"
    return 18; // "Dikdörtgen" gibi uzun kelimeler
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.white;
    Color borderColor = AppColors.primaryGreen;
    Color textColor = AppColors.darkGreen;
    Widget? icon;

    if (isCorrect != null) {
      if (isCorrect == true) {
        bgColor = AppColors.correctGreen;
        borderColor = AppColors.correctGreen;
        textColor = Colors.white;
        icon = const Icon(Icons.check_circle, color: Colors.white, size: 28);
      } else if (isSelected) {
        bgColor = AppColors.wrongRed;
        borderColor = AppColors.wrongRed;
        textColor = Colors.white;
        icon = const Icon(Icons.cancel, color: Colors.white, size: 28);
      }
    }

    return GestureDetector(
      onTap: isCorrect != null ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor, width: 4),
          boxShadow: [
            BoxShadow(
              color: borderColor.withValues(alpha: 0.3),
              offset: const Offset(0, 6),
              blurRadius: 12,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Stack(
            children: [
              // ✅ Metni sığdırmak için FittedBox
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: AppTextStyles.heading.copyWith(
                        color: textColor,
                        fontSize: _getFontSize(),
                      ),
                    ),
                  ),
                ),
              ),
              if (icon != null) Positioned(top: 0, right: 0, child: icon),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).scaleXY(begin: 0.9, end: 1);
  }
}
