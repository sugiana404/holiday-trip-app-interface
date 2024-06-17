import 'package:flutter/material.dart';
import 'package:holiday_trip_app_interface/utils/color_constant.dart';
import 'package:holiday_trip_app_interface/utils/text_styles_constant.dart';

class FieldConstant {
  static InputDecoration normalInputDecoration({String? labelText}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStylesConstant.labelTextStyle(),
      filled: true,
      fillColor: ColorConstant.whiteFieldColor,
      enabledBorder: normalBorderDecoration(),
      focusedBorder: normalBorderDecoration(),
      errorBorder: warningBorderDecoration(),
      focusedErrorBorder: normalBorderDecoration(),
    );
  }

  static InputBorder normalBorderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(
        color: ColorConstant.whiteFieldColor,
      ),
    );
  }

  static InputBorder warningBorderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(
        color: ColorConstant.warningColor,
      ),
    );
  }
}
