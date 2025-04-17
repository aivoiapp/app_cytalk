import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cytall/presentation/resources/resources.dart'; // Ajusta la ruta

class LevelStepWidget extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const LevelStepWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final List<String> levels = [
      'A1 - Principiante',
      'A2 - Elemental',
      'B1 - Intermedio',
      'B2 - Intermedio Alto',
      'C1 - Avanzado',
      'C2 - Maestría',
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Cambiar a transparente
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.transparent, // Make border transparent
          width: 0, // Remove border width
        ),
      ),
      child: FormBuilder(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text(
              "¿Cuál crees que es tu nivel?",
              style: AppTextStyles.headlineLarge.copyWith(color: Colors.white), // Adjusted color for better contrast
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Esto nos ayuda a calibrar la prueba inicial",
              style: AppTextStyles.subtitle.copyWith(color: Colors.white70), // Adjusted color for better contrast
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text("Nivel de Inglés", style: AppTextStyles.label.copyWith(color: Colors.white)), // Adjusted color for better contrast
            const SizedBox(height: 8),
            FormBuilderDropdown<String>(
              name: 'level',
              style: AppTextStyles.input.copyWith(color: Colors.white), // Adjusted color for better contrast
              initialValue: 'A1',
              dropdownColor: AppColors.primaryPurple.withOpacity(0.7),
              decoration: InputDecoration(
                hintText: 'Selecciona tu nivel',
                hintStyle: AppTextStyles.placeholder.copyWith(color: Colors.white54), // Adjusted color for better contrast
                filled: true,
                fillColor: AppColors.primaryPurple.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
              ),
              items: levels.map((level) => DropdownMenuItem(
                value: level.split(' ')[0],
                child: Text(
                  level,
                  style: AppTextStyles.input.copyWith(color: Colors.white), // Adjusted color for better contrast
                ),
              )).toList(),
              validator: FormBuilderValidators.required(
                errorText: 'Por favor selecciona tu nivel',
              ),
              onChanged: (_) {
                formKey.currentState?.save();
              },
            ),
          ],
        ),
      ),
    );
  }
}
