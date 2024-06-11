import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qontact/core/constants/folder_path_string.dart';
import 'package:qontact/core/constants/enums/locale_enums.dart';

class ProductLocalization extends EasyLocalization {
  ProductLocalization({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          path: PathString.translationsPath,
        );

  static final List<Locale> _supportedLocales = [
    Locales.tr.locale,
    Locales.en.locale,
  ];
}
