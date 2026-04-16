/*
A simple BlocObserver that logs Bloc lifecycle events to the console.
-- Observer يعني مراقب
هو كلاس بيرث من BlocObserver وبيوفر طريقة سهلة لمراقبة lifecycle events لل Bloc او ال changes في ال Cubit في الابلكيشن
بنستخدمه عشان نتابع التغيرات اللي بتحصل في ال Bloc او Cubit زي انشاء Bloc جديد، تغير الحالة، او اغلاق Bloc
بنقدر نستخدمه في مرحلة التطوير (development) عشان نعرف ايه اللي بيحصل في ال Bloc او Cubit بتاعنا
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
خليناه implement BlocObserver عشان يجبرنا نكتب الدوال اللي موجودة في BlocObserver

بنسجل ال BlocObserver بتاعنا في ال main.dart في ال void main فوق ال runApp() مباشرة
Bloc.observer = SimpleBlocObserver();
بعد كدا اي Bloc او Cubit هيتعمله create او هيحصل له change او هيتم اغلاقه هيتم تسجيل الحدث ده في ال console عن طريق ال SimpleBlocObserver
ودا هيساعدنا نتابع التغيرات اللي بتحصل في ال Bloc او Cubit بتاعنا ونعرف ايه اللي بيحصل في ال Bloc او Cubit بتاعنا
اللي يهمنا نستخدمه هنا هي دالة onChange عشان نتابع التغيرات اللي بتحصل في ال Bloc او Cubit
الفرق بين print و debugPrint:
print: بتطبع الرسالة في الكونسول، لكن لو الرسالة طويلة ممكن تتقطع ومش هتظهر كاملة
debugPrint: بتطبع الرسالة في الكونسول، وبتقسم الرسالة لو كانت طويلة عشان تظهر كاملة
print: دي بتفضل موجودة في الابلكيشن حتى في ال release mode لما اجي اعمل نسخة للابلكيشن عشان انشرها ودا شيء مش كويس عشان ممكن تكشف معلومات حساسةومهمة مينفعش تظهر
debugPrint: دي بتختفي في ال release mode لما اعمل نسخة للابلكيشن 

-- طريقة تسجيله في ال main.dart:
void main() {
  // بنسجل ال BlocObserver بتاعنا في ال main.dart في ال void main فوق ال runApp() مباشرة
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
})
// class SimpleBlocObserver extends BlocObserver { ==> بنعملها extends لو هنستخدم method معينة احنا عايزينها عشان implement بتجبرنا نستخدم كل ال methods الموجودة
*/

// import 'package:flutter/material.dart'; // أو import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SimpleBlocObserver implements BlocObserver {
//   @override
//   void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
//     debugPrint('Change -- ${bloc.runtimeType} => $change');
//     super.onChange(bloc, change);
//   }

//   @override
//   void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
//     debugPrint('Transition -- ${bloc.runtimeType} => $transition');
//     super.onTransition(bloc, transition);
//   }

//   @override
//   void onClose(BlocBase<dynamic> bloc) {
//     debugPrint('Close -- ${bloc.runtimeType} => $bloc');
//     super.onClose(bloc);
//   }

//   @override
//   void onCreate(BlocBase<dynamic> bloc) {
//     debugPrint('Create -- ${bloc.runtimeType} => $bloc');
//     super.onCreate(bloc);
//   }

//   @override
//   void onDone(Bloc<dynamic, dynamic> bloc, Object? event, [Object? error, StackTrace? stackTrace]) {
//     debugPrint('Done -- ${bloc.runtimeType} => $event,/ error: $error,/ stackTrace: $stackTrace');
//     super.onDone(bloc, event, error, stackTrace);
//   }

//   @override
//   void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
//     debugPrint('Error -- ${bloc.runtimeType} => $error');
//     super.onError(bloc, error, stackTrace);
//   }

//   @override
//   void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
//     debugPrint('Event -- ${bloc.runtimeType} => $event');
//     super.onEvent(bloc, event);
//   }
// }