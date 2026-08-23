import 'package:flutter/material.dart';

class ToastService {
  static void showError(BuildContext context, String message) {
    _showToast(
      context,
      message,
      backgroundColor: Theme.of(context).colorScheme.surface,
      textColor: Theme.of(context).colorScheme.onSurface,
      iconColor: Colors.redAccent,
      icon: Icons.error_outline,
    );
  }

  static void showSuccess(BuildContext context, String message) {
    _showToast(
      context,
      message,
      backgroundColor: Theme.of(context).colorScheme.primary,
      icon: Icons.check_circle_outline,
    );
  }

  static void showInfo(BuildContext context, String message) {
    _showToast(
      context,
      message,
      backgroundColor: Colors.black87,
      icon: Icons.info_outline,
    );
  }

  static void _showToast(
    BuildContext context,
    String message, {
    required Color backgroundColor,
    required IconData icon,
    Color textColor = Colors.white,
    Color? iconColor,
  }) {
    final overlay = ScaffoldMessenger.of(context);
    overlay.clearSnackBars();
    overlay.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor ?? textColor, size: 22),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
        ),
        margin: const EdgeInsets.only(bottom: 32, left: 32, right: 32),
        duration: const Duration(seconds: 3),
        elevation: 8,
      ),
    );
  }
}
