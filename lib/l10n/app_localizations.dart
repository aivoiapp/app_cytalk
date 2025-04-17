import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static List<Locale> supportedLocales = [
    const Locale('en', ''),
    const Locale('es', ''),
  ];

  String get appTitle => Intl.message(
    'CyTalk',
    name: 'appTitle',
    locale: locale.toString(),
  );

  String get welcome {
    return Intl.message(
      'Welcome to CyTalk',
      name: 'welcome',
      locale: locale.toString(),
    );
  }

  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      locale: locale.toString(),
    );
  }

  String get languageEs => Intl.message(
    'Español',
    name: 'languageEs',
    locale: locale.toString(),
  );

  String get languageEn => Intl.message(
    'English',
    name: 'languageEn',
    locale: locale.toString(),
  );

  String get notFound => Intl.message(
    'Page not found',
    name: 'notFound',
    locale: locale.toString(),
  );

  String get genderPrompt => Intl.message(
    'What gender do you identify with?',
    name: 'genderPrompt',
    locale: locale.toString(),
  );

  String get genderDescription => Intl.message(
    'Help us personalize your experience',
    name: 'genderDescription',
    locale: locale.toString(),
  );

  String get namePrompt => Intl.message(
    'What\'s your name?',
    name: 'namePrompt',
    locale: locale.toString(),
  );

  String get welcomeTitle => Intl.message(
    'We’d love to get to know you',
    name: 'welcomeTitle',
    locale: locale.toString(),
  );

  String get agePrompt => Intl.message(
    'How old are you?',
    name: 'agePrompt',
    locale: locale.toString(),
  );

  String get ageDescription => Intl.message(
    'This helps us personalize your experience',
    name: 'ageDescription',
    locale: locale.toString(),
  );

  String get mainHeadline => Intl.message(
    'Learn English the smart way',
    name: 'mainHeadline',
    locale: locale.toString(),
  );

  String get practiceHeadline => Intl.message(
    'Personalized practices with AI that adapt to your level and specific needs',
    name: 'practiceHeadline',
    locale: locale.toString(),
  );

  String get discoverLevel => Intl.message(
    'Discover your real English level',
    name: 'discoverLevel',
    locale: locale.toString(),
  );

  String get discoverDescription => Intl.message(
    'Our adaptive placement test uses AI to accurately determine your current level and provide personalized exercises to help you improve quickly.',
    name: 'discoverDescription',
    locale: locale.toString(),
  );

  String get intelligently => Intl.message(
    'Intelligently',
    name: 'intelligently',
    locale: locale.toString(),
  );

  String get gamificationTitle => Intl.message(
    'Gamification',
    name: 'gamificationTitle',
    locale: locale.toString(),
  );

  String get gamificationDescription => Intl.message(
    'Stay motivated with points, badges, and a progressive level system',
    name: 'gamificationDescription',
    locale: locale.toString(),
  );

  String get startNow => Intl.message(
    'Start now',
    name: 'startNow',
    locale: locale.toString(),
  );

  String get enterYourName => Intl.message(
    'Enter your name',
    name: 'enterYourName',
    locale: locale.toString(),
  );

  String get pleaseEnterYourName => Intl.message(
    'Please enter your name',
    name: 'pleaseEnterYourName',
    locale: locale.toString(),
  );

  String get nameMustHaveAtLeastTwoLetters => Intl.message(
    'The name must have at least 2 letters',
    name: 'nameMustHaveAtLeastTwoLetters',
    locale: locale.toString(),
  );

  String get nameMustNotExceedThirtyCharacters => Intl.message(
    'The name must not exceed 30 characters',
    name: 'nameMustNotExceedThirtyCharacters',
    locale: locale.toString(),
  );

  String get enterYourAge => Intl.message(
    'Enter your age',
    name: 'enterYourAge',
    locale: locale.toString(),
  );

  String get pleaseEnterYourAge => Intl.message(
    'Please enter your age',
    name: 'pleaseEnterYourAge',
    locale: locale.toString(),
  );

  String get enterAValidNumber => Intl.message(
    'Enter a valid number',
    name: 'enterAValidNumber',
    locale: locale.toString(),
  );

  String get mustBeAtLeastFiveYearsOld => Intl.message(
    'Must be at least 5 years old',
    name: 'mustBeAtLeastFiveYearsOld',
    locale: locale.toString(),
  );

  String get invalidAge => Intl.message(
    'Invalid age',
    name: 'invalidAge',
    locale: locale.toString(),
  );

  String get startTest => Intl.message(
    'Start test',
    name: 'startTest',
    locale: locale.toString(),
  );

  String get continueText => Intl.message(
    'Continue',
    name: 'continueText',
    locale: locale.toString(),
  );

  String get genderMale => Intl.message(
    'Male',
    name: 'genderMale',
    locale: locale.toString(),
  );
  
  String get genderFemale => Intl.message(
    'Female',
    name: 'genderFemale',
    locale: locale.toString(),
  );
  
  String get genderOther => Intl.message(
    'Other',
    name: 'genderOther',
    locale: locale.toString(),
  );
  
  String get pleaseSelectAnOption => Intl.message(
    'Please select an option',
    name: 'pleaseSelectAnOption',
    locale: locale.toString(),
  );
  
  String get levelA1 => Intl.message(
    'A1 - Beginner',
    name: 'levelA1',
    locale: locale.toString(),
  );
  
  String get levelA2 => Intl.message(
    'A2 - Elementary',
    name: 'levelA2',
    locale: locale.toString(),
  );
  
  String get levelB1 => Intl.message(
    'B1 - Intermediate',
    name: 'levelB1',
    locale: locale.toString(),
  );
  
  String get levelB2 => Intl.message(
    'B2 - Upper Intermediate',
    name: 'levelB2',
    locale: locale.toString(),
  );
  
  String get levelC1 => Intl.message(
    'C1 - Advanced',
    name: 'levelC1',
    locale: locale.toString(),
  );
  
  String get levelC2 => Intl.message(
    'C2 - Mastery',
    name: 'levelC2',
    locale: locale.toString(),
  );
  
  String get levelPrompt => Intl.message(
    'What level do you think you are?',
    name: 'levelPrompt',
    locale: locale.toString(),
  );
  
  String get testIntroInfo => Intl.message(
    'This helps us calibrate the initial test',
    name: 'testIntroInfo',
    locale: locale.toString(),
  );
  
  String get levelTitle => Intl.message(
    'English Level',
    name: 'levelTitle',
    locale: locale.toString(),
  );
  
  String get selectYourLevel => Intl.message(
    'Select your level',
    name: 'selectYourLevel',
    locale: locale.toString(),
  );
  
  String get pleaseSelectYourLevel => Intl.message(
    'Please select your level',
    name: 'pleaseSelectYourLevel',
    locale: locale.toString(),
  );
  
  String get testIntroTitle => Intl.message(
    'Placement Test',
    name: 'testIntroTitle',
    locale: locale.toString(),
  );
  
  String get testIntroDescription => Intl.message(
    'Let\'s determine your English level with an adaptive test',
    name: 'testIntroDescription',
    locale: locale.toString(),
  );
  
  String get adaptiveQuestionsTitle => Intl.message(
    '15 adaptive questions',
    name: 'adaptiveQuestionsTitle',
    locale: locale.toString(),
  );
  
  String get adaptiveQuestionsSubtitle => Intl.message(
    '5 grammar, 5 reading comprehension, 5 vocabulary',
    name: 'adaptiveQuestionsSubtitle',
    locale: locale.toString(),
  );
  
  String get limitedTimeTitle => Intl.message(
    'Limited time',
    name: 'limitedTimeTitle',
    locale: locale.toString(),
  );
  
  String get limitedTimeSubtitle => Intl.message(
    '30 seconds per question to assess your fluency',
    name: 'limitedTimeSubtitle',
    locale: locale.toString(),
  );
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    Intl.defaultLocale = locale.toString();
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}