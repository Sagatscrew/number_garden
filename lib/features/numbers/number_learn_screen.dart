import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:number_garden/core/audio/audio_manager.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/models/number_item.dart';
import '../../l10n/app_localizations.dart';

class NumberLearnScreen extends StatefulWidget {
  const NumberLearnScreen({super.key});

  @override
  State<NumberLearnScreen> createState() => _NumberLearnScreenState();
}

class _NumberLearnScreenState extends State<NumberLearnScreen> {
  int _currentIndex = 0;

  void _next() {
    AudioManager.instance.playTap(); // 🎵 Tık sesi
    if (_currentIndex < numbersList.length - 1) {
      setState(() => _currentIndex++);
    }
  }

  void _previous() {
    AudioManager.instance.playTap(); // 🎵 Tık sesi
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
    }
  }

  String _getNumberName(BuildContext context, NumberItem item) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'tr' ? item.trName : item.enName;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final item = numbersList[_currentIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.accentYellow, AppColors.cream],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Üst bar
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.darkGreen,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        l10n.numbersTitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.title,
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Sayı gösterimi
              Expanded(
                child: GestureDetector(
                  onTap: _next,
                  child:
                      Container(
                            key: ValueKey(_currentIndex),
                            margin: const EdgeInsets.symmetric(horizontal: 32),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: AppColors.primaryGreen,
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryGreen.withValues(
                                    alpha: 0.3,
                                  ),
                                  offset: const Offset(0, 8),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Büyük sayı
                                Text(
                                  '${item.value}',
                                  style: AppTextStyles.number.copyWith(
                                    fontSize: 120,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // Sayı adı
                                Text(
                                  _getNumberName(context, item),
                                  style: AppTextStyles.heading,
                                ),

                                const SizedBox(height: 24),

                                // Emoji sayısı
                                Expanded(
                                  child: Center(
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: List.generate(
                                        item.value,
                                        (i) =>
                                            Text(
                                                  item.emoji,
                                                  style: const TextStyle(
                                                    fontSize: 42,
                                                  ),
                                                )
                                                .animate(delay: (i * 100).ms)
                                                .fadeIn()
                                                .scaleXY(begin: 0.3, end: 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 400.ms)
                          .scaleXY(begin: 0.9, end: 1),
                ),
              ),

              const SizedBox(height: 20),

              // İlerleme noktaları
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  numbersList.length,
                  (i) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == _currentIndex ? 24 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: i == _currentIndex
                          ? AppColors.primaryGreen
                          : AppColors.primaryGreen.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Navigasyon butonları
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  children: [
                    // Geri
                    if (_currentIndex > 0)
                      Expanded(
                        child: _buildNavButton(
                          emoji: '⬅️',
                          label: l10n.backButton,
                          color: AppColors.accentOrange,
                          onTap: _previous,
                        ),
                      )
                    else
                      const Spacer(),

                    const SizedBox(width: 16),

                    // İleri
                    if (_currentIndex < numbersList.length - 1)
                      Expanded(
                        child: _buildNavButton(
                          emoji: '➡️',
                          label: l10n.nextButton,
                          color: AppColors.primaryGreen,
                          onTap: _next,
                        ),
                      )
                    else
                      const Spacer(),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required String emoji,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [BoxShadow(offset: const Offset(0, 4), blurRadius: 12)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Text(label, style: AppTextStyles.button),
          ],
        ),
      ),
    );
  }
}
