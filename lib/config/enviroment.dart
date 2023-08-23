
enum Flavor { DEV, STG, PROD }

class Enviroment {
  final Flavor flavor;

  Enviroment({required this.flavor});

  String get baseUrl {
    switch (flavor) {
      case Flavor.PROD:
        return 'https://poke-eme.gcom-lab.com/';
      case Flavor.STG:
        return 'https://poke-eme-staging.gcom-lab.com/';
      case Flavor.DEV:
        return 'https://api.publicapis.org';
    }
  }
}
