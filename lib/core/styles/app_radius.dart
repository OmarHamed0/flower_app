import 'package:flutter/cupertino.dart';

/// Radius class contains all radius used in app
class AppRadius {
  AppRadius._();

  /// Radius of 0
  static const none = Radius.zero;

  /// Extra extra small of value 2
  static const xxs = Radius.circular(2);

  /// Extra small of value 4
  static const xs = Radius.circular(4);

  /// small of value 8
  static const s = Radius.circular(8);

  ///  Extra extra large with value 100
  static const xxl = Radius.circular(100);
}

class AppBorderRadius {
  AppBorderRadius._();

  /// Radius of 0
  static const none = BorderRadius.zero;

  /// Extra extra small of value 2
  static var xxs = BorderRadius.circular(2);

  /// Extra small of value 4
  static var xs = BorderRadius.circular(4);

  /// small of value 8
  static var s = BorderRadius.circular(8);

  ///  Extra extra large with value 100
  static var xxl = BorderRadius.circular(100);
}
