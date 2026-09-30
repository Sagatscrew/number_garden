import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:number_garden/core/theme/app_colors.dart';
import 'package:number_garden/core/theme/app_text_styles.dart';
import 'package:number_garden/shared/widgets/mascot_widget.dart';
import 'package:number_garden/l10n/app_localizations.dart';
import 'package:number_garden/features/numbers/number_learn_screen.dart';
import 'package:number_garden/features/shapes/shape_learn_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.accentBlue, AppColors.cream],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Maskot + karşılama
              const MascotWidget(size: 130, emotion: 'happy'),

              const SizedBox(height: 16),

              Text(
                l10n.welcomeTitle,
                style: AppTextStyles.heading,
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3),

              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  l10n.welcomeSubtitle,
                  style: AppTextStyles.body,
                  textAlign: TextAlign.center,
                ),
              ).animate().fadeIn(delay: 400.ms),

              const SizedBox(height: 40),

              // Ana menü kartları
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        _buildMenuCard(
                          context,
                          emoji: '🔢',
                          title: l10n.numbersSection,
                          color: AppColors.accentYellow,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NumberLearnScreen(),
                            ),
                          ),
                        ).animate().fadeIn(delay: 600.ms).slideX(begin: -0.3),

                        const SizedBox(height: 20),

                        _buildMenuCard(
                          context,
                          emoji: '🔷',
                          title: l10n.shapesSection,
                          color: AppColors.accentPink,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ShapeLearnScreen(),
                            ),
                          ),
                        ).animate().fadeIn(delay: 800.ms).slideX(begin: 0.3),

                        const SizedBox(height: 24),

                        // Alt bilgi
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            l10n.parentNote,
                            style: AppTextStyles.body.copyWith(
                              fontSize: 12,
                              color: AppColors.darkGreen.withValues(alpha: 0.6),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String emoji,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        decoration: BoxDecoration(
          // ✅ Rengi geri koy
          color: color.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: color, width: 4),
          boxShadow: [
            BoxShadow(
              // ✅ Gölge rengi ve rengi belirt
              color: color.withValues(alpha: 0.4),
              offset: const Offset(0, 8),
              blurRadius: 16,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 3),
              ),
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 38)),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.title.copyWith(fontSize: 28),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.darkGreen, size: 28),
          ],
        ),
      ),
    );
  }
}
