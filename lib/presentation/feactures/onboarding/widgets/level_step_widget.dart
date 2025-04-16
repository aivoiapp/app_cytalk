import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cytall/presentation/resources/resources.dart'; // Ajusta la ruta

class LevelStepWidget extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const LevelStepWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    // Lista de niveles CEFR (Marco Común Europeo de Referencia)
    final List<String> levels = [
      'A1 - Principiante',
      'A2 - Elemental',
      'B1 - Intermedio',
      'B2 - Intermedio Alto',
      'C1 - Avanzado',
      'C2 - Maestría',
    ];

    return FormBuilder(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
            "¿Cuál crees que es tu nivel?",
            style: AppTextStyles.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Esto nos ayuda a calibrar la prueba inicial",
            style: AppTextStyles.subtitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Text("Nivel de Inglés", style: AppTextStyles.label),
          const SizedBox(height: 8),
          FormBuilderDropdown<String>(
            name: 'level',
            style: AppTextStyles.input,
            decoration: InputDecoration(
              hintText: 'Selecciona tu nivel',
              hintStyle: AppTextStyles.placeholder,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ), // Borde rojo
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ), // Borde rojo más grueso
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
            ),
            items:
                levels
                    .map(
                      (level) => DropdownMenuItem(
                        value: level.split(' ')[0],
                        child: Text(
                          level,
                          style: AppTextStyles.input.copyWith(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    )
                    .toList(),
            validator: FormBuilderValidators.required(
              errorText: 'Por favor selecciona tu nivel',
            ),
          ),
        ],
      ),
    );
  }
}
