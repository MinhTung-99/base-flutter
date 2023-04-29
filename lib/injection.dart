import 'package:base_flutter/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data/local/shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
String baseUrl = '';
String token = '';

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureInjection() => getIt.init();
