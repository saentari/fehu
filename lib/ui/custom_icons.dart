import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

// The Svg logo is used in every [AppBar], wrapped by [Hero] to keep it in
// place when navigating between screens.
final titleIcon = Hero(
  tag: 'logoHero',
  child: SvgPicture.asset(
    'assets/icons/logo.svg',
    color: const Color(0xFFFBD42C),
    height: 40.0,
  ),
);
