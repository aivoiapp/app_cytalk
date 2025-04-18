import 'package:cytalk/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cytalk/presentation/resources/resources.dart';

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
              AppLocalizations.of(context)!.namePrompt,
              style: AppTextStyles.headlineLarge.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.welcomeTitle,
              style: AppTextStyles.subtitle.copyWith(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            
            
            FormBuilderTextField(
              name: 'name',
              style: AppTextStyles.input.copyWith(color: Colors.white),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enterYourName, // Use localized text
                hintStyle: AppTextStyles.placeholder.copyWith(color: Colors.white54),
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
                  errorText: AppLocalizations.of(context)!.pleaseEnterYourName, // Use localized text
                ),
                FormBuilderValidators.minLength(
                  2,
                  errorText: AppLocalizations.of(context)!.nameMustHaveAtLeastTwoLetters, // Use localized text
                ),
                FormBuilderValidators.maxLength(
                  30,
                  errorText: AppLocalizations.of(context)!.nameMustNotExceedThirtyCharacters, // Use localized text
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
