import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:confetti/confetti.dart';
import 'package:number_garden/core/audio/audio_manager.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/models/quiz_question.dart';
import '../../shared/models/quiz_generator.dart';
import '../quiz/widgets/quiz_option_button.dart';
import '../quiz/widgets/quiz_progress_bar.dart';
import '../quiz/quiz_result_screen.dart';

class NumberQuizScreen extends StatefulWidget {
  const NumberQuizScreen({super.key});

  @override
  State<NumberQuizScreen> createState() => _NumberQuizScreenState();
}

class _NumberQuizScreenState extends State<NumberQuizScreen> {
  final QuizGenerator _generator = QuizGenerator();
  late List<QuizQuestion> _questions;
  late ConfettiController _confettiController;

  int _currentIndex = 0;
  int _score = 0;
  int? _selectedIndex;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _questions = _generator.generateNumberQuiz();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _onAnswerSelected(int index) {
    if (_answered) return;

    final isCorrect = index == _questions[_currentIndex].correctIndex;

    // 🎵 Ses çal
    if (isCorrect) {
      AudioManager.instance.playCorrect();
      _confettiController.play();
    } else {
      AudioManager.instance.playWrong();
    }

    setState(() {
      _selectedIndex = index;
      _answered = true;
      if (isCorrect) _score++;
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedIndex = null;
        _answered = false;
      });
    } else {
      _finishQuiz();
    }
  }

  Future<void> _finishQuiz() async {
    // 🎵 Kutlama sesi
    if (_score >= _questions.length * 0.5) {
      AudioManager.instance.playCelebration();
    }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizResultScreen(
          correctCount: _score,
          totalCount: _questions.length,
        ),
      ),
    );

    if (!mounted) return;

    if (result == 'playAgain') {
      setState(() {
        _questions = _generator.generateNumberQuiz();
        _currentIndex = 0;
        _score = 0;
        _selectedIndex = null;
        _answered = false;
      });
    } else if (result == 'home') {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final question = _questions[_currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          Container(
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

                  // İlerleme çubuğu
                  QuizProgressBar(
                    current: _currentIndex + 1,
                    total: _questions.length,
                    score: _score,
                  ),

                  const SizedBox(height: 16),

                  // Soru kartı
                  Expanded(
                    flex: 3,
                    child:
                        Container(
                              key: ValueKey(_currentIndex),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              padding: const EdgeInsets.all(20),
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
                                  // Soru metni
                                  Text(
                                    l10n.howMany,
                                    style: AppTextStyles.title,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 20),

                                  // Emoji'leri göster
                                  Expanded(
                                    child: Center(
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: List.generate(
                                          question.correctAnswer!,
                                          (i) =>
                                              Text(
                                                    question.emoji ?? '🍎',
                                                    style: const TextStyle(
                                                      fontSize: 48,
                                                    ),
                                                  )
                                                  .animate(delay: (i * 80).ms)
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
                            .fadeIn(duration: 300.ms)
                            .scaleXY(begin: 0.95, end: 1),
                  ),

                  const SizedBox(height: 16),

                  // Seçenekler
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.5,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          question.options.length,
                          (i) => QuizOptionButton(
                            text: question.options[i].toString(),
                            isSelected: _selectedIndex == i,
                            isCorrect: _answered
                                ? i == question.correctIndex
                                : null,
                            onTap: () => _onAnswerSelected(i),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Konfeti
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
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
}
