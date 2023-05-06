# base_flutter

base

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# build android and ios
- flutter run -t lib/main_dev.dart --flavor dev

# add injectable
- flutter packages pub run build_runner build
- flutter packages pub run build_runner build --delete-conflicting-outputs (run when Conflicting)

# realm
- flutter pub run realm generate
