// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Number Garden';

  @override
  String get mascotName => 'Cotton';

  @override
  String get welcomeTitle => 'Hi! I\'m Cotton 🐰';

  @override
  String get welcomeSubtitle => 'Let\'s learn numbers and shapes together!';

  @override
  String get startButton => 'Start';

  @override
  String get backButton => 'Back';

  @override
  String get nextButton => 'Next';

  @override
  String get skipButton => 'Skip';

  @override
  String get againButton => 'Again';

  @override
  String get closeButton => 'Close';

  @override
  String get confirmButton => 'Confirm';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get retryButton => 'Retry';

  @override
  String get numbersSection => 'Numbers';

  @override
  String get shapesSection => 'Shapes';

  @override
  String get rewardsSection => 'My Rewards';

  @override
  String get learnMode => 'Learn';

  @override
  String get quizMode => 'Play';

  @override
  String get numbersTitle => 'Learning Numbers';

  @override
  String get shapesTitle => 'Learning Shapes';

  @override
  String get countThis => 'Count these!';

  @override
  String get howMany => 'How many are there?';

  @override
  String get whichShape => 'Which shape is this?';

  @override
  String findShape(String shape) {
    return 'Where is the $shape?';
  }

  @override
  String get selectLevel => 'Select Level';

  @override
  String get levelEasy => 'Easy';

  @override
  String get levelMedium => 'Medium';

  @override
  String get levelHard => 'Hard';

  @override
  String get correctAnswer => 'Awesome! Correct! 🌟';

  @override
  String get wrongAnswer => 'Try again! 💪';

  @override
  String get tryAgain => 'Let\'s look again';

  @override
  String scoreText(int score, int total) {
    return '$score / $total';
  }

  @override
  String get greatJob => 'You\'re amazing!';

  @override
  String get goodJob => 'Good job!';

  @override
  String get keepTrying => 'Keep going, you\'ll make it!';

  @override
  String get wellDone => 'Well done!';

  @override
  String get perfectScore => 'Perfect! You got them all! 🎉';

  @override
  String earnedStars(int count) {
    return 'You earned $count stars!';
  }

  @override
  String get numberOne => 'One';

  @override
  String get numberTwo => 'Two';

  @override
  String get numberThree => 'Three';

  @override
  String get numberFour => 'Four';

  @override
  String get numberFive => 'Five';

  @override
  String get numberSix => 'Six';

  @override
  String get numberSeven => 'Seven';

  @override
  String get numberEight => 'Eight';

  @override
  String get numberNine => 'Nine';

  @override
  String get numberTen => 'Ten';

  @override
  String get shapeCircle => 'Circle';

  @override
  String get shapeSquare => 'Square';

  @override
  String get shapeTriangle => 'Triangle';

  @override
  String get shapeRectangle => 'Rectangle';

  @override
  String get shapeStar => 'Star';

  @override
  String get shapeHeart => 'Heart';

  @override
  String get parentGateTitle => 'Parent Gate';

  @override
  String parentGateQuestion(int num1, int num2) {
    return 'To continue: $num1 + $num2 = ?';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get soundOn => 'Sound On';

  @override
  String get soundOff => 'Sound Off';

  @override
  String get musicOn => 'Music On';

  @override
  String get musicOff => 'Music Off';

  @override
  String get languageLabel => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get loadingText => 'Loading...';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String get tryAgainLater => 'Please try again later';

  @override
  String get parentNote =>
      'This app is ad-free and safe. It does not collect personal data.';
}
