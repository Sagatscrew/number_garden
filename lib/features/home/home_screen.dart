import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:number_garden/core/audio/audio_manager.dart';
import 'package:number_garden/core/theme/app_colors.dart';
import 'package:number_garden/core/theme/app_text_styles.dart';
import 'package:number_garden/features/numbers/number_quiz_screen.dart';
import 'package:number_garden/features/shapes/shape_quiz_screen.dart';
import 'package:number_garden/shared/widgets/mascot_widget.dart';
import 'package:number_garden/l10n/app_localizations.dart';
import 'package:number_garden/features/numbers/number_learn_screen.dart';
import 'package:number_garden/features/shapes/shape_learn_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Arka plan müziğini başlat
    AudioManager.instance.startBgm();
  }

  @override
  void dispose() {
    // Ana ekrandan çıkınca müziği durdur
    super.dispose();
  }

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
                        _buildSectionCard(
                          context,
                          emoji: '🔢',
                          title: l10n.numbersSection,
                          color: AppColors.accentYellow,
                          onLearn: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NumberLearnScreen(),
                            ),
                          ),
                          onQuiz: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NumberQuizScreen(),
                            ),
                          ),
                          learnLabel: l10n.learnMode,
                          quizLabel: l10n.quizMode,
                        ),

                        const SizedBox(height: 20),

                        _buildSectionCard(
                          context,
                          emoji: '🔷',
                          title: l10n.shapesSection,
                          color: AppColors.accentPink,
                          onLearn: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ShapeLearnScreen(),
                            ),
                          ),
                          onQuiz: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ShapeQuizScreen(),
                            ),
                          ),
                          learnLabel: l10n.learnMode,
                          quizLabel: l10n.quizMode,
                        ),

                        // Alt bilgi
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
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

  Widget _buildSectionCard(
    BuildContext context, {
    required String emoji,
    required String title,
    required Color color,
    required VoidCallback onLearn,
    required VoidCallback onQuiz,
    required String learnLabel,
    required String quizLabel,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: color, width: 4),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.4),
            offset: const Offset(0, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        children: [
          // Başlık
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 3),
                ),
                child: Center(
                  child: Text(emoji, style: const TextStyle(fontSize: 32)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.title.copyWith(fontSize: 26),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // İki buton
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  emoji: '📖',
                  label: learnLabel,
                  color: AppColors.primaryGreen,
                  onTap: onLearn,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionButton(
                  emoji: '🎯',
                  label: quizLabel,
                  color: AppColors.accentOrange,
                  onTap: onQuiz,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String emoji,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 6),
            Text(label, style: AppTextStyles.button.copyWith(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
