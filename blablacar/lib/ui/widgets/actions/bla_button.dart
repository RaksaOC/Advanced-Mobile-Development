import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class BlaButton extends StatelessWidget {
  final bool isPrimary;
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool? isIconOnRightSide;

  const BlaButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.icon,
    this.isIconOnRightSide = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? BlaColors.primary : BlaColors.greyLight,
        foregroundColor: isPrimary ? BlaColors.white : BlaColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: isPrimary
              ? BorderSide.none
              : BorderSide(color: BlaColors.neutralLight, width: 1),
        ),
      ),
      child: icon != null && isIconOnRightSide != null
          ? isIconOnRightSide == true
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(text),
                      const SizedBox(width: 8),
                      Icon(icon, size: 20),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, size: 20),
                      const SizedBox(width: 8),
                      Text(text),
                    ],
                  )
          : Text(text),
    );
  }
}
