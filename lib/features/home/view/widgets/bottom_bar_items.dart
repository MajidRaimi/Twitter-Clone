import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/constants/svgs_constants.dart';
import 'package:twitter_clone/theme/palette.dart';

List<BottomNavigationBarItem> bottomBarItems(int page) => [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          page == 0
              ? SvgConstants.homeFilledIcon
              : SvgConstants.homeOutlinedIcon,
          // ignore: deprecated_member_use
          color: Palette.whiteColor,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          SvgConstants.searchIcon,

          // ignore: deprecated_member_use
          color: Palette.whiteColor,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          page == 2
              ? SvgConstants.notifFilledIcon
              : SvgConstants.notifOutlinedIcon,
          // ignore: deprecated_member_use
          color: Palette.whiteColor,
        ),
      ),
    ];
