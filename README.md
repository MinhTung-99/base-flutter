# build android and ios
    - flutter run -t lib/main_dev.dart --flavor dev

# add injectable
    - dart pub upgrade (run if can)
    - dart run build_runner build
    - dart run build_runner build --delete-conflicting-outputs (run when Conflicting)

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

# build release
- # IOS
- # ANDROID
      - flutter build apk --no-sound-null-safety --release --no-tree-shake-icons --no-shrink -t lib/main_dev.dart --flavor dev -> apk
      - flutter build appbundle --no-sound-null-safety --release --no-tree-shake-icons -t lib/main_prod.dart --flavor prod -> aab
      - PROD: flutter build appbundle --no-sound-null-safety --release --no-tree-shake-icons -t lib/main_prod.dart --flavor prod -> aab

# GIT IGNORE
      - git rm --cache -r lib/l10n/app_localizations**
      - git rm --cache -r .flutter-plugins
      - git rm --cache -r .idea/   
      - git rm --cache -f  .flutter-plugins-dependencies
      - git rm --cache -r .dart_tool/  

# Flutter Terminal
      - open .zshrc
      - export PATH="$PATH:/Users/tung/Documents/flutter_3.16.9/bin"