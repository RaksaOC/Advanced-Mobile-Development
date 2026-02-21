import 'package:flutter/material.dart';

enum ColorType { red, green, yellow, blue }

class ColorService extends ChangeNotifier {
  final Map<ColorType, int> _counts = {
    for (final type in ColorType.values) type: 0,
  };

  int getCount(ColorType type) => _counts[type] ?? 0;

  void increment(ColorType type) {
    _counts[type] = getCount(type) + 1;
    notifyListeners();
  }

  Map<ColorType, int> get counts => _counts;
}
