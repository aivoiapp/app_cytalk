import 'package:cytalk/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class VersionInfo extends StatelessWidget {
  final String version;

  const VersionInfo({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Text(
      version,
      style: AppTextStyles.caption.copyWith(
        color: AppColors.secondaryText.withOpacity(0.7),
      ),
    );
  }
}
