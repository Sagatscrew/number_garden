import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ShapeItem {
  final String trName;
  final String enName;
  final Color color;
  final String emoji; // Örnek nesne

  const ShapeItem({
    required this.trName,
    required this.enName,
    required this.color,
    required this.emoji,
  });
}

final List<ShapeItem> shapesList = [
  const ShapeItem(
    trName: 'Daire',
    enName: 'Circle',
    color: AppColors.circleRed,
    emoji: '🌕',
  ),
  const ShapeItem(
    trName: 'Kare',
    enName: 'Square',
    color: AppColors.squareBlue,
    emoji: '🧊',
  ),
  const ShapeItem(
    trName: 'Üçgen',
    enName: 'Triangle',
    color: AppColors.triangleYellow,
    emoji: '🔺',
  ),
  const ShapeItem(
    trName: 'Dikdörtgen',
    enName: 'Rectangle',
    color: AppColors.rectanglePurple,
    emoji: '📱',
  ),
  const ShapeItem(
    trName: 'Yıldız',
    enName: 'Star',
    color: AppColors.starOrange,
    emoji: '⭐',
  ),
  const ShapeItem(
    trName: 'Kalp',
    enName: 'Heart',
    color: AppColors.heartPink,
    emoji: '❤️',
  ),
];