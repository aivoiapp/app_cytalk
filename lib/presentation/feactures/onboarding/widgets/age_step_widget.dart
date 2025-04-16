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
    return FormBuilder(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.cake_outlined, size: 48, color: AppColors.iconColor),
          const SizedBox(height: 16),
          Text(
            "¿Cuántos años tienes?",
            style: AppTextStyles.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Esto nos ayuda a personalizar tu experiencia",
            style: AppTextStyles.subtitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Text("Edad", style: AppTextStyles.label),
          const SizedBox(height: 8),
          FormBuilderTextField(
            name: 'age',
            style: AppTextStyles.input,
            decoration: InputDecoration(
              hintText: 'Ingresa tu edad',
              hintStyle: AppTextStyles.placeholder,
              filled: true,
              fillColor: AppColors.inputFill,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(
                  color: AppColors.enabledBorder,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(
                  color: AppColors.focusedBorder,
                  width: 1.5,
                ),
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
              ), //TODO: validar años
              FormBuilderValidators.max(
                100,
                errorText: 'Edad no válida',
              ), // Ejemplo max
            ]),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    );
  }
}
