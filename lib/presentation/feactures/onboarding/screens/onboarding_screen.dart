import 'package:cytalk/l10n/app_localizations.dart';
import 'package:cytalk/presentation/feactures/onboarding/widgets/widgets.dart';
import 'package:cytalk/presentation/feactures/placement_test/views/placement_test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cytalk/presentation/resources/resources.dart';
import 'package:cytalk/services/question_generator.dart';
import 'package:cytalk/services/deepseek_api_service.dart';
import 'package:provider/provider.dart';
import 'package:cytalk/presentation/features/placement_test/widgets/evaluation_loader.dart';
import 'package:cytalk/presentation/widgets/error_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalSteps = 5;

  final _nameFormKey = GlobalKey<FormBuilderState>();
  final _ageFormKey = GlobalKey<FormBuilderState>();
  final _genderFormKey = GlobalKey<FormBuilderState>();
  final _levelFormKey = GlobalKey<FormBuilderState>();

  late final Map<int, GlobalKey<FormBuilderState>> _formKeys;
  late final QuestionGenerator _questionGenerator;
  final Map<String, dynamic> _formData = {};

  @override
  void initState() {
    super.initState();
    _formKeys = {
      0: _nameFormKey,
      1: _ageFormKey,
      2: _genderFormKey,
      3: _levelFormKey,
    };
    
    final deepSeekService = Provider.of<DeepSeekApiService>(
      context, 
      listen: false
    );
    _questionGenerator = QuestionGenerator(
      deepSeekApiService: deepSeekService
    );

    _pageController.addListener(() {
      final newPage = _pageController.page?.round();
      if (newPage != null && newPage != _currentPage) {
        setState(() => _currentPage = newPage);
        _loadSavedFormData(_currentPage);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _loadSavedFormData(int pageIndex) {
    final formKey = _formKeys[pageIndex];
    if (formKey != null && formKey.currentState != null) {
      switch (pageIndex) {
        case 0:
          if (_formData.containsKey('name')) {
            formKey.currentState!.patchValue({'name': _formData['name']});
          }
          break;
        case 1:
          if (_formData.containsKey('age')) {
            formKey.currentState!.patchValue({'age': _formData['age']});
          }
          break;
        case 2:
          if (_formData.containsKey('gender')) {
            formKey.currentState!.patchValue({'gender': _formData['gender']});
          }
          break;
        case 3:
          if (_formData.containsKey('level')) {
            formKey.currentState!.patchValue({'level': _formData['level']});
          }
          break;
      }
    }
  }

  void _nextPage() async {
    FocusScope.of(context).unfocus();

    final currentFormKey = _formKeys[_currentPage];
    bool isValid = true;

    if (currentFormKey != null) {
      isValid = currentFormKey.currentState?.saveAndValidate() ?? false;
      if (isValid && currentFormKey.currentState?.value != null) {
        _formData.addAll(currentFormKey.currentState!.value);
      }
    }

    if (isValid) {
      if (_currentPage < _totalSteps - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      } else {
        final name = _formData['name'];
        final age = _formData['age'];
        final gender = _formData['gender'];
        final level = _formData['level'];

        try {
          // Show loader while generating questions
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EvaluationLoader(
                evaluationMessages: [
                  "Procesando...",
                  "Recopilando información del usuario",
                  "Procesando...",
                  "Analizando preferencias de aprendizaje",
                  "Procesando...",
                  "Generando preguntas personalizadas",
                  "Procesando...",
                  "Preparando evaluación",
                  "Procesando...",
                  "Preparando entorno de evaluación",
                ],
              ),
            ),
          );

          // Generate questions in the background
          final questions = await _questionGenerator.generatePlacementTestQuestions(
            {
              'name': name,
              'age': age,
              'gender': gender,
              'level': level,
            },
            Localizations.localeOf(context)
          );

          if (!mounted) return;

          // Navigate to the test screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PlacementTestScreen(questions: questions),
            ),
          );
        } catch (e) {
          if (!mounted) return;
          Navigator.pop(context); // Close the loader if there's an error
          
          // Usar el widget ErrorDialog reutilizable
          ErrorDialog.show(context, e.toString());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.backgroundGradientStart,
              AppColors.backgroundGradientEnd,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 35,
                      height: 35,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'CyTalk',
                      style: AppTextStyles.headlineMedium.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              StepProgressIndicator(
                totalSteps: _totalSteps,
                currentStep: _currentPage,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    OnboardingCard(
                      child: NameStepWidget(formKey: _nameFormKey),
                    ),
                    OnboardingCard(child: AgeStepWidget(formKey: _ageFormKey)),
                    OnboardingCard(
                      child: GenderStepWidget(formKey: _genderFormKey),
                    ),
                    OnboardingCard(
                      child: LevelStepWidget(formKey: _levelFormKey),
                    ),
                    const OnboardingCard(child: TestIntroStepWidget()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: PrimaryButton(
                  text: _currentPage == _totalSteps - 1
                      ? AppLocalizations.of(context)!.startTest
                      : AppLocalizations.of(context)!.continueText,
                  onPressed: _nextPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}