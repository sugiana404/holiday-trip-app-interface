import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holiday_trip_app_interface/utils/color_constant.dart';

class TextStylesConstant {
  static TextStyle normalTextStyle({
    Color color = Colors.black,
    double fontsize = 16,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.notoSans(
      textStyle: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }

  static TextStyle logoTextStyle({
    Color color = Colors.black,
    double fontsize = 24,
    FontWeight fontweight = FontWeight.bold,
  }) {
    return GoogleFonts.kalam(
      textStyle: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontweight,
      ),
    );
  }

  static TextStyle labelTextStyle({
    Color color = ColorConstant.black200TextColor,
    double fontsize = 12,
    FontWeight fontweight = FontWeight.normal,
  }) {
    return GoogleFonts.notoSans(
      textStyle:
          TextStyle(color: color, fontSize: fontsize, fontWeight: fontweight),
    );
  }

  static TextStyle buttonTextStyle(
      {Color color = ColorConstant.whiteTextColor,
      double fontsize = 12,
      FontWeight fontweight = FontWeight.normal}) {
    return GoogleFonts.notoSans(
      textStyle:
          TextStyle(color: color, fontSize: fontsize, fontWeight: fontweight),
    );
  }

  static TextStyle detailTextSTyle({
    Color color = ColorConstant.black200TextColor,
    double fontsize = 12,
    FontWeight fontweight = FontWeight.w200,
  }) {
    return GoogleFonts.notoSans(
      textStyle:
          TextStyle(color: color, fontSize: fontsize, fontWeight: fontweight),
    );
  }

  static TextStyle lineThroughTextStyle({
    Color color = ColorConstant.black200TextColor,
    double fontsize = 12,
    FontWeight fontweight = FontWeight.w100,
  }) {
    return GoogleFonts.notoSans(
      textStyle: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: fontweight,
          decoration: TextDecoration.lineThrough,
          decorationColor: Colors.black38,
          decorationThickness: 2.0),
    );
  }

  static TextStyle titleTextStyle(
      {Color color = ColorConstant.blackTextColor,
      double fontsize = 16.0,
      FontWeight fontweight = FontWeight.bold}) {
    return GoogleFonts.notoSans(
        textStyle: TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: fontweight,
    ));
  }
}
