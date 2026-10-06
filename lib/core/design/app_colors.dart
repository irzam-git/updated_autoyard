import 'package:flutter/material.dart';

abstract class AppColors {
  // Brand & Electric Accents
  static const Color primary = Color(0xFF2563EB); // Vibrant Royal Blue
  static const Color primaryLight = Color(0xFF60A5FA);
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color primaryHover = Color(0xFF1E40AF);
  static const Color secondary = Color(0xFF06B6D4); // Cyber Teal
  static const Color accent = Color(0xFF8B5CF6); // Electric Purple
  static const Color accentWarm = Color(0xFFF97316); // Amber Sunset

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2563EB), Color(0xFF06B6D4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFF3B82F6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient emeraldGradient = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF059669)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [Color(0xFF1E2330), Color(0xFF151922)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient lightCardGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF9FAFC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Backgrounds - Sleek Modern Slate & Deep Onyx
  static const Color backgroundLight = Color(0xFFF6F8FC);
  static const Color backgroundDark = Color(0xFF0B0E14);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF141824);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1A2030);

  // Borders & Dividers
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderDark = Color(0xFF273142);
  static const Color borderSubtleLight = Color(0xFFEDF2F7);
  static const Color borderSubtleDark = Color(0xFF1E2638);

  // Semantic
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFFDBEAFE);

  // Text
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF475569);
  static const Color textTertiaryLight = Color(0xFF94A3B8);

  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  static const Color textTertiaryDark = Color(0xFF64748B);

  // Neutral & Disabled
  static const Color disabledLight = Color(0xFFCBD5E1);
  static const Color disabledDark = Color(0xFF334155);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}
