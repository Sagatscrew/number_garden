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

class ShapeQuizScreen extends StatefulWidget {
  const ShapeQuizScreen({super.key});

  @override
  State<ShapeQuizScreen> createState() => _ShapeQuizScreenState();
}

class _ShapeQuizScreenState extends State<ShapeQuizScreen> {
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
    _questions = _generator.generateShapeQuiz();
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

  Widget _buildShapeDisplay(QuizQuestion q) {
    if (q.shapeType == 'Daire') {
      return Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: q.shapeColor,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.darkGreen, width: 4),
        ),
      );
    } else if (q.shapeType == 'Kare') {
      return Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: q.shapeColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.darkGreen, width: 4),
        ),
      );
    } else if (q.shapeType == 'Üçgen') {
      return CustomPaint(
        size: const Size(150, 150),
        painter: _QuizTrianglePainter(q.shapeColor!),
      );
    } else if (q.shapeType == 'Dikdörtgen') {
      return Container(
        width: 200,
        height: 120,
        decoration: BoxDecoration(
          color: q.shapeColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.darkGreen, width: 4),
        ),
      );
    } else if (q.shapeType == 'Yıldız') {
      return CustomPaint(
        size: const Size(150, 150),
        painter: _QuizStarPainter(q.shapeColor!),
      );
    } else if (q.shapeType == 'Kalp') {
      return Icon(Icons.favorite, size: 150, color: q.shapeColor);
    }
    return const SizedBox();
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
                colors: [AppColors.accentPink, AppColors.cream],
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
                            l10n.shapesTitle,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.title,
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),

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
                                  Text(
                                    l10n.whichShape,
                                    style: AppTextStyles.title,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 20),
                                  Expanded(
                                    child: Center(
                                      child: _buildShapeDisplay(question)
                                          .animate()
                                          .fadeIn(duration: 300.ms)
                                          .scaleXY(
                                            begin: 0.7,
                                            end: 1,
                                            curve: Curves.elasticOut,
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
                        childAspectRatio: 1.8,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          question.shapeOptions.length,
                          (i) => QuizOptionButton(
                            text: question.shapeOptions[i],
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

// Şekiller için painter'lar
class _QuizTrianglePainter extends CustomPainter {
  final Color color;
  _QuizTrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..color = AppColors.darkGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _QuizStarPainter extends CustomPainter {
  final Color color;
  _QuizStarPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..color = AppColors.darkGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final path = _createStarPath(size.width, size.height, 5, 0.4);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  Path _createStarPath(double w, double h, int points, double innerRatio) {
    final path = Path();
    final cx = w / 2;
    final cy = h / 2;
    final outerR = w / 2;
    final innerR = outerR * innerRatio;

    for (int i = 0; i < points * 2; i++) {
      final r = i.isEven ? outerR : innerR;
      final angle = (i * 3.14159 / points) - 3.14159 / 2;
      final x = cx + r * _cos(angle);
      final y = cy + r * _sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  double _cos(double a) => _taylorCos(a);
  double _sin(double a) => _taylorSin(a);

  double _taylorCos(double x) {
    double r = 1, t = 1;
    for (int i = 1; i < 10; i++) {
      t *= -x * x / ((2 * i - 1) * (2 * i));
      r += t;
    }
    return r;
  }

  double _taylorSin(double x) {
    double r = x, t = x;
    for (int i = 1; i < 10; i++) {
      t *= -x * x / ((2 * i) * (2 * i + 1));
      r += t;
    }
    return r;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
