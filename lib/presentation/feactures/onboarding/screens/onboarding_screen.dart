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
  final int _totalSteps = 4; // Name, Age, Gender, Test Intro

  // Claves separadas para cada formulario
  final _nameFormKey = GlobalKey<FormBuilderState>();
  final _ageFormKey = GlobalKey<FormBuilderState>();
  final _genderFormKey = GlobalKey<FormBuilderState>();

  // Mapa para asociar claves con páginas
  late final Map<int, GlobalKey<FormBuilderState>> _formKeys;

  @override
  void initState() {
    super.initState();
    _formKeys = {
      0: _nameFormKey,
      1: _ageFormKey,
      2: _genderFormKey,
      // La página 3 (Test Intro) no necesita clave de formulario
    };
    _pageController.addListener(() {
      // Optimización: Solo actualizar si la página realmente cambió (evita múltiples builds)
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
    // Validar el formulario de la página actual si tiene clave
    final currentFormKey = _formKeys[_currentPage];
    bool isValid = true; // Asumir válido si no hay formulario

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
        // Aquí recolectarías los datos de los formKeys:
        final name = _nameFormKey.currentState?.value['name'];
        final age = _ageFormKey.currentState?.value['age'];
        final gender = _genderFormKey.currentState?.value['gender'];
        print('Datos: Nombre=$name, Edad=$age, Género=$gender');
        // TODO: Guardar en SQLite y navegar a la pantalla de prueba
        // Navigator.pushReplacementNamed(context, '/placement_test'); // O usando GoRouter
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Evita que el teclado empuje todo hacia arriba
      resizeToAvoidBottomInset: false,
      body: Container(
        // Fondo gradiente
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
              // App Bar simple con logo (Ajusta el path a tu logo)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Si tienes SVG:
                    // SvgPicture.asset('assets/logo/cytalk_logo.svg', height: 30),
                    // Si es texto:
                    Text(
                      'CyTalk',
                      style: AppTextStyles.headlineMedium.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20), // Espacio antes de la tarjeta
              // Indicador de progreso encima de la tarjeta
              StepProgressIndicator(
                totalSteps: _totalSteps,
                currentStep: _currentPage,
              ),

              // PageView para los pasos dentro de la tarjeta
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    OnboardingCard(
                      child: NameStepWidget(formKey: _nameFormKey),
                    ),
                    OnboardingCard(child: AgeStepWidget(formKey: _ageFormKey)),
                    OnboardingCard(
                      child: GenderStepWidget(formKey: _genderFormKey),
                    ),
                    const OnboardingCard(
                      child: TestIntroStepWidget(),
                    ), // Sin form key
                  ],
                ),
              ),

              const SizedBox(height: 24), // Espacio antes del botón
              // Botón de acción
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: PrimaryButton(
                  text:
                      _currentPage == 2
                          ? "Comenzar prueba de nivel" // Penúltimo paso
                          : _currentPage == 3
                          ? "Comenzar prueba" // Último paso
                          : "Continuar", // Otros pasos
                  onPressed: _nextPage,
                ),
              ),
              const SizedBox(height: 16), // Espacio inferior
            ],
          ),
        ),
      ),
    );
  }
}
