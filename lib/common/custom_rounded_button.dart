import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/pallete.dart';

class RoundedCustomButton extends StatelessWidget {
  const RoundedCustomButton({
    super.key,
    required this.onTap,
    required this.label,
    this.backgroundColor = Palette.whiteColor,
    this.textColor = Palette.backgroundColor,
  });

  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
        ),
      ),
      backgroundColor: backgroundColor,
      labelPadding:  EdgeInsets.symmetric(
        vertical: 5.h,
        horizontal: 20.w,
      ),
    );
  }
}
