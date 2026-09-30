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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @appName.
  ///
  /// In tr, this message translates to:
  /// **'Sayı Bahçesi'**
  String get appName;

  /// No description provided for @mascotName.
  ///
  /// In tr, this message translates to:
  /// **'Pamuk'**
  String get mascotName;

  /// No description provided for @welcomeTitle.
  ///
  /// In tr, this message translates to:
  /// **'Merhaba! Ben Pamuk 🐰'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Sayıları ve şekilleri birlikte öğrenelim!'**
  String get welcomeSubtitle;

  /// No description provided for @startButton.
  ///
  /// In tr, this message translates to:
  /// **'Başla'**
  String get startButton;

  /// No description provided for @backButton.
  ///
  /// In tr, this message translates to:
  /// **'Geri'**
  String get backButton;

  /// No description provided for @nextButton.
  ///
  /// In tr, this message translates to:
  /// **'İleri'**
  String get nextButton;

  /// No description provided for @skipButton.
  ///
  /// In tr, this message translates to:
  /// **'Atla'**
  String get skipButton;

  /// No description provided for @againButton.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar'**
  String get againButton;

  /// No description provided for @numbersSection.
  ///
  /// In tr, this message translates to:
  /// **'Sayılar'**
  String get numbersSection;

  /// No description provided for @shapesSection.
  ///
  /// In tr, this message translates to:
  /// **'Şekiller'**
  String get shapesSection;

  /// No description provided for @rewardsSection.
  ///
  /// In tr, this message translates to:
  /// **'Ödüllerim'**
  String get rewardsSection;

  /// No description provided for @learnMode.
  ///
  /// In tr, this message translates to:
  /// **'Öğren'**
  String get learnMode;

  /// No description provided for @quizMode.
  ///
  /// In tr, this message translates to:
  /// **'Oyna'**
  String get quizMode;

  /// No description provided for @numbersTitle.
  ///
  /// In tr, this message translates to:
  /// **'Sayıları Öğreniyorum'**
  String get numbersTitle;

  /// No description provided for @shapesTitle.
  ///
  /// In tr, this message translates to:
  /// **'Şekilleri Öğreniyorum'**
  String get shapesTitle;

  /// No description provided for @countThis.
  ///
  /// In tr, this message translates to:
  /// **'Bunları say!'**
  String get countThis;

  /// No description provided for @howMany.
  ///
  /// In tr, this message translates to:
  /// **'Kaç tane var?'**
  String get howMany;

  /// No description provided for @whichShape.
  ///
  /// In tr, this message translates to:
  /// **'Bu hangi şekil?'**
  String get whichShape;

  /// No description provided for @findShape.
  ///
  /// In tr, this message translates to:
  /// **'{shape} nerede?'**
  String findShape(String shape);

  /// No description provided for @correctAnswer.
  ///
  /// In tr, this message translates to:
  /// **'Harika! Doğru! 🌟'**
  String get correctAnswer;

  /// No description provided for @wrongAnswer.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar dene! 💪'**
  String get wrongAnswer;

  /// No description provided for @tryAgain.
  ///
  /// In tr, this message translates to:
  /// **'Bir daha bakalım'**
  String get tryAgain;

  /// No description provided for @scoreText.
  ///
  /// In tr, this message translates to:
  /// **'{score} / {total}'**
  String scoreText(int score, int total);

  /// No description provided for @greatJob.
  ///
  /// In tr, this message translates to:
  /// **'Muhteşemsin!'**
  String get greatJob;

  /// No description provided for @goodJob.
  ///
  /// In tr, this message translates to:
  /// **'Güzel iş!'**
  String get goodJob;

  /// No description provided for @keepTrying.
  ///
  /// In tr, this message translates to:
  /// **'Devam et, başaracaksın!'**
  String get keepTrying;

  /// No description provided for @earnedStars.
  ///
  /// In tr, this message translates to:
  /// **'{count} yıldız kazandın!'**
  String earnedStars(int count);

  /// No description provided for @numberOne.
  ///
  /// In tr, this message translates to:
  /// **'Bir'**
  String get numberOne;

  /// No description provided for @numberTwo.
  ///
  /// In tr, this message translates to:
  /// **'İki'**
  String get numberTwo;

  /// No description provided for @numberThree.
  ///
  /// In tr, this message translates to:
  /// **'Üç'**
  String get numberThree;

  /// No description provided for @numberFour.
  ///
  /// In tr, this message translates to:
  /// **'Dört'**
  String get numberFour;

  /// No description provided for @numberFive.
  ///
  /// In tr, this message translates to:
  /// **'Beş'**
  String get numberFive;

  /// No description provided for @numberSix.
  ///
  /// In tr, this message translates to:
  /// **'Altı'**
  String get numberSix;

  /// No description provided for @numberSeven.
  ///
  /// In tr, this message translates to:
  /// **'Yedi'**
  String get numberSeven;

  /// No description provided for @numberEight.
  ///
  /// In tr, this message translates to:
  /// **'Sekiz'**
  String get numberEight;

  /// No description provided for @numberNine.
  ///
  /// In tr, this message translates to:
  /// **'Dokuz'**
  String get numberNine;

  /// No description provided for @numberTen.
  ///
  /// In tr, this message translates to:
  /// **'On'**
  String get numberTen;

  /// No description provided for @shapeCircle.
  ///
  /// In tr, this message translates to:
  /// **'Daire'**
  String get shapeCircle;

  /// No description provided for @shapeSquare.
  ///
  /// In tr, this message translates to:
  /// **'Kare'**
  String get shapeSquare;

  /// No description provided for @shapeTriangle.
  ///
  /// In tr, this message translates to:
  /// **'Üçgen'**
  String get shapeTriangle;

  /// No description provided for @shapeRectangle.
  ///
  /// In tr, this message translates to:
  /// **'Dikdörtgen'**
  String get shapeRectangle;

  /// No description provided for @shapeStar.
  ///
  /// In tr, this message translates to:
  /// **'Yıldız'**
  String get shapeStar;

  /// No description provided for @shapeHeart.
  ///
  /// In tr, this message translates to:
  /// **'Kalp'**
  String get shapeHeart;

  /// No description provided for @parentGateTitle.
  ///
  /// In tr, this message translates to:
  /// **'Ebeveyn Kapısı'**
  String get parentGateTitle;

  /// No description provided for @parentGateQuestion.
  ///
  /// In tr, this message translates to:
  /// **'Devam etmek için: {num1} + {num2} = ?'**
  String parentGateQuestion(int num1, int num2);

  /// No description provided for @settingsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get settingsTitle;

  /// No description provided for @soundOn.
  ///
  /// In tr, this message translates to:
  /// **'Ses Açık'**
  String get soundOn;

  /// No description provided for @soundOff.
  ///
  /// In tr, this message translates to:
  /// **'Ses Kapalı'**
  String get soundOff;

  /// No description provided for @musicOn.
  ///
  /// In tr, this message translates to:
  /// **'Müzik Açık'**
  String get musicOn;

  /// No description provided for @musicOff.
  ///
  /// In tr, this message translates to:
  /// **'Müzik Kapalı'**
  String get musicOff;

  /// No description provided for @languageLabel.
  ///
  /// In tr, this message translates to:
  /// **'Dil'**
  String get languageLabel;

  /// No description provided for @parentNote.
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
