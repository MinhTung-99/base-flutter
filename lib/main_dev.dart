
import 'package:flutter/cupertino.dart';

import 'environment.dart';
import 'main.dart';

void main() {
  AppEnviroment.setupEnv(Enviroment.dev);
  runApp(const MyApp());
}