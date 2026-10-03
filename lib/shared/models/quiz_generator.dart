import 'dart:math';

import 'quiz_question.dart';
import 'number_item.dart';
import 'shape_item.dart';

class QuizGenerator {
  final Random _random = Random();

  /// Sayı quiz'i için 10 soru üretir
  List<QuizQuestion> generateNumberQuiz({
    int totalQuestions = 10,
    int maxNumber = 10,
  }) {
    final questions = <QuizQuestion>[];

    for (int i = 0; i < totalQuestions; i++) {
      final item = numbersList[_random.nextInt(maxNumber)];

      // Doğru cevap = item.value
      final correctAnswer = item.value;

      // 3 yanlış seçenek üret (1-10 arası, doğru cevaptan farklı)
      final wrongOptions = <int>{};
      while (wrongOptions.length < 3) {
        final wrong = _random.nextInt(10) + 1;
        if (wrong != correctAnswer) {
          wrongOptions.add(wrong);
        }
      }

      // Tüm seçenekleri birleştir ve karıştır
      final allOptions = [correctAnswer, ...wrongOptions]..shuffle();
      final correctIndex = allOptions.indexOf(correctAnswer);

      questions.add(
        QuizQuestion(
          type: QuizType.countNumbers,
          questionText: 'howMany',
          emoji: item.emoji,
          correctAnswer: correctAnswer,
          options: allOptions,
          correctIndex: correctIndex,
        ),
      );
    }

    return questions;
  }

  /// Şekil quiz'i için 10 soru üretir
  List<QuizQuestion> generateShapeQuiz({int totalQuestions = 10}) {
    final questions = <QuizQuestion>[];

    for (int i = 0; i < totalQuestions; i++) {
      final item = shapesList[_random.nextInt(shapesList.length)];

      // 3 yanlış seçenek üret
      final wrongShapes = <String>{};
      while (wrongShapes.length < 3) {
        final wrong = shapesList[_random.nextInt(shapesList.length)];
        if (wrong.trName != item.trName) {
          wrongShapes.add(wrong.trName);
        }
      }

      // Tüm seçenekleri birleştir
      final allOptions = [item.trName, ...wrongShapes]..shuffle();
      final correctIndex = allOptions.indexOf(item.trName);

      questions.add(
        QuizQuestion(
          type: QuizType.recognizeShape,
          questionText: 'whichShape',
          shapeColor: item.color,
          shapeType: item.trName,
          shapeOptions: allOptions,
          correctIndex: correctIndex,
        ),
      );
    }

    return questions;
  }
}
