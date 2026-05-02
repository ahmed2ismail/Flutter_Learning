import 'package:flutter/material.dart';

// بنشغل ال method دي في ال fontSize لكل الاستايلز اللي في AppStyles
double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  // double scaleFactor = getScaleFactor(context);
  // او :
  double width = MediaQuery.sizeOf(context).width;
  // لو ال context بتاع ال MediaQuery هيعملنا مشكلة وقت منيجي نشغل الكود فنقدر نشيله و هنجيب ال width عن طريق ال dispatcher
  // Get screen width from PlatformDispatcher to avoid context dependency.
  // final dispatcher = ui.PlatformDispatcher.instance;
  // final physicalWidth = dispatcher.views.first.physicalSize.width;
  // final devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // final width = physicalWidth / devicePixelRatio; // devicePhysicalRatio; // دا ال width بتاع الشاشة ونفس اللي بيجي من ال MediaQuery

  // Determine the scale factor based on screen width breakpoints.
  double scaleFactor = width < 600
      ? width / 400
      : width < 900
      ? width / 700
      : width / 1000;
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * 0.8; // (80% of size)
  double upperLimit = fontSize * 1.2; // (120% of size)
  // print('Base fontSize = $fontSize ## lowerLimit = $lowerLimit ## upperLimit = $upperLimit ## ResponsiveFontsize = $ResponsiveFontsize ## final fontSize = ${ResponsiveFontSize.clamp(lowerLimit,upperLimit)}')
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
  // .clamp --> بتاخد قيمتين اقل واكبر ولو المتغير بتاعي كان قيمة اصغر من الاقل بيتغير للاقل ولو كانت قيمته اكبر من الاكبر بيتغير للاكبر ولو كان حاجة بينهم بيفضل زي مهو
}

// method بديلة لل condition logic:
// double getScaleFactor(BuildContext context) {
//   double width = MediaQuery.sizeOf(context).width;
//   if (width < 600) {
//     return width / 400;
//   } else if (width < 900) {
//     return width / 700;
//   } else {
//     return width / 1000;
//   }
// }

// وعشان نحل مشكلة ال context لل MediaQuery هنعمل function بتجيبلنا ال context وبترجعلنا ال TextStyle اللي احنا عايزينه:
// static TextStyle styleSemiBold20(BuildContext context) {
//   return GoogleFonts.montserrat(
//     color: AppColors.darkBlue,
//     fontSize: getResponsiveFontSize(context, fontSize: 20),
//     fontWeight: FontWeight.w600,
//   );
// }

// --------------------------------------------------------------------------------
/*
في الكود ده بنستخدم ال PlatformDispatcher عشان نجيب ال width بتاع الشاشة من غير ما نعتمد على ال BuildContext اللي ممكن يسبب مشاكل في بعض الحالات زي لما نستخدم ال TextStyle في مكان مفيهوش context زي ال AppStyles.
بنحسب ال scale factor بناءً على breakpoints معينة للعرض، وبنضرب ال fontSize في ال scale factor ده عشان نطلع ال responsive font size.
بعد كده بنستخدم ال clamp عشان نضمن ان ال font size ما يبقاش صغير جداً او كبير جداً، وبنحدد الحدود دي كنسبة من ال fontSize الاصلي (80% و 120%).

import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Calculates a responsive font size based on the screen width.
///
/// This function uses [PlatformDispatcher] to get the screen width, so it
/// doesn't require a [BuildContext].
double getResponsiveFontSize({required double fontSize}) {
  // Get screen width from PlatformDispatcher to avoid context dependency.
  final dispatcher = ui.PlatformDispatcher.instance;
  final physicalWidth = dispatcher.views.first.physicalSize.width;
  final devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  final width = physicalWidth / devicePixelRatio;

  // Determine the scale factor based on screen width breakpoints.
  double scaleFactor = width < 600
      ? width / 400
      : width < 900
      ? width / 700
      : width / 1000;
  double responsiveFontSize = fontSize * scaleFactor;

  // Clamp the font size to prevent it from becoming too small or too large.
  // A more effective approach is to clamp based on the original `fontSize`.
  // Here, we clamp it to be between 80% and 120% of the *original* font size.
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

abstract class TextStyles {
  static const String fontFamily = 'Cairo';

  static final TextStyle bold13 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: getResponsiveFontSize(fontSize: 13),
  );
}
*/