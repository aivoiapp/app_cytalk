import 'package:cytalk/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cytalk/presentation/resources/resources.dart';

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
              AppLocalizations.of(context).genderPrompt,
              style: AppTextStyles.headlineLarge.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context).genderDescription,
              style: AppTextStyles.subtitle.copyWith(color: Colors.white70),
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
                  value: AppLocalizations.of(context).genderMale, // Use localized text
                  child: Text(AppLocalizations.of(context).genderMale, style: AppTextStyles.itensGender.copyWith(color: Colors.white)),
                ),
                FormBuilderFieldOption(
                  value: AppLocalizations.of(context).genderFemale, // Use localized text
                  child: Text(AppLocalizations.of(context).genderFemale, style: AppTextStyles.itensGender.copyWith(color: Colors.white)),
                ),
                FormBuilderFieldOption(
                  value: AppLocalizations.of(context).genderOther, // Use localized text
                  child: Text(AppLocalizations.of(context).genderOther, style: AppTextStyles.itensGender.copyWith(color: Colors.white)),
                ),
              ],
              validator: FormBuilderValidators.required(
                errorText: AppLocalizations.of(context).pleaseSelectAnOption, // Use localized text
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
