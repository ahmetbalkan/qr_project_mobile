import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qontact/core/constants/enums/locale_enums.dart';
import 'package:qontact/core/constants/folder_path_string.dart';
import 'package:qontact/core/utils/locale/product_localization.dart';
import 'package:qontact/locator.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/qr_project.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primary,
  ));
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
      path: PathString.translationsPath,
      fallbackLocale: Locales.en.locale, // Fallback locale belirleyin
      useOnlyLangCode: true,
      child: const ProviderScope(child: QrProject()),
    ),
  );
}
