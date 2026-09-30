import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('tr'),
    Locale('en'),
  ];

  /// Uygulamanın görünen adı. MaterialApp title'da kullanılır.
  ///
  /// In tr, this message translates to:
  /// **'Sayı Bahçesi'**
  String get appName;

  /// Maskot tavşanın adı. Tüm ekranlarda tutarlı olmalı.
  ///
  /// In tr, this message translates to:
  /// **'Pamuk'**
  String get mascotName;

  /// Ana ekranda maskotun konuşma balonundaki karşılama başlığı.
  ///
  /// In tr, this message translates to:
  /// **'Merhaba! Ben Pamuk 🐰'**
  String get welcomeTitle;

  /// Karşılama başlığının altındaki açıklama.
  ///
  /// In tr, this message translates to:
  /// **'Sayıları ve şekilleri birlikte öğrenelim!'**
  String get welcomeSubtitle;

  /// Ana ekrandaki başlangıç butonu.
  ///
  /// In tr, this message translates to:
  /// **'Başla'**
  String get startButton;

  /// Geri gitme butonu (tüm ekranlarda ortak).
  ///
  /// In tr, this message translates to:
  /// **'Geri'**
  String get backButton;

  /// İleri gitme butonu (sayı/şekil geçişleri).
  ///
  /// In tr, this message translates to:
  /// **'İleri'**
  String get nextButton;

  /// Atla butonu (isteğe bağlı, tutorial için).
  ///
  /// In tr, this message translates to:
  /// **'Atla'**
  String get skipButton;

  /// Tekrar oyna butonu (sonuç ekranı).
  ///
  /// In tr, this message translates to:
  /// **'Tekrar'**
  String get againButton;

  /// Kapatma butonu (diyalog, modal).
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get closeButton;

  /// Onaylama butonu.
  ///
  /// In tr, this message translates to:
  /// **'Onayla'**
  String get confirmButton;

  /// İptal butonu.
  ///
  /// In tr, this message translates to:
  /// **'İptal'**
  String get cancelButton;

  /// Hata sonrası yeniden deneme butonu.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden Dene'**
  String get retryButton;

  /// Ana menüdeki Sayılar butonu.
  ///
  /// In tr, this message translates to:
  /// **'Sayılar'**
  String get numbersSection;

  /// Ana menüdeki Şekiller butonu.
  ///
  /// In tr, this message translates to:
  /// **'Şekiller'**
  String get shapesSection;

  /// Ana menüdeki Ödüllerim butonu.
  ///
  /// In tr, this message translates to:
  /// **'Ödüllerim'**
  String get rewardsSection;

  /// Öğrenme modu butonu (quiz yerine).
  ///
  /// In tr, this message translates to:
  /// **'Öğren'**
  String get learnMode;

  /// Quiz/oyun modu butonu.
  ///
  /// In tr, this message translates to:
  /// **'Oyna'**
  String get quizMode;

  /// Sayı öğrenme ekranının başlığı.
  ///
  /// In tr, this message translates to:
  /// **'Sayıları Öğreniyorum'**
  String get numbersTitle;

  /// Şekil öğrenme ekranının başlığı.
  ///
  /// In tr, this message translates to:
  /// **'Şekilleri Öğreniyorum'**
  String get shapesTitle;

  /// Ekrandaki nesneleri sayması istendiğinde gösterilen talimat.
  ///
  /// In tr, this message translates to:
  /// **'Bunları say!'**
  String get countThis;

  /// Sayma sorusunda çocuğa sorulan soru.
  ///
  /// In tr, this message translates to:
  /// **'Kaç tane var?'**
  String get howMany;

  /// Şekil tanıma sorusu.
  ///
  /// In tr, this message translates to:
  /// **'Bu hangi şekil?'**
  String get whichShape;

  /// Belirli bir şekli bulma sorusu. Örn: 'Daire nerede?'
  ///
  /// In tr, this message translates to:
  /// **'{shape} nerede?'**
  String findShape(String shape);

  /// Seviye seçim ekranının başlığı.
  ///
  /// In tr, this message translates to:
  /// **'Seviye Seç'**
  String get selectLevel;

  /// Kolay seviye adı.
  ///
  /// In tr, this message translates to:
  /// **'Kolay'**
  String get levelEasy;

  /// Orta seviye adı.
  ///
  /// In tr, this message translates to:
  /// **'Orta'**
  String get levelMedium;

  /// Zor seviye adı.
  ///
  /// In tr, this message translates to:
  /// **'Zor'**
  String get levelHard;

  /// Doğru cevap sonrası geri bildirim.
  ///
  /// In tr, this message translates to:
  /// **'Harika! Doğru! 🌟'**
  String get correctAnswer;

  /// Yanlış cevap sonrası geri bildirim.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar dene! 💪'**
  String get wrongAnswer;

  /// Yanlış cevap sonrası nazik yönlendirme.
  ///
  /// In tr, this message translates to:
  /// **'Bir daha bakalım'**
  String get tryAgain;

  /// Skor gösterimi. Örn: '7 / 10'
  ///
  /// In tr, this message translates to:
  /// **'{score} / {total}'**
  String scoreText(int score, int total);

  /// Yüksek skorda (8+) gösterilen mesaj.
  ///
  /// In tr, this message translates to:
  /// **'Muhteşemsin!'**
  String get greatJob;

  /// Orta skorda (5-7) gösterilen mesaj.
  ///
  /// In tr, this message translates to:
  /// **'Güzel iş!'**
  String get goodJob;

  /// Düşük skorda (<5) cesaretlendirme mesajı.
  ///
  /// In tr, this message translates to:
  /// **'Devam et, başaracaksın!'**
  String get keepTrying;

  /// Kısa başarı mesajı.
  ///
  /// In tr, this message translates to:
  /// **'Aferin!'**
  String get wellDone;

  /// Tam puan (10/10) için özel mesaj.
  ///
  /// In tr, this message translates to:
  /// **'Mükemmel! Hepsini doğru yaptın! 🎉'**
  String get perfectScore;

  /// Kazanılan yıldız sayısı mesajı.
  ///
  /// In tr, this message translates to:
  /// **'{count} yıldız kazandın!'**
  String earnedStars(int count);

  /// 1 sayısının Türkçe okunuşu.
  ///
  /// In tr, this message translates to:
  /// **'Bir'**
  String get numberOne;

  /// 2 sayısının Türkçe okunuşu.
  ///
  /// In tr, this message translates to:
  /// **'İki'**
  String get numberTwo;

  /// 3 sayısının Türkçe okunuşu.
  ///
  /// In tr, this message translates to:
  /// **'Üç'**
  String get numberThree;

  /// 4 sayısının Türkçe okunuşu.
  ///
  /// In tr, this message translates to:
  /// **'Dört'**
  String get numberFour;

  /// 5 sayısının Türkçe okunuşu.
  ///
  /// In tr, this message translates to:
  /// **'Beş'**
  String get numberFive;

  /// 6 sayısının Türkçe okunuşu.
  ///
  /// In tr, this message translates to:
  /// **'Altı'**
  String get numberSix;

  /// 7 sayısının Türkçe okunuşu.
  ///
  /// In tr, this message translates to:
  /// **'Yedi'**
  String get numberSeven;

  /// 8 sayısının Türkçe okunuşu.
  ///
  /// In tr, this message translates to:
  /// **'Sekiz'**
  String get numberEight;

  /// 9 sayısının Türkçe okunuşu.
  ///
  /// In tr, this message translates to:
  /// **'Dokuz'**
  String get numberNine;

  /// 10 sayısının Türkçe okunuşu.
  ///
  /// In tr, this message translates to:
  /// **'On'**
  String get numberTen;

  /// Daire şeklinin adı.
  ///
  /// In tr, this message translates to:
  /// **'Daire'**
  String get shapeCircle;

  /// Kare şeklinin adı.
  ///
  /// In tr, this message translates to:
  /// **'Kare'**
  String get shapeSquare;

  /// Üçgen şeklinin adı.
  ///
  /// In tr, this message translates to:
  /// **'Üçgen'**
  String get shapeTriangle;

  /// Dikdörtgen şeklinin adı.
  ///
  /// In tr, this message translates to:
  /// **'Dikdörtgen'**
  String get shapeRectangle;

  /// Yıldız şeklinin adı.
  ///
  /// In tr, this message translates to:
  /// **'Yıldız'**
  String get shapeStar;

  /// Kalp şeklinin adı.
  ///
  /// In tr, this message translates to:
  /// **'Kalp'**
  String get shapeHeart;

  /// Ebeveyn doğrulama ekranının başlığı.
  ///
  /// In tr, this message translates to:
  /// **'Ebeveyn Kapısı'**
  String get parentGateTitle;

  /// Ebeveyn kapısı matematik sorusu. Çocukların geçemeyeceği zorlukta olmalı.
  ///
  /// In tr, this message translates to:
  /// **'Devam etmek için: {num1} + {num2} = ?'**
  String parentGateQuestion(int num1, int num2);

  /// Ayarlar ekranının başlığı.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get settingsTitle;

  /// Sesin açık olduğunu belirten etiket.
  ///
  /// In tr, this message translates to:
  /// **'Ses Açık'**
  String get soundOn;

  /// Sesin kapalı olduğunu belirten etiket.
  ///
  /// In tr, this message translates to:
  /// **'Ses Kapalı'**
  String get soundOff;

  /// Arka plan müziğinin açık olduğunu belirten etiket.
  ///
  /// In tr, this message translates to:
  /// **'Müzik Açık'**
  String get musicOn;

  /// Arka plan müziğinin kapalı olduğunu belirten etiket.
  ///
  /// In tr, this message translates to:
  /// **'Müzik Kapalı'**
  String get musicOff;

  /// Dil seçimi etiketi.
  ///
  /// In tr, this message translates to:
  /// **'Dil'**
  String get languageLabel;

  /// Dil seçim ekranının başlığı.
  ///
  /// In tr, this message translates to:
  /// **'Dil Seç'**
  String get selectLanguage;

  /// Yükleme sırasında gösterilen metin.
  ///
  /// In tr, this message translates to:
  /// **'Yükleniyor...'**
  String get loadingText;

  /// İnternet yoksa gösterilen hata mesajı.
  ///
  /// In tr, this message translates to:
  /// **'İnternet bağlantısı yok'**
  String get noInternetConnection;

  /// Genel hata mesajı.
  ///
  /// In tr, this message translates to:
  /// **'Daha sonra tekrar dene'**
  String get tryAgainLater;

  /// Ana ekranda ebeveynlere gösterilen bilgi notu.
  ///
  /// In tr, this message translates to:
  /// **'Bu uygulama reklamsız ve güvenlidir. Kişisel veri toplamaz.'**
  String get parentNote;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
