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
    this.isLoading = false,
  });

  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Chip(
        label: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
        backgroundColor: backgroundColor,
        labelPadding: EdgeInsets.symmetric(
          vertical: 5.h,
          horizontal: 20.w,
        ),
      ),
    );
  }
}
