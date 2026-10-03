import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:confetti/confetti.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../l10n/app_localizations.dart';

class QuizResultScreen extends StatefulWidget {
  final int correctCount;
  final int totalCount;

  const QuizResultScreen({
    super.key,
    required this.correctCount,
    required this.totalCount,
  });

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    // Başarılıysa konfeti patlat
    if (widget.correctCount >= widget.totalCount * 0.5) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) _confettiController.play();
      });
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  int get _stars {
    final percentage = widget.correctCount / widget.totalCount;
    if (percentage >= 0.9) return 3;
    if (percentage >= 0.7) return 2;
    if (percentage >= 0.4) return 1;
    return 1; // ← En az 1 yıldız (motivasyon)
  }

  String _getMessage(AppLocalizations l10n) {
    final percentage = widget.correctCount / widget.totalCount;
    if (percentage >= 0.8) return l10n.greatJob;
    if (percentage >= 0.5) return l10n.goodJob;
    return l10n.keepTrying;
  }

  String _getEmoji() {
    if (widget.correctCount == widget.totalCount) return '🏆';
    if (_stars == 3) return '🌟';
    if (_stars == 2) return '😊';
    if (_stars == 1) return '🌱';
    return '💪';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.accentBlue, AppColors.cream],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Büyük emoji
                      Text(
                        _getEmoji(),
                        style: const TextStyle(fontSize: 100),
                      ).animate().scaleXY(
                        begin: 0.3,
                        end: 1,
                        duration: 600.ms,
                        curve: Curves.elasticOut,
                      ),

                      const SizedBox(height: 24),

                      // Mesaj
                      Text(
                        _getMessage(l10n),
                        style: AppTextStyles.heading,
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 300.ms),

                      const SizedBox(height: 16),

                      // Skor
                      Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: AppColors.primaryGreen,
                                width: 4,
                              ),
                            ),
                            child: Text(
                              l10n.scoreText(
                                widget.correctCount,
                                widget.totalCount,
                              ),
                              style: AppTextStyles.heading.copyWith(
                                fontSize: 36,
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 500.ms)
                          .scaleXY(begin: 0.9, end: 1),

                      const SizedBox(height: 24),

                      // Yıldızlar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (i) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child:
                                Text(
                                      i < _stars ? '⭐' : '☆',
                                      style: const TextStyle(fontSize: 48),
                                    )
                                    .animate(delay: (700 + i * 200).ms)
                                    .fadeIn()
                                    .scaleXY(
                                      begin: 0.3,
                                      end: 1,
                                      curve: Curves.elasticOut,
                                    ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Butonlar
                      Row(
                        children: [
                          Expanded(
                            child: _buildButton(
                              emoji: '🏠',
                              label: l10n.backButton,
                              color: AppColors.accentOrange,
                              onTap: () => Navigator.pop(context, 'home'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildButton(
                              emoji: '🔄',
                              label: l10n.againButton,
                              color: AppColors.primaryGreen,
                              onTap: () => Navigator.pop(context, 'playAgain'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              numberOfParticles: 30,
              colors: const [
                AppColors.primaryGreen,
                AppColors.accentYellow,
                AppColors.accentPink,
                AppColors.accentBlue,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String emoji,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              offset: const Offset(0, 6),
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 4),
            Text(label, style: AppTextStyles.button.copyWith(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
