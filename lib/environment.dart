
enum Enviroment {dev, prod}

abstract class AppEnviroment {

  static late String title;
  static late Enviroment _enviroment;
  static Enviroment get enviroment => _enviroment;

  static setupEnv(Enviroment env) {
    _enviroment = env;
    switch(env) {
      case Enviroment.dev: {
        title = 'Flutter Flavors dev';
        break;
      }
      case Enviroment.prod: {
        title = 'Flutter Flavors prod';
        break;
      }
    }
  }
}