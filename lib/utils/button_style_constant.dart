import 'package:flutter/material.dart';
import 'package:holiday_trip_app_interface/utils/color_constant.dart';

class ButtonStyleConstant {
  static ButtonStyle elevatedButtonStyle(
      {Color backgroundColor = ColorConstant.mainColor}) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      minimumSize: Size(100, 40),
    );
  }
}
