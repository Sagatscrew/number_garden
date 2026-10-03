import 'package:flutter/material.dart';

/// Quiz soru tipi
enum QuizType {
  countNumbers, // "Kaç tane var?" - sayı sayma
  recognizeShape, // "Bu hangi şekil?" - şekil tanıma
}

/// Tek bir quiz sorusu
class QuizQuestion {
  final QuizType type;
  final String questionText;
  final String? emoji; // Sayı quiz'i için gösterilecek emoji
  final int? correctAnswer; // Sayı quiz'i için doğru cevap
  final Color? shapeColor; // Şekil quiz'i için gösterilecek renk
  final String? shapeType; // 'circle', 'square', 'triangle' vs.
  final List<int> options; // Sayı quiz'i için seçenekler
  final List<String> shapeOptions; // Şekil quiz'i için seçenekler
  final int correctIndex; // Doğru cevabın index'i

  const QuizQuestion({
    required this.type,
    required this.questionText,
    this.emoji,
    this.correctAnswer,
    this.shapeColor,
    this.shapeType,
    this.options = const [],
    this.shapeOptions = const [],
    required this.correctIndex,
  });
}

/// Quiz sonucu
class QuizResult {
  final int correctCount;
  final int totalCount;
  final int starsEarned;
  final Duration duration;

  const QuizResult({
    required this.correctCount,
    required this.totalCount,
    required this.starsEarned,
    required this.duration,
  });

  double get percentage => correctCount / totalCount;

  String get messageKey {
    if (percentage >= 0.8) return 'greatJob';
    if (percentage >= 0.5) return 'goodJob';
    return 'keepTrying';
  }
}
