import 'package:flutter/material.dart';

// بنشغل ال method دي في ال fontSize لكل الاستايلز اللي في AppStyles
double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  // double scaleFactor = getScaleFactor(context);
  // او :
  double width = MediaQuery.sizeOf(context).width;
  // لو ال context بتاع ال MediaQuery هيعملنا مشكلة وقت منيجي نشغل الكود فنقدر نشيله و هنجيب ال width عن طريق ال dispatcher
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalSize = dispatcher.views.first.physicalSize.width;
  // var devicePhysicalRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalSize / devicePhysicalRatio; // دا ال width بتاع الشاشة ونفس اللي بيجي من ال MediaQuery

  double scaleFactor = width < 600
      ? width / 400
      : width < 900
      ? width / 700
      : width / 1000;
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = responsiveFontSize * .8; // (80% of size)
  double upperLimit = responsiveFontSize * 1.2; // (120% of size)
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
