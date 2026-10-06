import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  EdgeInsets get viewPadding => MediaQuery.paddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  void hideKeyboard() => FocusScope.of(this).unfocus();
}

extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  bool get isValidEmail {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  bool get isStrongPassword {
    // Min 8 chars, 1 letter, 1 number
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$');
    return passwordRegex.hasMatch(this);
  }
}

extension DateTimeExtensions on DateTime {
  String toFormattedDate([String pattern = 'MMM dd, yyyy']) {
    return DateFormat(pattern).format(this);
  }

  String toFormattedTime([String pattern = 'hh:mm a']) {
    return DateFormat(pattern).format(this);
  }

  String toFormattedDateTime([String pattern = 'MMM dd, yyyy hh:mm a']) {
    return DateFormat(pattern).format(this);
  }
}
