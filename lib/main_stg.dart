import 'enviroment.dart';
import 'injection.dart';
import 'main.dart';

void main() {
  final Enviroment env = Enviroment(flavor: Flavor.STG);
  baseUrl = env.baseUrl;
  mainCommon();
}
