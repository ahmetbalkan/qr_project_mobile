import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:qontact/core/utils/locale/locale_extention.dart';

class LocaleText extends StatelessWidget {
  final String text;
  final TextStyle? style; // Stil parametresi

  const LocaleText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text.tr(),
      style: style,
    );
  }
}
