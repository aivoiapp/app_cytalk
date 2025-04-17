import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cytall/presentation/resources/resources.dart';

class GenderStepWidget extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const GenderStepWidget({super.key, required this.formKey});

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
            const SizedBox(height: 16),
            Text(
              "¿Con qué género te identificas?",
              style: AppTextStyles.headlineLarge.copyWith(color: Colors.white), // Adjusted color for better contrast
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Ayúdanos a personalizar tu experiencia",
              style: AppTextStyles.subtitle.copyWith(color: Colors.white70), // Adjusted color for better contrast
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            FormBuilderRadioGroup<String>(
              name: 'gender',
              orientation: OptionsOrientation.vertical,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: AppColors.primaryPurple.withOpacity(0.3),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.5),
                ),
              ),
              options: [
                FormBuilderFieldOption(
                  value: 'Masculino',
                  child: Text('Masculino', style: AppTextStyles.itensGender.copyWith(color: Colors.white)), // Adjusted color for better contrast
                ),
                FormBuilderFieldOption(
                  value: 'Femenino',
                  child: Text('Femenino', style: AppTextStyles.itensGender.copyWith(color: Colors.white)), // Adjusted color for better contrast
                ),
                FormBuilderFieldOption(
                  value: 'Otro',
                  child: Text('Otro', style: AppTextStyles.itensGender.copyWith(color: Colors.white)), // Adjusted color for better contrast
                ),
              ],
              validator: FormBuilderValidators.required(
                errorText: 'Por favor selecciona una opción',
              ),
              wrapAlignment: WrapAlignment.start,
              activeColor: AppColors.radioActive,
              controlAffinity: ControlAffinity.leading,
              separator: const SizedBox(height: 16),
            ),
          ],
        ),
      ),
    );
  }
}
