import 'package:flutter/material.dart';
import 'package:open_chat_ui/constants/app_constants.dart';
import 'package:proper_filesize/proper_filesize.dart';

class Utils {
  static String? bytesToSize(num? bytes) {
    return ProperFilesize.generateHumanReadableFilesize(
      bytes ?? 0,
      base: Bases.Metric,
    );
  }

  static void showMessage(String message) {
    AppConstants.navKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
