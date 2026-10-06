import 'package:flutter/material.dart';
import '../core/constants/app_enums.dart';
import '../core/design/app_colors.dart';
import '../core/design/app_typography.dart';
import '../core/utils/extensions.dart';

class AppHeading extends StatelessWidget {
  final String text;
  final HeadingLevel level;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppHeading({
    super.key,
    required this.text,
    this.level = HeadingLevel.h2,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final defaultColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;

    TextStyle style;
    switch (level) {
      case HeadingLevel.h1:
        style = AppTypography.h1;
        break;
      case HeadingLevel.h2:
        style = AppTypography.h2;
        break;
      case HeadingLevel.h3:
        style = AppTypography.h3;
        break;
      case HeadingLevel.h4:
        style = AppTypography.h4;
        break;
      case HeadingLevel.h5:
        style = AppTypography.h5;
        break;
      case HeadingLevel.h6:
        style = AppTypography.h6;
        break;
    }

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style.copyWith(color: color ?? defaultColor),
    );
  }
}
