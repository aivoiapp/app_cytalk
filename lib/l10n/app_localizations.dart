import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @startTest.
  ///
  /// In en, this message translates to:
  /// **'Start test'**
  String get startTest;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @pleaseEnterYourName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get pleaseEnterYourName;

  /// No description provided for @nameMustHaveAtLeastTwoLetters.
  ///
  /// In en, this message translates to:
  /// **'The name must have at least 2 letters'**
  String get nameMustHaveAtLeastTwoLetters;

  /// No description provided for @nameMustNotExceedThirtyCharacters.
  ///
  /// In en, this message translates to:
  /// **'The name must not exceed 30 characters'**
  String get nameMustNotExceedThirtyCharacters;

  /// No description provided for @startNow.
  ///
  /// In en, this message translates to:
  /// **'Start now'**
  String get startNow;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'CyTalk'**
  String get appTitle;

  /// No description provided for @languageEs.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get languageEs;

  /// No description provided for @languageEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEn;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'We’d love to get to know you'**
  String get welcomeTitle;

  /// No description provided for @namePrompt.
  ///
  /// In en, this message translates to:
  /// **'What\'s your name?'**
  String get namePrompt;

  /// No description provided for @agePrompt.
  ///
  /// In en, this message translates to:
  /// **'How old are you?'**
  String get agePrompt;

  /// No description provided for @ageDescription.
  ///
  /// In en, this message translates to:
  /// **'This helps us personalize your experience'**
  String get ageDescription;

  /// No description provided for @genderPrompt.
  ///
  /// In en, this message translates to:
  /// **'What gender do you identify with?'**
  String get genderPrompt;

  /// No description provided for @genderDescription.
  ///
  /// In en, this message translates to:
  /// **'Help us personalize your experience'**
  String get genderDescription;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @genderOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get genderOther;

  /// No description provided for @pleaseSelectAnOption.
  ///
  /// In en, this message translates to:
  /// **'Please select an option'**
  String get pleaseSelectAnOption;

  /// No description provided for @levelA1.
  ///
  /// In en, this message translates to:
  /// **'A1 - Beginner'**
  String get levelA1;

  /// No description provided for @levelA2.
  ///
  /// In en, this message translates to:
  /// **'A2 - Elementary'**
  String get levelA2;

  /// No description provided for @levelB1.
  ///
  /// In en, this message translates to:
  /// **'B1 - Intermediate'**
  String get levelB1;

  /// No description provided for @levelB2.
  ///
  /// In en, this message translates to:
  /// **'B2 - Upper Intermediate'**
  String get levelB2;

  /// No description provided for @levelC1.
  ///
  /// In en, this message translates to:
  /// **'C1 - Advanced'**
  String get levelC1;

  /// No description provided for @levelC2.
  ///
  /// In en, this message translates to:
  /// **'C2 - Mastery'**
  String get levelC2;

  /// No description provided for @levelPrompt.
  ///
  /// In en, this message translates to:
  /// **'What level do you think you are?'**
  String get levelPrompt;

  /// No description provided for @testIntroInfo.
  ///
  /// In en, this message translates to:
  /// **'This helps us calibrate the initial test'**
  String get testIntroInfo;

  /// No description provided for @levelTitle.
  ///
  /// In en, this message translates to:
  /// **'English Level'**
  String get levelTitle;

  /// No description provided for @selectYourLevel.
  ///
  /// In en, this message translates to:
  /// **'Select your level'**
  String get selectYourLevel;

  /// No description provided for @pleaseSelectYourLevel.
  ///
  /// In en, this message translates to:
  /// **'Please select your level'**
  String get pleaseSelectYourLevel;

  /// No description provided for @testIntroTitle.
  ///
  /// In en, this message translates to:
  /// **'Placement Test'**
  String get testIntroTitle;

  /// No description provided for @testIntroDescription.
  ///
  /// In en, this message translates to:
  /// **'Let\'s determine your English level with an adaptive test'**
  String get testIntroDescription;

  /// No description provided for @adaptiveQuestionsTitle.
  ///
  /// In en, this message translates to:
  /// **'15 adaptive questions'**
  String get adaptiveQuestionsTitle;

  /// No description provided for @adaptiveQuestionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'5 grammar, 5 reading comprehension, 5 vocabulary'**
  String get adaptiveQuestionsSubtitle;

  /// No description provided for @limitedTimeTitle.
  ///
  /// In en, this message translates to:
  /// **'Limited time'**
  String get limitedTimeTitle;

  /// No description provided for @limitedTimeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'30 seconds per question to assess your fluency'**
  String get limitedTimeSubtitle;

  /// No description provided for @practiceHeadline.
  ///
  /// In en, this message translates to:
  /// **'Personalized practices with AI that adapt to your level and specific needs'**
  String get practiceHeadline;

  /// No description provided for @mainHeadline.
  ///
  /// In en, this message translates to:
  /// **'Learn English the smart way'**
  String get mainHeadline;

  /// No description provided for @discoverLevel.
  ///
  /// In en, this message translates to:
  /// **'Discover your real English level'**
  String get discoverLevel;

  /// No description provided for @discoverDescription.
  ///
  /// In en, this message translates to:
  /// **'Our adaptive placement test uses AI to accurately determine your current level and provide personalized exercises to help you improve quickly.'**
  String get discoverDescription;

  /// No description provided for @a1.
  ///
  /// In en, this message translates to:
  /// **'A1'**
  String get a1;

  /// No description provided for @a2.
  ///
  /// In en, this message translates to:
  /// **'A2'**
  String get a2;

  /// No description provided for @b1.
  ///
  /// In en, this message translates to:
  /// **'B1'**
  String get b1;

  /// No description provided for @b2.
  ///
  /// In en, this message translates to:
  /// **'B2'**
  String get b2;

  /// No description provided for @notFound.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get notFound;

  /// No description provided for @intelligently.
  ///
  /// In en, this message translates to:
  /// **'Intelligently'**
  String get intelligently;

  /// No description provided for @gamificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Gamification'**
  String get gamificationTitle;

  /// No description provided for @gamificationDescription.
  ///
  /// In en, this message translates to:
  /// **'Stay motivated with points, badges, and a progressive level system'**
  String get gamificationDescription;

  /// No description provided for @enterYourAge.
  ///
  /// In en, this message translates to:
  /// **'Enter your age'**
  String get enterYourAge;

  /// No description provided for @pleaseEnterYourAge.
  ///
  /// In en, this message translates to:
  /// **'Please enter your age'**
  String get pleaseEnterYourAge;

  /// No description provided for @enterAValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid number'**
  String get enterAValidNumber;

  /// No description provided for @mustBeAtLeastFiveYearsOld.
  ///
  /// In en, this message translates to:
  /// **'Must be at least 5 years old'**
  String get mustBeAtLeastFiveYearsOld;

  /// No description provided for @invalidAge.
  ///
  /// In en, this message translates to:
  /// **'Invalid age'**
  String get invalidAge;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
