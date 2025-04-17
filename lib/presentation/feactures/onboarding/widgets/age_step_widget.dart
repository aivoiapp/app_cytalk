import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cytall/presentation/resources/resources.dart';

class AgeStepWidget extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const AgeStepWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 25),
            Text(
              "¿Cuántos años tienes?",
              style: AppTextStyles.headlineLarge.copyWith(color: Colors.white), // Adjusted color for better contrast
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Esto nos ayuda a personalizar tu experiencia",
              style: AppTextStyles.subtitle.copyWith(color: Colors.white70), // Adjusted color for better contrast
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            
            FormBuilderTextField(
              name: 'age',
              style: AppTextStyles.input.copyWith(color: Colors.white), // Adjusted color for better contrast
              decoration: InputDecoration(
                hintText: 'Ingresa tu edad',
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
                  borderSide: const BorderSide(color: Colors.red, width: 1),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  errorText: 'Por favor ingresa tu edad',
                ),
                FormBuilderValidators.numeric(
                  errorText: 'Ingresa un número válido',
                ),
                FormBuilderValidators.min(
                  5,
                  errorText: 'Debes tener al menos 5 años',
                ),
                FormBuilderValidators.max(
                  100,
                  errorText: 'Edad no válida',
                ),
              ]),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
        ),
      ),
    );
  }
}
