import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
    this.onPressed,
  });

  Color _getButtonColor() {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey[300] as Color;
    }
  }

  Color _getTextColor() {
    switch (buttonType) {
      case ButtonType.primary:
      case ButtonType.secondary:
        return Colors.white;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonType == ButtonType.disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _getButtonColor(),
        foregroundColor: _getTextColor(),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: iconPosition == IconPosition.left
            ? [
                Icon(icon),
                const SizedBox(width: 10),
                Text(label),
              ]
            : [
                Text(label),
                const SizedBox(width: 10),
                Icon(icon),
              ],
      ),
    );
  }
}
