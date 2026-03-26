import 'package:flutter/material.dart';

abstract class SizeConfig {
  static const double tabletBreakpoint = 800;
  static const double desktopBreakpoint = 1200;

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;
  static late bool isPortrait;
  static late bool isLandscape;
  static late bool isMobile;
  static late bool isTablet;
  static late bool isDesktop;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    isPortrait = orientation == Orientation.portrait;
    isLandscape = orientation == Orientation.landscape;
    isMobile = screenWidth < tabletBreakpoint;
    isTablet = screenWidth >= tabletBreakpoint && screenWidth < desktopBreakpoint;
    isDesktop = screenWidth >= desktopBreakpoint;
  }
}

/*
  // --- معايير جوجل العامة (Material Design) ---
  // تناسب التطبيقات العادية (مثل تطبيق أخبار، متجر بسيط)
  static const double mobileLimit = 600;
  static const double tabletLimit = 1024;

  // --- معايير لوحات التحكم (Dashboard/Dense UI) ---
  // لأن الـ Dashboard يحتاج مساحة عرض أكبر للـ Sidebar والجداول
  static const double tabletBreakpoint = 800;   // متى نتحول من موبايل لتابلت
  static const double desktopBreakpoint = 1200; // متى تظهر نسخة الديسكتوب الكاملة

الموبايلات في وضع الـ Portrait --> أقل من 600 --> Mobile breakPoint = 600
التابلت والموبايلات الكبيرة (Landscape) --> من 600 إلى 1024 --> Tablet breakPoint = 1024
اللابتوبات والشاشات الكبيرة --> أكبر من 1024 --> Desktop breakPoint = 1200
________________________________________________________________________________

💡 ملاحظة للفهم:
1. أقل من 800 -> Mobile Layout (Sidebar يختفي في Drawer)
2. من 800 لـ 1200 -> Tablet Layout (Sidebar قد يصبح أيقونات فقط)
3. أكبر من 1200 -> Desktop Layout (الـ Sidebar والـ Content يظهران بالكامل)
*/