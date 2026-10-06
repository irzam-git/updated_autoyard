import 'package:flutter/widgets.dart';
import 'app_colors.dart';

abstract class AppShadows {
  static const List<BoxShadow> sm = [
    BoxShadow(
      color: Color(0x080F172A),
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> md = [
    BoxShadow(
      color: Color(0x0C0F172A),
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: -2,
    ),
  ];

  static const List<BoxShadow> lg = [
    BoxShadow(
      color: Color(0x140F172A),
      offset: Offset(0, 10),
      blurRadius: 24,
      spreadRadius: -4,
    ),
  ];

  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0A0F172A),
      offset: Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> primaryGlow = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.35),
      offset: const Offset(0, 6),
      blurRadius: 20,
      spreadRadius: -2,
    ),
  ];

  static List<BoxShadow> successGlow = [
    BoxShadow(
      color: AppColors.success.withValues(alpha: 0.3),
      offset: const Offset(0, 4),
      blurRadius: 16,
      spreadRadius: -2,
    ),
  ];

  static List<BoxShadow> darkCard = [
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.35),
      offset: const Offset(0, 6),
      blurRadius: 18,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> modal = [
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.15),
      offset: const Offset(0, -4),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];
}
