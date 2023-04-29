
import 'package:base_flutter/enviroment.dart';
import 'package:base_flutter/main.dart';

import 'injection.dart';

void main() {
  final Enviroment env = Enviroment(flavor: Flavor.DEV);
  baseUrl = env.baseUrl;
  mainCommon();
}