# build android and ios
- flutter run -t lib/main_dev.dart --flavor dev

# add injectable
- flutter packages pub run build_runner build
- flutter packages pub run build_runner build --delete-conflicting-outputs (run when Conflicting)

# realm
- flutter pub run realm generate

# flavor
- # IOS
      - PROJECT -> Runner -> Info -> Configurations
      - TARGETS -> Runner -> User-Defined -> FLUTTER_TARGET
      - TARGETS -> Runner -> Buiild Setting -> Customized -> Combined -> Packaging

# change icon app
- # IOS
      - Runner -> Runner -> Assets

# change name app
- # IOS
      - TARGETS -> Runner -> Build Settings -> (All, Combined) -> Click + -> add  APP_NAME at User-Defined
      - Runner -> Runner -> Info -> Bundle display name

# release name file
- # IOS
      - TARGETS -> Runner -> Info -> Bundle name