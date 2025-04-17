import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cytall/presentation/resources/resources.dart';

class NameStepWidget extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const NameStepWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: FormBuilder(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 25),
            Text(
              "¿Cómo te llamas?",
              style: AppTextStyles.headlineLarge.copyWith(color: Colors.white), // Adjusted color for better contrast
            ),
            const SizedBox(height: 8),
            Text(
              "Nos encantaría conocerte",
              style: AppTextStyles.subtitle.copyWith(color: Colors.white70), // Adjusted color for better contrast
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            
            
            FormBuilderTextField(
              name: 'name',
              style: AppTextStyles.input.copyWith(color: Colors.white), // Adjusted color for better contrast
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: 'Ingresa tu nombre',
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
                  errorText: 'Por favor ingresa tu nombre',
                ),
                FormBuilderValidators.minLength(
                  2,
                  errorText: 'El nombre debe tener al menos 2 letras',
                ),
                FormBuilderValidators.maxLength(
                  30,
                  errorText: 'El nombre no debe exceder 30 caracteres',
                ),
              ]),
              textCapitalization: TextCapitalization.words,
            ),
          ],
        ),
      ),
    );
  }
}
