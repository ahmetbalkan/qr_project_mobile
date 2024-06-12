import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:qontact/presentation/theme/text_styles.dart'; // AppTextStyles burada tanımlı olmalı

class LocaleText extends StatelessWidget {
  final String text;
  final TextStyle? style; // Stil parametresi

  const LocaleText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text.tr(),
      style: style ??
          AppTextStyles.bodyLarge.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}
