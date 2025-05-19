import 'package:flutter/cupertino.dart';

class AppIcons {
  AppIcons._();

  static const iconCalendar = Image(
    image: AssetImage('assets/icons/icon_calc.png'),
    width: 15,
  );
  static const iconChecked = Image(
    image: AssetImage('assets/icons/icon_checked.png'),
    width: 26,
  );
  static const iconUnChecked = Image(
    image: AssetImage('assets/icons/icon_un_checked.png'),
    width: 26,
  );
  static const iconPen = Image(image: AssetImage('assets/icons/icon_pen.png'));
  static const iconBack = AssetImage('assets/icons/icon_back.png');
  static const iconSearch = Image(
    image: AssetImage('assets/icons/icon_search.png'),
    width: 19,
    height: 19,
  );
  static const iconClock = AssetImage('assets/icons/icon_clock.png');
  static const iconActive = AssetImage('assets/icons/icon_active.png');
  static const iconUnActive = AssetImage('assets/icons/icon_un_active.png');
  static const iconPrev = AssetImage('assets/icons/icon_previous.png');
  static const iconNext = AssetImage('assets/icons/icon_next.png');
}
