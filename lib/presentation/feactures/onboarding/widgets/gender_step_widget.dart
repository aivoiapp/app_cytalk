import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cytall/presentation/resources/resources.dart';

class GenderStepWidget extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const GenderStepWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.people_outline,
            size: 48,
            color: AppColors.iconColor,
          ),
          const SizedBox(height: 16),
          Text(
            "¿Con qué género te identificas?",
            style: AppTextStyles.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Ayúdanos a personalizar tu experiencia",
            style: AppTextStyles.subtitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          FormBuilderRadioGroup<String>(
            name: 'gender',
            orientation: OptionsOrientation.vertical,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            options: const [
              FormBuilderFieldOption(
                value: 'Masculino',
                child: Text('Masculino'),
              ),
              FormBuilderFieldOption(
                value: 'Femenino',
                child: Text('Femenino'),
              ),
              FormBuilderFieldOption(value: 'Otro', child: Text('Otro')),
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
    );
  }
}
