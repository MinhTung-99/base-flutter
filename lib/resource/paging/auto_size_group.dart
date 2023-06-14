
import 'dart:async';

import 'auto_size_text.dart';

class AutoSizeGroup {
  final _listeners = <AutoSizeTextState, double>{};
  var _widgetsNotified = false;
  var fontSize = double.infinity;

  void register(AutoSizeTextState text) {
    _listeners[text] = double.infinity;
  }

  void updateFontSize(AutoSizeTextState text, double maxFontSize) {
    final oldFontSize = fontSize;
    if (maxFontSize <= fontSize) {
      fontSize = maxFontSize;
      _listeners[text] = maxFontSize;
    } else if (_listeners[text] == fontSize) {
      _listeners[text] = maxFontSize;
      fontSize = double.infinity;
      for (final size in _listeners.values) {
        if (size < fontSize) fontSize = size;
      }
    } else {
      _listeners[text] = maxFontSize;
    }

    if (oldFontSize != fontSize) {
      _widgetsNotified = false;
      scheduleMicrotask(notifyListeners);
    }
  }

  void notifyListeners() {
    if (_widgetsNotified) {
      return;
    } else {
      _widgetsNotified = true;
    }

    for (final textState in _listeners.keys) {
      if (textState.mounted) {
        textState.notifySync();
      }
    }
  }

  void remove(AutoSizeTextState text) {
    updateFontSize(text, double.infinity);
    _listeners.remove(text);
  }
}
