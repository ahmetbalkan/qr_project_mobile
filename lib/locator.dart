import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qontact/presentation/navigation/app_router.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerSingleton<RootRouter>(RootRouter());
}
