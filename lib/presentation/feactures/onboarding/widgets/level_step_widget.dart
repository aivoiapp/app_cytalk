import 'package:cytalk/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cytalk/presentation/resources/resources.dart'; // Ajusta la ruta

class LevelStepWidget extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const LevelStepWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final List<String> levels = [
      AppLocalizations.of(context)!.levelA1,
      AppLocalizations.of(context)!.levelA2,
      AppLocalizations.of(context)!.levelB1,
      AppLocalizations.of(context)!.levelB2,
      AppLocalizations.of(context)!.levelC1,
      AppLocalizations.of(context)!.levelC2,
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
              AppLocalizations.of(context)!.levelPrompt, // Use localized text
              style: AppTextStyles.headlineLarge.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.testIntroInfo, // Use localized text
              style: AppTextStyles.subtitle.copyWith(color: Colors.white70),
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
                hintText: AppLocalizations.of(context)!.selectYourLevel, // Use localized text
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
                errorText: AppLocalizations.of(context)!.pleaseSelectYourLevel, // Use localized text
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
