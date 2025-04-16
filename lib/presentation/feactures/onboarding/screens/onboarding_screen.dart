import 'package:cytall/presentation/feactures/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cytall/presentation/resources/resources.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalSteps = 5;

  // Claves separadas para cada formulario
  final _nameFormKey = GlobalKey<FormBuilderState>();
  final _ageFormKey = GlobalKey<FormBuilderState>();
  final _genderFormKey = GlobalKey<FormBuilderState>();
  // ***** CAMBIO: Añadir clave para el nuevo formulario de nivel *****
  final _levelFormKey = GlobalKey<FormBuilderState>();

  late final Map<int, GlobalKey<FormBuilderState>> _formKeys;

  @override
  void initState() {
    super.initState();
    _formKeys = {
      0: _nameFormKey,
      1: _ageFormKey,
      2: _genderFormKey,
      3: _levelFormKey,
    };
    _pageController.addListener(() {
      final newPage = _pageController.page?.round();
      if (newPage != null && newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    final currentFormKey = _formKeys[_currentPage];
    bool isValid = true;

    if (currentFormKey != null) {
      isValid = currentFormKey.currentState?.saveAndValidate() ?? false;
    }

    if (isValid) {
      if (_currentPage < _totalSteps - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      } else {
        // Último paso: Acción final (Ej: Navegar a la prueba)
        print("Onboarding completado!");
        // Recolectar todos los datos
        final name = _nameFormKey.currentState?.value['name'];
        final age = _ageFormKey.currentState?.value['age'];
        final gender = _genderFormKey.currentState?.value['gender'];
        // ***** CAMBIO: Recolectar el nivel *****
        final level = _levelFormKey.currentState?.value['level'];
        print('Datos: Nombre=$name, Edad=$age, Género=$gender, Nivel=$level');
        // TODO: Guardar en SQLite y navegar a la pantalla de prueba
        // Navigator.pushReplacementNamed(context, '/placement_test'); // O usando GoRouter
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    SizedBox(width: 8),
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
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [
                    OnboardingCard(
                      child: NameStepWidget(formKey: _nameFormKey),
                    ),
                    OnboardingCard(child: AgeStepWidget(formKey: _ageFormKey)),
                    OnboardingCard(
                      child: LevelStepWidget(formKey: _levelFormKey),
                    ),
                    OnboardingCard(
                      child: GenderStepWidget(formKey: _genderFormKey),
                    ),

                    const OnboardingCard(child: TestIntroStepWidget()),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: PrimaryButton(
                  // ***** CAMBIO: Ajustar la lógica del texto del botón *****
                  text:
                      _currentPage == 2
                          ? "Continuar"
                          : _currentPage == 3
                          ? "Comenzar prueba"
                          : "Continuar",
                  onPressed: _nextPage,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
