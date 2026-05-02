/*
--------------------------------------------------------------------------------
شرح الـ Localization (تعريب وتدويل التطبيق) بالتفصيل:
الـ Localization هي عملية جعل تطبيقك يدعم لغات مختلفة وتنسيقات مختلفة (مثل التاريخ والعملة) بناءً على لغة جهاز المستخدم.

1. تثبيت الإضافة (Extension):
- قم بتحميل إضافة "Flutter Intl" من الـ Marketplace في VS Code.
- وظيفة هذه الإضافة هي تسهيل عملية إدارة ملفات الترجمة وتوليد الكود البرمجي تلقائياً.
- لتفعيلها في مشروعك: اضغط `Ctrl + Shift + P` واكتب `Flutter Intl: Initialize`.

2. المجلدات الناتجة (Generated Folders):
بعد التفعيل، سيقوم الـ Extension بإنشاء مجلدين داخل الـ `lib`:
- مجلد `l10n`: يحتوي على ملفات الـ `.arb` (وهي ملفات تشبه الـ JSON بنضع فيها الكلمات وترجمتها).
- مجلد `generated`: يحتوي على كود Dart الذي يتم توليده تلقائياً، ولا يجب عليك التعديل فيه يدوياً.

3. إعداد ملف الـ pubspec.yaml:
يجب إضافة مكتبة الدعم الرسمية من فلاتر:
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: ^0.18.1 # تأكد من استخدام أحدث إصدار

4. إعداد الـ MaterialApp:
يجب تعريف الـ Delegates واللغات المدعومة في ملف `main.dart`:

import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart'; // استيراد الملف المولد تلقائياً

MaterialApp(
  // 1. تعريف الـ Delegates المسؤولة عن الترجمة
  localizationsDelegates: const [
    S.delegate, // الكلاس المولد من إضافة Flutter Intl
    GlobalMaterialLocalizations.delegate, // ترجمة عناصر Material (مثل الـ Calendar)
    GlobalWidgetsLocalizations.delegate,  // ترجمة اتجاهات الودجات (LTR/RTL)
    GlobalCupertinoLocalizations.delegate, // ترجمة عناصر iOS
  ],
  // 2. تحديد اللغات المدعومة
  supportedLocales: S.delegate.supportedLocales, // هذا بيجيب اللغات اللي انت حددتها في ملفات الـ .arb
  
  // 3. تحديد اللغة الحالية (اختياري، لو عايز تثبت لغة معينة)
  locale: const Locale('ar'), --> عشان اخلي اللغة العربية هي اللغة الافتراضية عند تشغيل التطبيق واقدر استخدم هنا ال state management عشان اغير اللغة من داخل التطبيق زي كده:
  - locale: provider.currentLocale, --> عشان اخلي اللغة اللي في ال provider هي اللغة الافتراضية عند تشغيل التطبيق واقدر اغيرها من داخل التطبيق عن طريق تغيير قيمة currentLocale في ال provider وعمل notifyListeners() عشان يعيد بناء التطبيق بالترجمة الجديدة
  
  home: const MyHomePage(),
);

- Additional set up for iOS apps: // اضافة التكوين الخاص باللغات في iOS

To enable localization for iOS apps, extend ios/Runner/Info.plist file with supported locales configuration. This list should be consistent with the locales listed in the lib/l10n folder.

// بضيف اللغات اللي بدعمها في التطبيق هنا، لازم تكون نفس اللغات اللي في مجلد l10n عن طريق الكود دا:
<key>CFBundleLocalizations</key>
<array>
    <string>en</string> --> English language
    <string>ar</string> --> Arabic language
    <string>de_DE</string> --> German language (Germany)
    <string>fr_FR</string> --> French language (France)
    <string>es_ES</string> --> Spanish language (Spain)
    <string>it_IT</string> --> Italian language (Italy)
    <string>ja_JP</string> --> Japanese language (Japan)
    <string>ko_KR</string> --> Korean language (South Korea)
    ...
</array>
Current locale can be changed programmatically using S.load method and passing the locale:

S.load(Locale('de', 'DE'));
Access to the current locale:

Intl.getCurrentLocale() --> ممكن نعملها دالة افضل زي كده:
import 'package:intl/intl.dart';
bool isArabic() => Intl.getCurrentLocale().startsWith('ar');
bool isEnglish() => Intl.getCurrentLocale().startsWith('en');
وبعدين نقدر نستخدمها في الكود خصوصا في تحديد المسافات بتاعة اليمين واليسار زي كده:
Padding(
  padding: EdgeInsets.only(
    left: isArabic() ? 0 : 16, // لو اللغة عربية، المسافة من اليسار تكون 0
    right: isArabic() ? 16 : 0, // لو اللغة عربية، المسافة من اليمين تكون 16
  ),
  child: Text(S.of(context).welcomeMessage),
)

5. إضافة الكلمات في ملفات الـ .arb:
- افتح `intl_en.arb` وأضف:
  { "title": "Hello World" }
- افتح `intl_ar.arb` وأضف:
  { "title": "أهلاً بك" }

6. استخدام الترجمة في الكود:
بدلاً من كتابة النص مباشرة، نستخدم الكلاس `S`:
Text(S.of(context).title)

7. تغيير اللغة برمجياً (Locale Provider):
لتغيير لغة التطبيق من داخل الإعدادات مثلاً، يفضل استخدام State Management (مثل Provider أو Bloc) لتغيير قيمة الـ `locale` في الـ `MaterialApp` وإعادة بناء التطبيق.

مثال سريع باستخدام Provider:
1. أنشئ كلاس `LocaleProvider` يحتوي على متغير `currentLocale`.
2. في الـ `MaterialApp` اجعل خاصية `locale: provider.currentLocale`.
3. عند الضغط على زر "تغيير اللغة"، استدعي دالة تغير القيمة وتعمل `notifyListeners()`.

--------------------------------------------------------------------------------
8. التعامل مع الـ Plural (الجمع والمفرد):
ملفات الـ arb بتدعم التعامل مع صيغ الجمع المختلفة (صفر، واحد، اثنان، قليل، كثير).
مثال في ملف الـ arb:
"numberOfEmails": "{count, plural, =0{No emails} =1{One email} other{{count} emails}}"

الاستخدام في الكود:
Text(S.of(context).numberOfEmails(5))

9. تمرير متغيرات داخل النص (Placeholders):
لو عايز تعرض اسم المستخدم داخل جملة ترحيب:
"welcomeMessage": "Welcome {name}"

الاستخدام في الكود:
Text(S.of(context).welcomeMessage("Ahmed"))

10. معرفة اللغة الحالية للجهاز:
لو عايز تعرف التطبيق شغال بأي لغة حالياً عشان تنفذ كود معين:
bool isArabic() => Intl.getCurrentLocale() == 'ar';

11. إضافة لغة جديدة:
- اضغط `Ctrl + Shift + P`.
- اختر `Flutter Intl: Add locale`.
- اكتب رمز اللغة مثل `ar` أو `fr`.
- سيقوم الـ Extension بإنشاء ملف `.arb` جديد لهذه اللغة تلقائياً.

12. نصيحة هامة (Intl Utils):
في بعض الأحيان قد لا يتعرف الكود على الكلاس `S` فوراً، في هذه الحالة قم بعمل `Save` لملف الـ `.arb` أو قم بتشغيل الأمر:
`flutter pub run intl_utils:generate`
هذا الأمر سيقوم بتحديث مجلد الـ `generated` يدوياً.

--------------------------------------------------------------------------------
13. استخدام الـ Localization خارج الـ BuildContext:
أحياناً بنحتاج نترجم نصوص في ملفات مش ويدجت (زي الـ Logic أو الـ Validators)، في الحالة دي بنستخدم `Intl.message`:
String validateEmail() {
  return Intl.message(
    'Please enter a valid email',
    name: 'emailValidationError',
  );
}

14. التعامل مع اتجاهات الشاشة (RTL vs LTR):
فلاتر بتتعامل تلقائياً مع الاتجاهات لو استخدمت `Directionality` أو الـ `MaterialApp` مع الـ `Delegates` الصح.
- استخدم `Padding.directional` بدل `Padding.only(left: ...)` عشان الـ `start` و `end` يتبدلوا تلقائياً مع لغة الجهاز.
- استخدم `AlignmentDirectional` بدل `Alignment.centerLeft`.

15. الـ Localization في الـ iOS (خطوة هامة):
عشان الـ iOS يعرف إن التطبيق بيدعم لغات تانية، لازم تفتح ملف `ios/Runner/Info.plist` وتضيف اللغات:
<key>CFBundleLocalizations</key>
<array>
  <string>en</string>
  <string>ar</string>
</array>

16. مكتبة Easy Localization (بديل شهير):
لو مش عايز تستخدم الـ Extension، فيه باكدج اسمها `easy_localization` بتوفر مميزات زي:
- حفظ اللغة المختارة تلقائياً في الـ Shared Preferences.
- دعم ملفات JSON أو CSV أو XML للترجمة.
- عمل Restart للتطبيق تلقائياً عند تغيير اللغة.

طريقة استخدامها:
runApp(
  EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    child: MyApp(),
  ),
);

// الاستخدام في الكود:
Text('title'.tr())

--------------------------------------------------------------------------------
17. شرح الـ Intl.select (الاختيار بناءً على قيمة):
تُستخدم لاختيار نص معين بناءً على قيمة نصية (String) ممررة، مثل اختيار "ذكر" أو "أنثى".
مثال في ملف الـ arb:
"gender": "{gender, select, male{Male} female{Female} other{Other}}"

الاستخدام في الكود:
Text(S.of(context).gender("male"))

--------------------------------------------------------------------------------
18. تنسيق الأرقام والعملات (Number & Currency Formatting):
مكتبة `intl` بتوفر أدوات قوية لتنسيق الأرقام بناءً على اللغة:
var formatter = NumberFormat.currency(locale: 'ar', symbol: 'ج.م');
print(formatter.format(1200)); // المخرجات: ١٬٢٠٠ ج.م

--------------------------------------------------------------------------------
19. تنسيق التاريخ والوقت (Date Formatting):
لعرض التاريخ بتنسيق يناسب لغة المستخدم:
DateFormat.yMMMMd('ar').format(DateTime.now()); 
// المخرجات: ٢٥ مايو ٢٠٢٤

--------------------------------------------------------------------------------
20. حل مشكلة الخطوط (Fonts) مع اللغات المختلفة:
يفضل استخدام خطوط تدعم العربية والإنجليزية معاً، أو تغيير الخط برمجياً بناءً على اللغة:
ThemeData(
  fontFamily: Intl.getCurrentLocale() == 'ar' ? 'Cairo' : 'Roboto',
)

--------------------------------------------------------------------------------
21. الـ Localization في الـ Static Strings:
لو عندك قائمة ثابتة (Static List) وعايز تترجمها، لازم تحطها جوه الـ `build` ميثود أو تستخدم `getter` عشان الـ `context` يكون متاح والترجمة تتحدث لما اللغة تتغير:
List<String> get categories => [
  S.of(context).electronics,
  S.of(context).fashion,
];

--------------------------------------------------------------------------------
22. أداة استخراج النصوص (Extract to ARB):
لو عندك كود قديم فيه نصوص ثابتة (Hardcoded Strings)، الـ Extension بيسمحلك تضغط `Alt + Enter` على النص وتختار "Extract to ARB file

--------------------------------------------------------------------------------
*/