import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'app_colors.dart';
import 'app_radius.dart';
import 'app_typography.dart';

part 'app_theme.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() => ThemeMode.system;

  void setLight() => state = ThemeMode.light;
  void setDark() => state = ThemeMode.dark;
  void setSystem() => state = ThemeMode.system;
  void toggle() => state = (state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
}

ThemeData get lightTheme => ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  canvasColor: AppColors.surfaceLight,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    surface: AppColors.surfaceLight,
    onSurface: AppColors.textPrimaryLight,
    error: AppColors.error,
    onError: AppColors.white,
  ),
  cardTheme: CardThemeData(
    color: AppColors.surfaceLight,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: AppRadius.card,
      side: const BorderSide(color: AppColors.borderLight, width: 1),
    ),
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: AppColors.surfaceLight,
    elevation: 12,
    shape: RoundedRectangleBorder(borderRadius: AppRadius.dialog),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.surfaceLight,
    side: const BorderSide(color: AppColors.borderLight),
    shape: const RoundedRectangleBorder(borderRadius: AppRadius.chip),
    labelStyle: AppTypography.caption.copyWith(fontWeight: FontWeight.w600),
  ),
  dividerTheme: const DividerThemeData(
    color: AppColors.borderSubtleLight,
    thickness: 1,
    space: 1,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.surfaceLight,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    titleTextStyle: AppTypography.h4,
    iconTheme: IconThemeData(color: AppColors.textPrimaryLight),
  ),
);

ThemeData get darkTheme => ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  canvasColor: AppColors.surfaceDark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    surface: AppColors.surfaceDark,
    onSurface: AppColors.textPrimaryDark,
    error: AppColors.error,
    onError: AppColors.white,
  ),
  cardTheme: CardThemeData(
    color: AppColors.cardDark,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: AppRadius.card,
      side: const BorderSide(color: AppColors.borderDark, width: 1),
    ),
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: AppColors.surfaceDark,
    elevation: 16,
    shape: RoundedRectangleBorder(borderRadius: AppRadius.dialog),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.surfaceDark,
    side: const BorderSide(color: AppColors.borderDark),
    shape: const RoundedRectangleBorder(borderRadius: AppRadius.chip),
    labelStyle: AppTypography.caption.copyWith(fontWeight: FontWeight.w600),
  ),
  dividerTheme: const DividerThemeData(
    color: AppColors.borderSubtleDark,
    thickness: 1,
    space: 1,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.surfaceDark,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    titleTextStyle: AppTypography.h4,
    iconTheme: IconThemeData(color: AppColors.textPrimaryDark),
  ),
);
