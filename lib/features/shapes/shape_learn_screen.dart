import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/models/shape_item.dart';
import '../../l10n/app_localizations.dart';

class ShapeLearnScreen extends StatefulWidget {
  const ShapeLearnScreen({super.key});

  @override
  State<ShapeLearnScreen> createState() => _ShapeLearnScreenState();
}

class _ShapeLearnScreenState extends State<ShapeLearnScreen> {
  int _currentIndex = 0;

  void _next() {
    if (_currentIndex < shapesList.length - 1) {
      setState(() => _currentIndex++);
    }
  }

  void _previous() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
    }
  }

  String _getShapeName(BuildContext context, ShapeItem item) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'tr' ? item.trName : item.enName;
  }

  Widget _buildShape(ShapeItem item) {
    switch (item.trName) {
      case 'Daire':
        return Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            color: item.color,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.darkGreen, width: 4),
          ),
        );
      case 'Kare':
        return Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.darkGreen, width: 4),
          ),
        );
      case 'Üçgen':
        return CustomPaint(
          size: const Size(180, 180),
          painter: _TrianglePainter(item.color),
        );
      case 'Dikdörtgen':
        return Container(
          width: 240,
          height: 140,
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.darkGreen, width: 4),
          ),
        );
      case 'Yıldız':
        return CustomPaint(
          size: const Size(180, 180),
          painter: _StarPainter(item.color),
        );
      case 'Kalp':
        return Icon(
          Icons.favorite,
          size: 180,
          color: item.color,
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final item = shapesList[_currentIndex];

    return Scaffold(
      body: Container(
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios,
                          color: AppColors.darkGreen, size: 30),
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

              const SizedBox(height: 20),

              Expanded(
                child: Container(
                  key: ValueKey(_currentIndex),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    border:
                        Border.all(color: AppColors.primaryGreen, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryGreen.withValues(alpha: 0.3),
                        offset: const Offset(0, 8),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildShape(item)
                          .animate()
                          .fadeIn(duration: 400.ms)
                          .scaleXY(begin: 0.5, end: 1, curve: Curves.elasticOut),

                      const SizedBox(height: 32),

                      Text(
                        _getShapeName(context, item),
                        style: AppTextStyles.heading,
                      ),

                      const SizedBox(height: 16),

                      // Doğadaki örneği
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.emoji,
                            style: const TextStyle(fontSize: 40),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.darkGreen.withValues(alpha: 0.5),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.check_circle,
                            color: AppColors.correctGreen,
                            size: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  shapesList.length,
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  children: [
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
                    if (_currentIndex < shapesList.length - 1)
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
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 12,
            ),
          ],
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

class _TrianglePainter extends CustomPainter {
  final Color color;
  _TrianglePainter(this.color);

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

class _StarPainter extends CustomPainter {
  final Color color;
  _StarPainter(this.color);

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

  Path _createStarPath(
      double width, double height, int points, double innerRadius) {
    final path = Path();
    final centerX = width / 2;
    final centerY = height / 2;
    final outerRadius = width / 2;
    final innerR = outerRadius * innerRadius;

    for (int i = 0; i < points * 2; i++) {
      final radius = i.isEven ? outerRadius : innerR;
      final angle = (i * 3.14159 / points) - 3.14159 / 2;
      final x = centerX + radius * _cos(angle);
      final y = centerY + radius * _sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  double _cos(double angle) => (angle).abs() % (2 * 3.14159) == 3.14159 / 2
      ? 0
      : _cosine(angle);
  double _sin(double angle) => _sine(angle);

  double _cosine(double x) {
    // Basit yaklaşım
    return _taylorCos(x);
  }

  double _sine(double x) => _taylorSin(x);

  double _taylorCos(double x) {
    double result = 1;
    double term = 1;
    for (int i = 1; i < 10; i++) {
      term *= -x * x / ((2 * i - 1) * (2 * i));
      result += term;
    }
    return result;
  }

  double _taylorSin(double x) {
    double result = x;
    double term = x;
    for (int i = 1; i < 10; i++) {
      term *= -x * x / ((2 * i) * (2 * i + 1));
      result += term;
    }
    return result;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}