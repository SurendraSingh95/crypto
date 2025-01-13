// Dart imports:
import 'dart:math';

import 'package:crepto/constants/constants.dart';

// Project imports:

///scaling of text size according to the screen width
class ScaleSize {
  static double textScaleFactor(
      {double maxTextScaleFactor = 2, double maxFixFactor = 0.9}) {
    double val =
        (max(Constants.screen.height, Constants.screen.height) / 1400) *
            maxTextScaleFactor;
    return max(maxFixFactor, min(val, maxTextScaleFactor));
  }
}
