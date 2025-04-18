import 'package:cytalk/l10n/app_localizations.dart';
import 'package:cytalk/presentation/feactures/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cytalk/presentation/resources/resources.dart';

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
        
        // Cargar datos guardados cuando se regresa a un paso anterior
        _loadSavedFormData(_currentPage);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Mapa para almacenar los datos del formulario entre navegaciones
  final Map<String, dynamic> _formData = {};

  // Método para cargar datos guardados en el formulario actual
  void _loadSavedFormData(int pageIndex) {
    final formKey = _formKeys[pageIndex];
    if (formKey != null && formKey.currentState != null) {
      // Obtener los campos que corresponden a este formulario
      switch (pageIndex) {
        case 0: // Nombre
          if (_formData.containsKey('name')) {
            formKey.currentState!.patchValue({'name': _formData['name']});
          }
          break;
        case 1: // Edad
          if (_formData.containsKey('age')) {
            formKey.currentState!.patchValue({'age': _formData['age']});
          }
          break;
        case 2: // Género
          if (_formData.containsKey('gender')) {
            formKey.currentState!.patchValue({'gender': _formData['gender']});
          }
          break;
        case 3: // Nivel
          if (_formData.containsKey('level')) {
            formKey.currentState!.patchValue({'level': _formData['level']});
          }
          break;
      }
    }
  }

  void _nextPage() {
    // Ocultar el teclado cuando se presiona el botón
    FocusScope.of(context).unfocus();
    
    final currentFormKey = _formKeys[_currentPage];
    bool isValid = true;

    if (currentFormKey != null) {
      isValid = currentFormKey.currentState?.saveAndValidate() ?? false;
      
      // Guardar los datos del formulario actual en el mapa
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
        // Último paso: Acción final (Ej: Navegar a la prueba)
        print("Onboarding completado!");
        // Recolectar todos los datos
        final name = _formData['name'];
        final age = _formData['age'];
        final gender = _formData['gender'];
        final level = _formData['level'];
        print('Datos: Nombre=$name, Edad=$age, Género=$gender, Nivel=$level');
        // TODO: Guardar en SQLite y navegar a la pantalla de prueba
        // Navigator.pushReplacementNamed(context, '/placement_test'); // O usando GoRouter
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
                      filterQuality: FilterQuality.medium,
                      gaplessPlayback: true,
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
                  physics: const ClampingScrollPhysics(),
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
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: PrimaryButton(
                  // Ajustar la lógica del texto del botón según el paso actual
                  text: _currentPage == 3
                      ? AppLocalizations.of(context)!.startTest // Use localized text
                      : AppLocalizations.of(context)!.continueText, // Use localized text
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
