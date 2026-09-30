// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Sayı Bahçesi';

  @override
  String get mascotName => 'Pamuk';

  @override
  String get welcomeTitle => 'Merhaba! Ben Pamuk 🐰';

  @override
  String get welcomeSubtitle => 'Sayıları ve şekilleri birlikte öğrenelim!';

  @override
  String get startButton => 'Başla';

  @override
  String get backButton => 'Geri';

  @override
  String get nextButton => 'İleri';

  @override
  String get skipButton => 'Atla';

  @override
  String get againButton => 'Tekrar';

  @override
  String get closeButton => 'Kapat';

  @override
  String get confirmButton => 'Onayla';

  @override
  String get cancelButton => 'İptal';

  @override
  String get retryButton => 'Yeniden Dene';

  @override
  String get numbersSection => 'Sayılar';

  @override
  String get shapesSection => 'Şekiller';

  @override
  String get rewardsSection => 'Ödüllerim';

  @override
  String get learnMode => 'Öğren';

  @override
  String get quizMode => 'Oyna';

  @override
  String get numbersTitle => 'Sayıları Öğreniyorum';

  @override
  String get shapesTitle => 'Şekilleri Öğreniyorum';

  @override
  String get countThis => 'Bunları say!';

  @override
  String get howMany => 'Kaç tane var?';

  @override
  String get whichShape => 'Bu hangi şekil?';

  @override
  String findShape(String shape) {
    return '$shape nerede?';
  }

  @override
  String get selectLevel => 'Seviye Seç';

  @override
  String get levelEasy => 'Kolay';

  @override
  String get levelMedium => 'Orta';

  @override
  String get levelHard => 'Zor';

  @override
  String get correctAnswer => 'Harika! Doğru! 🌟';

  @override
  String get wrongAnswer => 'Tekrar dene! 💪';

  @override
  String get tryAgain => 'Bir daha bakalım';

  @override
  String scoreText(int score, int total) {
    return '$score / $total';
  }

  @override
  String get greatJob => 'Muhteşemsin!';

  @override
  String get goodJob => 'Güzel iş!';

  @override
  String get keepTrying => 'Devam et, başaracaksın!';

  @override
  String get wellDone => 'Aferin!';

  @override
  String get perfectScore => 'Mükemmel! Hepsini doğru yaptın! 🎉';

  @override
  String earnedStars(int count) {
    return '$count yıldız kazandın!';
  }

  @override
  String get numberOne => 'Bir';

  @override
  String get numberTwo => 'İki';

  @override
  String get numberThree => 'Üç';

  @override
  String get numberFour => 'Dört';

  @override
  String get numberFive => 'Beş';

  @override
  String get numberSix => 'Altı';

  @override
  String get numberSeven => 'Yedi';

  @override
  String get numberEight => 'Sekiz';

  @override
  String get numberNine => 'Dokuz';

  @override
  String get numberTen => 'On';

  @override
  String get shapeCircle => 'Daire';

  @override
  String get shapeSquare => 'Kare';

  @override
  String get shapeTriangle => 'Üçgen';

  @override
  String get shapeRectangle => 'Dikdörtgen';

  @override
  String get shapeStar => 'Yıldız';

  @override
  String get shapeHeart => 'Kalp';

  @override
  String get parentGateTitle => 'Ebeveyn Kapısı';

  @override
  String parentGateQuestion(int num1, int num2) {
    return 'Devam etmek için: $num1 + $num2 = ?';
  }

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get soundOn => 'Ses Açık';

  @override
  String get soundOff => 'Ses Kapalı';

  @override
  String get musicOn => 'Müzik Açık';

  @override
  String get musicOff => 'Müzik Kapalı';

  @override
  String get languageLabel => 'Dil';

  @override
  String get selectLanguage => 'Dil Seç';

  @override
  String get loadingText => 'Yükleniyor...';

  @override
  String get noInternetConnection => 'İnternet bağlantısı yok';

  @override
  String get tryAgainLater => 'Daha sonra tekrar dene';

  @override
  String get parentNote =>
      'Bu uygulama reklamsız ve güvenlidir. Kişisel veri toplamaz.';
}
