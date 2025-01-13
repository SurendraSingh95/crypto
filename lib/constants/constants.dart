// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:crepto/color/colors.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:

/// get screen size
class Constants {
  static Size screen = Size(Get.width, Get.height);
  // static  Size screen = const Size(360.0, 730.0);
  static double largeSize = max(screen.height, screen.width);
  static RegExp mobileRegex = RegExp(r'^(\+91[\-\s]?|91[\-\s]?|0?)?[6-9]\d{9}$');


  static double getResponsiveFontSize(double size) {
    double smallerSize = min(screen.height, screen.width);
    return size * smallerSize / 100;
  }

  static BoxDecoration get getDefaultBoxDecoration => BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: CryptoColor.white,
      border: Border.all(color: CryptoColor.button, width: 2));
}
