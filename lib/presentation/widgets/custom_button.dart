import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text, 
                style: const TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
    );

    if (isFullWidth) {
      button = SizedBox(
        width: double.infinity,
        height: 56,
        child: button,
      );
    } else {
      button = SizedBox(
        height: 56,
        child: button,
      );
    }
    return button;
  }
}
