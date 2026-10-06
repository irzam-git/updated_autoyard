import 'package:flutter/animation.dart';

abstract class AppAnimations {
  static const Duration fastest = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 180);
  static const Duration normal = Duration(milliseconds: 280);
  static const Duration slow = Duration(milliseconds: 450);
  static const Duration entrance = Duration(milliseconds: 600);

  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve emphasizeCurve = Curves.easeOutCubic;
  static const Curve decelerateCurve = Curves.decelerate;
  static const Curve springCurve = Curves.easeOutBack;
  static const Curve smooth = Curves.easeInOutCubic;
}
