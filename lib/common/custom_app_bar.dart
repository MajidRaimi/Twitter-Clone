import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/constants/svgs_constants.dart';
import 'package:twitter_clone/theme/pallete.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        SvgConstants.twitterLogo,
        // ignore: deprecated_member_use
        color: Palette.blueColor,
        height: 28.h,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
