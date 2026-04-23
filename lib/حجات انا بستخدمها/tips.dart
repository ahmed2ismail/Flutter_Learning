/*
--------------------------------------------------------------------------------
لتغيير اسم التطبيق للاندرويد والايفون:
android و ios بيستخدموا اسم التطبيق من مكانين مختلفين في ملفاتهم الخاصة، فلو عايز تغير اسم التطبيق لازم تغيره في الاتنين.
android:
for android: android/app/src/main/AndroidManifest.xml:

<application
        android:label="App Name(Fruits Hub)"

ios:
for ios: ios\Runner\Info.plist

<key>CFBundleDisplayName</key> --> السطر 9
<string>Fruits Hub</string> --> السطر 10 ودا هو اسم التطبيق اللي احنا مهتمين نغيره
<key>CFBundleName</key> --> السطر 17
<string>fruits_hub</string> --> السطر 18 ودا خاص بالحزمة نفسها فبنسيبه زي مهو

وهنغير الصورة عن طريق باكدج flutter_launcher_icons in dev dependencies لاننا هنستخدمها في ال dev عشان نغير الصورة بس مش هنستخدمها في الكود نفسه يعني مش محتاجينها في ال production
وبضيف السطور دي في ال pubspecyaml:
flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/app_icon.png"
  min_sdk_android: 21 # android min sdk min:16, default 21
  web:
    generate: true
    image_path: "assets/images/app_icon.png"
    background_color: "#D9F5D3"
    theme_color: "#D9F5D3"
  windows:
    generate: true
    image_path: "assets/images/app_icon.png"
    icon_size: 48 # min:48, max:256, default: 48
  macos:
    generate: true
    image_path: "assets/images/app_icon.png"
وبعد كده برن ال الامر دا: dart run flutter_launcher_icons وبس كده

وهنغير ال id بتاع ال app كمان عشان نقدر نرفعه علي ال app store, google play:
from android: android/app/src/main/AndroidManifest.xml
  <activity
    android:name="com.yourcompany.yourapp.MainActivity"
    android:exported="true"
    android:launchMode="singleTop"
    android:theme="@style/AppTheme"
    android:configChanges="orientation|keyboardHidden|keyboard|screenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
    android:hardwareAccelerated="true"
    android:windowSoftInputMode="adjustResize">
  </activity>
to
  <activity
    android:name="com.fruits_hub.fruits_hub.MainActivity"
    android:exported="true"
    android:launchMode="singleTop"
    android:theme="@style/AppTheme"
    android:configChanges="orientation|keyboardHidden|keyboard|screenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
    android:hardwareAccelerated="true"
    android:windowSoftInputMode="adjustResize">

from ios: ios\Runner\Info.plist
  <key>CFBundleIdentifier</key>
  <string>com.yourcompany.yourapp</string>
to
  <key>CFBundleIdentifier</key>
  <string>com.fruits_hub.fruits_hub</string>

  for android: android/app/build.gradle app:
  android {
    defaultConfig {
        applicationId "com.fruits_hub.fruits_hub" // هنا كمان لازم نغير ال id
        minSdkVersion 21
        targetSdkVersion 33
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
    ...
    for ios: ios\Runner.xcodeproj\project.pbxproj
    PRODUCT_BUNDLE_IDENTIFIER = com.fruits_hub.fruits_hub; // هنا كمان لازم نغير ال id

    وبدل منعمل كل الحجات دي بايدينا هنستخدم باكدج rename:
    ودي عبارة عن command line tool بتساعدنا نغير اسم التطبيق وال id بتاعه في الاندرويد والايفون في خطوة واحدة وبسهولة شديدة عن طريقها بنقدر نغير اسم التطبيق وال id بتاعه سواء كان bundle id او app id
    بنضيفها في dev dependencies في ال pubspec.yaml:
dev_dependencies:
  rename: ^2.0.1
وبعد كده بنفتح ال terminal ونكتب الامر دا:
flutter pub global activate rename --> عشان يفعل الباكدج وبيتعمل مرة واحدة فقط
rename help --> عشان اعرف ازاي استخدم الباكدج
rename getAppName --targets ios,android --> عشان يجيبلي اسم التطبيق الحالي في الاندرويد و الايفون
rename getBundleId --targets ios,android --> عشان يجيبلي ال id الحالي في الاندرويد و الايفون
rename appname "Fruits Hub" --targets ios,android --> عشان يغيرلي اسم التطبيق في الاندرويد و الايفون
rename bundleid "com.yourcompany.yourapp" --targets ios,android --> عشان يغيرلي ال id في الاندرويد و الايفون
rename setAppName --targets ios,android --value "Fruits Hub" --> عشان يغيرلي اسم التطبيق في الاندرويد و الايفون
rename setBundleId --targets ios,android --value "com.yourcompany.yourapp" --> عشان يغيرلي ال id في الاندرويد و الايفون
rename setAppName --targets ios,android --value "Fruits Hub" && rename setBundleId --targets ios,android --value "com.fruits_hub.fruits_hub" --> عشان يغيرلي اسم التطبيق وال id في الاندرويد و الايفون في خطوة واحدة

الفرق بين الـ BundleId والـ AppId وكيفية كتابتهم:
ملحوظة مهمة ال bundleId للاندرويد بيكون بين كل كلمة والتانية _ اما ال ios بتكون اول كلمة small والتانية capital
مثال: BundleId for Android "com.fruits_hub.fruits_hub" اما BundleId for iOS "com.fruitsHub.fruitsHub" وبالتالي نستخدم لكل واحدة امر لوحده لما نيجي نغيره يعني منغيرش الاتنين بامر واحد ونستسهل
ال BundleId هو معرف التطبيق (Unique Identifier) اللي بيستخدمه نظام التشغيل (Operating System) عشان يميز تطبيقك عن التطبيقات التانية، وبيكون في شكل اسم نطاق مقلوب (Reverse Domain Name) زي "com.yourcompany.yourapp".
ال AppId هو معرف التطبيق داخل متجر التطبيقات (App Store) وبيكون مختلف عن BundleId.
وبنغير ال AppId بشكل منفصل لان ال rename package مش بتعرف تغيره فبنغيره يدوي زي مذكرنا فوق

1. الـ BundleId (أو الـ Package Name في أندرويد):
- هو المعرف الفريد للتطبيق على مستوى نظام التشغيل (Android/iOS).
- يجب أن يكون فريداً تماماً ولا يتكرر لأي تطبيق آخر في المتجر.
- طريقة الكتابة: يتبع نظام (Reverse Domain Name) ويكون كله حروف صغيرة في الأندرويد أما في iOS يفضل استخدام CamelCase لبعض الكلمات.
- مثال أندرويد: `com.fruits_hub.fruits_hub`
- مثال آي أو إس: `com.fruitsHub.fruitsHub`

2. الـ AppId (أو الـ Apple ID / Store ID):
- هو رقم تعريفي فريد (رقم فقط) بيتم إنشاؤه تلقائياً من قبل المتجر (App Store أو Google Play) بمجرد ما ترفع التطبيق أو تنشئه على لوحة التحكم الخاصة بالمطورين.
- لا علاقة له بطريقة تسمية الـ BundleId كحروف، هو مجرد "رقم تسلسلي" للتطبيق داخل قاعدة بيانات المتجر.
- مثال: `1234567890`

هل يجب أن يكونوا متطابقين؟
- لا يمكن أن يتطابقوا لأن الـ BundleId عبارة عن نص (String) والـ AppId عبارة عن رقم (Number).
- لكن الـ BundleId هو الذي يربط الكود الخاص بك بالـ AppId الموجود على المتجر.

مثال توضيحي للملفات:
في أندرويد (build.gradle):
defaultConfig {
    applicationId "com.fruits_hub.fruits_hub" // هذا هو الـ BundleId
}

في iOS (Xcode Project Settings):
PRODUCT_BUNDLE_IDENTIFIER = com.fruitsHub.fruitsHub; // هذا هو الـ BundleId

بعد رفع التطبيق على App Store Connect، ستحصل على App ID مثل:
App ID: 1672345980 (هذا الرقم تستخدمه مثلاً عند ربط إعلانات أو مشاركة رابط التطبيق).

--------------------------------------------------------------------------------
شرح مكتبة Sentry في Flutter:
Sentry هي أداة قوية جداً لمراقبة الأخطاء (Error Tracking) وتتبع أداء التطبيق (Performance Monitoring). وظيفتها الأساسية إنها بتبلغك فوراً لما يحصل Crash أو Error عند المستخدم في النسخة الـ Production، وبتبعتلك تفاصيل دقيقة عن الجهاز، الإصدار، ومكان الخطأ في الكود بالظبط.

1. خطوات الربط الأساسية:
أولاً: بنضيف المكتبة في الـ pubspec.yaml:
dependencies:
  sentry_flutter: ^8.0.0 # تأكد من استخدام أحدث إصدار

ثانياً: بنجيب الـ DSN من موقع Sentry (بعد ما تعمل Project جديد هناك).

2. كيفية الاستخدام في ملف main.dart:
بدل ما بننادي runApp مباشرة، بنستخدم SentryFlutter.init عشان نغلف التطبيق كله ونقدر نلقط أي خطأ يحصل في أي مكان.

import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  if (kReleaseMode) {
    // في وضع الإنتاج (Production)، بنستخدم Sentry لالتقاط الأخطاء
    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://example@sentry.io/add-your-dsn-here';
        // حدد نسبة تتبع الأداء (1.0 تعني تتبع كل العمليات)
        options.tracesSampleRate = .01; // عشان مطلعناش بره ال free version pricing بسرعة
        // تتبع التفاعلات مع الودجات (الضغط على الأزرار مثلاً)
        options.enableUserInteractionTracing = true;
      },
      appRunner: () => runApp(const MyApp()),
    );
  } else {
    // في وضع التطوير (Development)، بنشغل التطبيق بدون Sentry عشان مايتعبناش بالتقارير
    runApp(const MyApp());
  }
}

3. تسجيل الأخطاء يدوياً (Manual Logging):
أحياناً بنكون في try-catch وعايزين نبعت الخطأ لـ Sentry حتى لو التطبيق محصلوش Crash:

try {
  // كود ممكن يعمل مشكلة
  throw Exception('Something went wrong!');
} catch (exception, stackTrace) {
  await Sentry.captureException(
    exception,
    stackTrace: stackTrace,
  );
}

4. إضافة معلومات إضافية (Context & Tags):
Sentry.configureScope((scope) {
  scope.setUser(SentryUser(id: '1234', email: 'user@example.com'));
});


--------------------------------------------------------------------------------
مثال علي ال Extensions in dart:
extension StringExtensions on String {
  int toInt() {
    return int.parse(this);
  }

  String toTitleCase() {
    if (this.isEmpty) return this;
    return this.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}

extension NavigatorExtension on BuildContext {
  toView (Widget view) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => view),
    );
  }

  void navigateTo(String routeName) {
    Navigator.pushNamed(this, routeName);
  }
}

--------------------------------------------------------------------------------
شرح الكود الخاص بـ primarySwatch في Flutter
return MaterialApp(
                theme: ThemeData(
                  // ال primarySwatch بيعمل مجموعة من درجات الألوان المشتقة من اللون الأساسي (primary color) لتطبيقها على مكونات واجهة المستخدم المختلفة.
                  //  بمعنى آخر، هو يحدد لوحة الألوان الرئيسية لتطبيقك.
                  //  عندما تقوم بتعيين primarySwatch، فإن Flutter يقوم تلقائيًا بإنشاء مجموعة من الألوان الفاتحة والداكنة بناءً على اللون الذي تختاره،
                  //  ويستخدم هذه الألوان لتلوين عناصر مثل الـ AppBar، الأزرار، مؤشرات التقدم، وغيرها.
                  //  هذا يساعد في الحفاظ على تناسق التصميم عبر التطبيق بأكله.
                  //  على سبيل المثال، إذا قمت بتعيين primarySwatch: Colors.blue،
                  //  فإن Flutter سيستخدم درجات مختلفة من اللون الأزرق لتلوين عناصر واجهة المستخدم.
                  primarySwatch: بتاخد لون وبتعمل منه مجموعة الوان متدرجه (لوحه الوان)
                  //  زي ازرق غامق وازرق فاتح وازرق متوسط
                ),
)
MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeData(
          brightness: Brightness.dark, ==> عشان اخلي ثيم التطبيق داكن
          primarySwatch: Colors.blue, ==> عشان اخلي اللون الأساسي للتطبيق هو الأزرق
          theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor,), --> ال primaryTheme هيبق dark وبالتالي الخط الاساسي للتطبيق ابيض وحددنا كمان لون ال scaffold للتطبيق كله
          // scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor, ==> عشان اخلي لون خلفية ال Scaffold هو نفس لون خلفية الثيم الداكن
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
--------------------------------------------------------------------------------
scaffold(
      // resizeToAvoidBottomInset: false, // عشان لما يطلع الكيبورد مايحصلش overflow لل height يعني الشاشة متغيرش نفسها
      body: ...
)
--------------------------------------------------------------------------------
شرح الكود الخاص بـ shadowColor في Flutter
shadowColor: Colors.black.withValues(
              alpha: 1,
              red: 0,
              green: 0,
              blue: 0,
            ),

Container(
            decoration: BoxDecoration(
              boxShadow: [ ==> عشان اعمل ظل لل container
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.5), ==> عشان اخلي لون الظل رمادي وبشفافية 0.5
                  spreadRadius: 1, ==> عشان اخلي الظل ينتشر بمسافة 1 بكسلات
                  blurRadius: 10, ==> عشان اخلي الظل ضبابي
                  offset: Offset(0, 3), // changes position of shadow ==> يعني الظل هيكون تحت ال container بمسافة 3 بكسلات
                ),
              ],
            ),
            child: ...
--------------------------------------------------------------------------------
// الـ gap هي ويدجت مخصصة (Custom Widget) بنعملها عشان نوحد المسافات بين العناصر في الـ Column أو الـ Row.
// بدلاً من تكرار SizedBox في كل مكان، بنستخدم gap عشان الكود يكون أنظف وأسهل في القراءة.
class gap extends StatelessWidget {
  final double value;
  const gap(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    // بتعرف هي جوا Row ولا Column وتدي مسافة (عرض أو طول) بناءً على المكان.
    return SizedBox(height: value, width: value);
  }
}
// مثال للاستخدام:
// Column(children: [ Text('Hello'), gap(12), Text('World') ])
const gap(12.0) بدل ال SizedBox مثلا

--------------------------------------------------------------------------------
// شرح الـ Gap Widget:
// هي ويدجت من مكتبة خارجية (gap package) بتستخدم لعمل مسافات بين العناصر داخل الـ Column أو الـ Row.
// ميزتها عن الـ SizedBox إنك مش محتاج تحدد height لو أنت في Column أو width لو أنت في Row،
// هي بتعرف لوحدها الاتجاه (Direction) وتضيف المسافة المطلوبة.

// مثال للاستخدام بعد إضافة المكتبة:
// Column(children: [ Text('A'), Gap(20), Text('B') ]) // ستضيف مسافة رأسية 20
// Row(children: [ Text('A'), Gap(20), Text('B') ])    // ستضيف مسافة أفقية 20
--------------------------------------------------------------------------------
// شرح مكتبة collection:
// هي مكتبة رسمية من فريق Dart بتوفر أدوات (Utility functions) قوية للتعامل مع القوائم (Lists)، المجموعات (Sets)، والخرائط (Maps).
// أشهر استخداماتها هو المقارنة بين القوائم (Equality) لأن Dart بتقارن الـ Lists بالـ Reference مش بالقيم.

// مثال للمقارنة:
// ListEquality().equals([1, 2], [1, 2]); // بترجع true

// ميزة الـ firstWhereOrNull:
// بدل ما تستخدم firstWhere وتعمل Crash لو العنصر مش موجود، دي بترجع null بأمان.
// var user = users.firstWhereOrNull((u) => u.id == 5);

--------------------------------------------------------------------------------
// شرح مكتبة supercharged:
// هي مكتبة بتضيف "قوى خارقة" (Extensions) للأنواع الأساسية في Dart زي (String, int, double, Iterable).
// بتخلي الكود أقصر بكتير وأقرب للغة البشر.

// أمثلة سحرية:
// 1. تحويل النص لرقم: "42".toInt(); بدل int.parse("42");
// 2. التعامل مع الألوان: "#ff0000".toColor(); أو Colors.red.allShades();
// 3. الوقت: 5.minutes; أو 2.seconds; بدل Duration(seconds: 2);
// 4. العمليات على القوائم: [1, 2, 3].sum; أو [1, 2, 3].average;
// 5. التكرار: 5.times(() => print("Hello"));

// مثال يجمع القوة:
// var result = [1, 2, 3].count((x) => x > 1); // بيعد العناصر اللي أكبر من 1

------------------------------------- Spread Operator(أداة التفريغ) -------------------------------------------
Spread Operator (...) قبل userInfoList. هذه الثلاث نقاط تقوم بـ "تفريغ" أو "استخراج" العناصر من القائمة الناتجة وتضعها كعناصر فردية مباشرة داخل الـ children.
مثال:
Row(
            children: [
              ...userInfoList.map( --> هنا ال userInfoList دي ليست معمولها mapping يعني هي هتجيب كل العناصر اللي جواها وتحطها كقائمة كاملة في ال children ودا بيعمل مشكلة لان ال Row,Column children بيستقبل عناصر فردية وليس قائمة كاملة
              واحنا حلينا المشكلة دي ب ... قبل الليست وبكده هيتصم فصل القائمة وهيحطها في ال children عنصر عنصر وليس قائمة كاملة
                (item) => Expanded(
                  child: UserInfoListTile(
                    image: item.image,
                    title: item.title,
                    subTitle: item.subTitle,
                  ),
                ), ملاحظة بسيطة: عند استخدام الـ Spread Operator (...)، لم نعد بحاجة لكتابة .toList() في النهاية؛ لأن أداة التفريغ (...) تستطيع التعامل مع الـ Iterable الناتج من دالة map مباشرة، وهذا يجعل الكود أنظف وأكثر احترافية.
              ),
            ],
          ),
--------------------------------------------------------------------------------
automaticallyImplyLeading في ال AppBar بيستخدم عشان يتحكم في ظهور زر الرجوع (back button) تلقائيًا.
لو حطيت automaticallyImplyLeading: false, مش هيظهر زر الرجوع حتى لو كان فيه صفحة سابقة في الستاك.
لو حطيت automaticallyImplyLeading: true, هيظهر زر الرجوع تلقائيًا لما يكون فيه صفحة سابقة في الستاك.
--------------------------------------------------------------------------------
tooltip في Flutter بيستخدم لعرض نص صغير لما المستخدم يحوم فوق عنصر معين أو يضغط عليه لفترة قصيرة.
والخاصية دي بتكون مفيدة لتوفير معلومات إضافية عن العنصر أو لتوضيح وظيفته.
مثال:
IconButton(
  icon: Icon(Icons.info),
  tooltip: 'More info',
  onPressed: () {
    // Handle button press
  },
),
--------------------------------------------------------------------------------
الفرق بين final و const في Dart:
- final: بتستخدم لما عايز تعلن عن متغير قيمته مش هتتغير بعد ما تتعين لأول مرة، لكن القيمة دي ممكن تتحدد في وقت التشغيل (runtime).
- const: بتستخدم لما عايز تعلن عن متغير قيمته ثابتة ومش هتتغير أبدًا، والقيمة دي لازم تكون معروفة في وقت الترجمة (compile-time).
--------------------------------------------------------------------------------
الفرق بين onSubmitted و onChanged في TextField في Flutter:
- onChanged: بيتنفذ في كل مرة المستخدم يغير النص في TextField، يعني مع كل حرف بيتكتب أو بيتحذف.
- onSubmitted: بيتنفذ لما المستخدم يضغط على زر الإدخال (Enter) أو يخلص الكتابة في TextField.
--------------------------------------------------------------------------------
TextField(
      obscureText: obscureText!, ==> عشان اخفي النص اللي المستخدم بيكتبه في TextField زي ما بنشوف في حقول كلمة المرور (password fields)
      keyboardType: keyboardType, ==> عشان احدد نوع لوحة المفاتيح اللي هتظهر للمستخدم لما يضغط على TextField
      الاجابة عليه زي : لو حطيت keyboardType: TextInputType.emailAddress, هتظهر لوحة مفاتيح فيها @ و .com عشان تسهل على المستخدم كتابة البريد الإلكتروني او لو حطيت keyboardType: TextInputType.number, هتظهر لوحة مفاتيح فيها الأرقام بس عشان تسهل على المستخدم كتابة الأرقام
      onChanged: onChanged, ==> عشان اقدر اتعامل مع النص اللي المستخدم بيكتبه في TextField في كل مرة يتغير فيها النص
      onSubmitted: onSubmitted, ==> عشان اقدر اتعامل مع النص اللي المستخدم بيكتبه في TextField لما يضغط على زر الإدخال (Enter) أو يخلص الكتابة
      decoration: InputDecoration(
        hintText: hintText, ==> عشان اعرض نص تلميحي (placeholder) داخل TextField لما يكون فاضي
        prefixIcon: Icon(prefixIcon), ==> عشان اعرض أيقونة في بداية TextField
        suffixIcon: IconButton(
          icon: Icon(suffixIcon), ==> عشان اعرض أيقونة في نهاية TextField
          onPressed: onSuffixPressed, ==> عشان اقدر اتعامل مع الضغط على الأيقونة في نهاية TextField
        ),
      ),
--------------------------------------------------------------------------------
floatingActionButton بينكتب تحت ال appBar و فوق ال body في ال Scaffold وبيستخدم لعرض زرار عايم (floating button) بيكون ظاهر في  صفحة التطبيق وبيستخدم لأداء إجراء معين زي إضافة عنصر جديد أو فتح صفحة جديدة.
floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          // 1. بنروح لصفحة الإضافة وبنستنى (await) لحد ما المستخدم يخلص ويرجع
          await Navigator.pushNamed(context, AddProductPage.id);
          // 2. أول ما يرجع (سواء نجح في الإضافة أو كنسل)، بنقول للكيوبت "حدث البيانات"
          // عشان لو فيه منتج جديد يتضاف يظهر فوراً في الـ GridView
          BlocProvider.of<ProductsCubit>(context).fetchAllProducts();
        },
        ------------------ او ---------------------
        onPressed: () async {
           // 1. بنروح لصفحة الإضافة ونستنى
          await Navigator.pushNamed(context, AddProductPage.id);
          (The Mounted Check) : ==> لحل مشكلة Don't use 'BuildContext's across async gaps.Try rewriting the code to not use the 'BuildContext', or guard the use with a 'mounted' check.
          والمشكلة دي معناها ان انت بتستخدم ال BuildContext بعد ما عملت await لعملية ممكن تاخد وقت زي التنقل لصفحة جديدة (Navigator.push) أو جلب بيانات من الإنترنت (fetching data from the internet). لما بتعمل await لعملية زي دي، ممكن المستخدم يقرر يقفل التطبيق أو يرجع لورا بسرعة قبل ما العملية تخلص، وبالتالي ال BuildContext اللي انت بتستخدمه بعد ال await ممكن يكون بقى غير صالح للاستخدام (invalid) لأن الصفحة اللي كان عليها ال BuildContext اتقفلت.
            كل اللي عليك تعمله هو إنك تحط "حارس" قبل ما تنادي الـ Cubit. الـ حارس ده وظيفته يشوف هل الصفحة لسه "راكبة" (Mounted) في التطبيق ولا اتقفلت وأنت بره.
           // 2. الحارس (The Guard): لو الصفحة اتقفلت وأنا بره، متكملش تنفيذ الكود
            💡 ليه عملنا if (!context.mounted) return; ؟؟
            الأمان: السطر ده بيضمن إن الـ context لسه صالح للاستخدام.
            منع الـ Crashes: لو المستخدم قفل التطبيق أو رجع لورا بسرعة وأنت لسه بتعمل الـ await، البرنامج مش هيحاول يوصل لحاجة مش موجودة.
            نظافة الكود: ده بيخلي الـ Linter (الخط الأزرق) يختفي فوراً لأنك بقيت بتتبع "أفضل الممارسات" (Best Practices) في Flutter.
          if (!context.mounted) return;
           // 3. لو الصفحة لسه موجودة، نادى المدير وحدث البيانات
          BlocProvider.of<ProductsCubit>(context).fetchAllProducts();
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body:
        ------------------ او ---------------------
        floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        onPressed: () {
          showModalBottomSheet(
            // عشان نقدر نطلع الكيبورد من غير ما يحصل overflow لل height و ال showModalBottomSheet بيطلع فوق الكيبورد والاتنين بيكونوا ظاهرين مع بعض
            isScrollControlled: true,
            context: context,
            builder: (context) => const AddNoteBottomSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
--------------------------------------------------------------------------------
return AbsorbPointer(
            // بنستخدم AbsorbPointer عشان نمنع التفاعل مع الفورم لما الحالة تكون Loading يعني لما النوت بتتضاف
            // عشان مايحصلش مشاكل لو المستخدم ضغط على اي حاجة في الفورم وهو في حالة Loading
            // بنخلي absorbing تساوي true لما الحالة تكون Loading وعشان كده بنستخدم BlocConsumer مش BlocListener
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              // حطينا ModalProgressHUD فوق ال padding عشان مايحصلش overflow لل height عند ظهور مؤشر التحميل ولون الخلفية بتاع الانديكاتور يبقي هو هو بتاع showModalBottomSheet
              padding: EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                // عشان لما يطلع الكيبورد مايحصلش overflow لل height يعني الشاشة متغيرش نفسها
                // viewInsets.bottom بترجع المساحة اللي اتاخدت من الشاشة بسبب الكيبورد
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
--------------------------------------------------------------------------------
الفرق بين log و print و debugPrint في Dart مع مثال :
- print: بيطبع الرسائل في وحدة التحكم (console) بشكل مباشر. لكن لو كانت الرسالة طويلة جدًا ممكن تتقطع وما تظهرش كاملة.
- debugPrint: مشابه لـ print، لكنه بيقسم الرسائل الطويلة تلقائيًا إلى أجزاء أصغر عشان تظهر كاملة في وحدة التحكم.
- log دي معناها اني هسجل رسالة الخطأ في ال console عشان اقدر اعرف المشكلة فين
- log: بيستخدم لتسجيل الرسائل بشكل أكثر تنظيمًا، وبيسمحلك تضيف معلومات إضافية زي مستوى الخطورة (severity level) أو اسم المصدر (source name).
مثال:
import 'dart:developer';
log('This is a log message', name: 'my.app.category', level: 800);
print('This is a print message');
debugPrint('This is a debugPrint message that is very long and might get cut off if it exceeds the console limit. ' * 10);
--------------------------------------------------------------------------------
GridView.builder(
                clipBehavior: Clip.none, ==> عشان اقدر احط ال widget بتاعتي برا حدود ال gridview لانها بتقص الويدجت اللي برا حدود ال gridview لو ما حطيتش clipBehavior: Clip.none
                physics: BouncingScrollPhysics(), ==> عشان اعمل تأثير الارتداد (bounce effect) لما المستخدم يوصل لنهاية ال gridview
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( ==> عشان احدد عدد الاعمدة في ال gridview
                  crossAxisCount: 2, ==> عدد الاعمدة في ال gridview
                  mainAxisSpacing: 100, ==> عشان اعمل مسافة بين الصفوف في ال gridview
                  crossAxisSpacing: 10, ==> عشان اعمل مسافة بين الاعمدة في ال gridview
                  childAspectRatio: 1.5, ==> عشان احدد نسبة العرض الى الارتفاع لكل عنصر في ال gridview
                ),
                itemBuilder: (context, index) {
                  return CustomCard(products: products[index]);
                },
              ),
--------------------------------------------------------------------------------
Switch Case :

MaterialColor getThemeColor({required String? condition}) {
  if (condition == null) return Colors.blue;
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "cloudy":
    case "Overcast":
    case "Mist":
    case "Fog":
      return Colors.blueGrey;
    default:
      return Colors.blue; // Default color
  }
}
--------------------------------------------------------------------------------
Stack(
        clipBehavior: Clip.none, ==> عشان اقدر احط ال widget بتاعتي برا حدود ال stack لانها بتقص الويدجت اللي برا حدود ال stack لو ما حطيتش clipBehavior: Clip.none

Positioned widget في Flutter بيستخدم داخل Stack widget عشان يحدد موقع ودجت معين بالنسبة لل Stack.
مثال:
Positioned(
            right: 2,
            top: -60,
            child: Image.network(products.image, height: 100, width: 100),
          ),
--------------------------------------------------------------------------------
Builder widget في Flutter بيستخدم لإنشاء سياق (BuildContext) جديد داخل شجرة الودجات (widget tree).
ده بيكون مفيد لما تحتاج تستخدم سياق معين مش متاح في السياق الحالي.
مثال:
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Text('This is inside a Builder widget');
      },
    );
  }
}
--------------------------------------------------------------------------------
Flexible widget في Flutter بيستخدم داخل Row أو Column أو Flex عشان يحدد كيف يتم توزيع المساحة المتاحة بين الودجات الفرعية.
بيسمحلك تتحكم في حجم الودجات بناءً على النسبة اللي بتحددها باستخدام خاصية flex.
مثال:
Flexible(flex: 1, child: Container(color: Color(0xffFFF6DC))),
--------------------------------------------------------------------------------

class TuneItem extends StatelessWidget {
  const TuneItem({super.key, required this.color, required this.sound});

  final Color color;
  final String sound;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          final player = AudioPlayer();
          player.play(AssetSource(sound));
        },
        child: Container(color: color),
      ),
    );
  }
}

class TuneView extends StatelessWidget {
  TuneView({super.key});

  final List<Map<String, dynamic>> tuneData = [
    {'color': Colors.red, 'sound': 'note1.wav'},
    {'color': Colors.amber, 'sound': 'note2.wav'},
    {'color': Colors.yellow, 'sound': 'note3.wav'},
    {'color': Colors.green, 'sound': 'note4.wav'},
    {'color': Colors.greenAccent, 'sound': 'note5.wav'},
    {'color': Colors.blue, 'sound': 'note6.wav'},
    {'color': Colors.purple, 'sound': 'note7.wav'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tunes Player'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        backgroundColor: Color(0xff253238),
      ),
      body: Column(
        // List.generate الحل الاول عن طريق
        // children: List.generate(
        //   tuneData.length,
        //   (index) => TuneItem(
        //     color: tuneData[index]['color'],
        //     sound: tuneData[index]['sound'],
        //   ),
        // ),
        // يعني نربط حاجة بحاجة زي كده mapping دا حل او ممكن نعمل عملية
        children: tuneData
            .map((e) => TuneItem(color: e['color'], sound: e['sound']))
            .toList(),
      ),
    );
  }
}
------------------------------------ asMap: -----------------------------------------
الـ `.asMap()` هي ميزة (Method) في لغة Dart بتتحول الـ `List` لـ `Map`.
- **ليه بنستخدمها؟** في الـ `List` العادية لما بنعمل `.map()` بنقدر نوصل للعنصر (Value) بس، لكن مش بنقدر نعرف ترتيبه (Index) كام بسهولة.
- **إزاي بتشتغل؟** لما بنحول الستة لـ Map، بيبقى الـ `Key` هو الـ **Index** (0, 1, 2...) والـ `Value` هو **العنصر نفسه**.
- **الـ `.entries`:** بنستخدمها عشان نحول الـ Map لمجموعة مدخلات نقدر نلف عليها (Iterate)، وكل `entry` بيبقى جواه الـ `key` (اللي هو الـ index) والـ `value` (اللي هو الموديل بتاعنا).

**مثال من الكود بتاعك:**
بفضل الـ `.asMap()`، قدرنا نستخدم الـ `index` عشان نحدد الـ `padding` (لو العنصر رقم 1 ياخد padding مختلف) وعشان نغير الـ `selectedIndex` لما المستخدم يضغط على العنصر.

children: allExpensesItems.asMap().entries.map((entry) {
        final int index = entry.key;
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: index == 1 ? 12 : 0),
              child: AllExpensesItem(
                allExpensesItemModel: entry.value,
                isSelected: selectedIndex == index,
              ),
            ),
          ),
        );
      }).toList(),

--------------------------------------------------------------------------------
ScrollConfiguration widget : دي ويدجت بتستخدم عشان تخلي ال Scrollable widgets زي ListView أو SingleChildScrollView تدعم السحب (scrolling) باستخدام أجهزة مختلفة زي الفأرة (mouse) ولوحة اللمس (trackpad) بجانب اللمس (touch).
مثال:
ScrollConfiguration(
          behavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.trackpad,
            },
          ),
          child: ...
--------------------------------------------------------------------------------
// شرح الـ DropdownButton:
// هو ويدجت بيسمح للمستخدم يختار قيمة واحدة من قائمة خيارات بتظهر لما يضغط عليه.

// المكونات الأساسية:
// 1. value: القيمة المختارة حالياً (لازم تكون موجودة جوه القائمة).
// 2. items: قائمة من نوع DropdownMenuItem، وكل واحد فيه الـ value والـ child (النص اللي هيظهر).
// 3. onChanged: دالة بتشتغل لما المستخدم يختار قيمة جديدة، ومن خلالها بنحدث الـ State.

// مثال عملي:
String selectedValue = 'Egypt'; // القيمة الابتدائية

DropdownButton<String>(
  value: selectedValue, // القيمة اللي ظاهرة دلوقتي
  isExpanded: true,     // عشان ياخد عرض الشاشة كامل
  underline: Container(), // عشان نشيل الخط اللي تحت الزرار لو مش عايزينه
  items: ['Egypt', 'USA', 'KSA', 'UAE'].map((String item) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(item),
    );
  }).toList(),
  onChanged: (String? newValue) {
    setState(() {
      selectedValue = newValue!; // تحديث القيمة المختارة
    });
  },
),
--------------------------------------------------------------------------------
DropdownButton: قائمة منسدلة عادية.
DropdownButtonFormField: قائمة منسدلة مجهزة للعمل داخل النماذج (Forms).
PopupMenuButton: زر يفتح قائمة عائمة (غالباً يستخدم في الـ AppBar أو بجوار العناصر).
زر مخصص (InkWell / GestureDetector): زر تصممه بنفسك ليفتح BottomSheet (قائمة تظهر من أسفل الشاشة) عند الضغط عليه.
DropdownButton: هو المكون الأساسي للقائمة المنسدلة. مشكلته أنه صعب التخصيص (Styling) لجعله يبدو تماماً مثل الـ TextField الذي صممته (من حيث الحدود، الخلفية، الهوامش).
DropdownButtonFormField: هو ببساطة عبارة عن DropdownButton مُغلف بخصائص الـ Form. أكبر ميزة فيه أنه يقبل خاصية decoration: InputDecoration(...) تماماً مثل الـ TextField. هذا يعني أنه يمكنك إعطاؤه نفس الحواف، اللون الرمادي، والتصميم الذي استخدمته في CustomTextField ليظهروا بجانب بعضهم وكأنهم من نفس العائلة، بالإضافة إلى أنه يدعم التحقق (Validation) لو قررت وضعهم داخل Form لاحقاً.

--------------------------------------------------------------------------------
return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
        },
      ),
      child: ExpandablePageView( --> دي package انا منزلها بتجيبلي العرض والطول بتاع ال child وبتظبط الاب علي اساسهم وبتستخدم مع عدد محدود من العناصر من ال pageView
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: List.generate(3, (index) {
          return Padding(
            padding: EdgeInsets.only(right: index != 2 ? 12.0 : 0),
            child: const MyCard(),
          );
        }),
      ),
    );

--------------------------------------------------------------------------------
الـ Enum (اختصار لـ Enumeration) هو وسيلة لتعريف "خيارات محددة" لا يمكن الخروج عنها. بدلاً من الـ bool الذي يعطيك خيارين فقط (True/False)، الـ Enum يجعل الكود أوضح للقراءة (Readable) ويمنع الأخطاء.
enum TransactionType { 
  withdrawal, // سحب
  deposit     // إيداع
}

--------------------------------------------------------------------------------
widget ConstrainedBox(
  constraints: BoxConstraints(maxWidth: 60), // بتسمحلي اضع قيود لل child بتاعها بحيث انه ميقدرش يتخطاها
  child: ...
)

--------------------------------------------------------------------------------
.cast<Type>() --> تُستخدم دالة `.cast<Type>()` في Dart لتحويل نوع عناصر القائمة (List) أو المجموعة (Set) من نوع عام إلى نوع أكثر تحديداً. 
هذا مفيد جداً عند التعامل مع البيانات القادمة من JSON، حيث تكون القوائم عادةً من نوع `List<dynamic>`، ونحن نعلم يقيناً أن العناصر بداخلها هي نصوص `String` أو أرقام مثلاً.

**لماذا نستخدمها؟**
لأن Dart لغة صارمة في أنواع البيانات (Strongly Typed). إذا حاولت إسناد `List<dynamic>` إلى متغير من نوع `List<String>`، سيحدث خطأ (Type Mismatch). الـ `.cast` تقوم بعمل "تحويل آمن" لكل العناصر.

**مثال عملي:**
تخيل أن لديك بيانات كتاب قادمة من API، وقائمة المؤلفين تأتي كـ `dynamic`:

```dart
class BookModel {
  final String title;
  final List<String>? authors;

  BookModel({required this.title, this.authors});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] as String,
      // هنا json['authors'] يرجع كـ List<dynamic>
      // نستخدم .cast<String>() لتحويله إلى List<String>
      authors: (json['authors'] as List<dynamic>?)?.cast<String>(),
    );
  }
}

void main() {
  Map<String, dynamic> apiResponse = {
    "title": "Clean Code",
    "authors": ["Robert C. Martin", "Dean Wampler"] // هذه في الأصل dynamic list
  };

  BookModel book = BookModel.fromJson(apiResponse);
  print(book.authors); // المخرجات: [Robert C. Martin, Dean Wampler]
}
factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json['title'] as String,
    authors: (json['authors'] as List<dynamic>?)?.cast<String>(),
  );

--------------------------------------------------------------------------------
- دي مكتبة ال fl_chart لرسم الرسوم البيانية:
int activeIndex = -1; // عملتها -1 عشان في البداية مش بيكون فيه سكشن تم اختياره او الوقوف عليه بالماوس

return Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1, // ليكون مربعا تماماً
                child: PieChart(_getChartData()),
            ),
          ),
        ],
      );

  PieChartData _getChartData() {
    return PieChartData(
      // هنعمل الانيميشن
      pieTouchData: PieTouchData(
        enabled: true,
        touchCallback: (event, pieTouchResponse) {
          // عن طريق ال pieTouchResponse اقدر اجيب ال index بتاع ال item اللي انا واقف عليها
          setState(() {
          activeIndex = pieTouchResponse?.touchedSection?.touchedSectionIndex ?? -1;
          });
        },
      ),
        // titleSunbeamLayout: false, // // لا نريد توزيع العناوين بشكل شعاعي تلقائي من المكتبة
        sectionsSpace: 0, // (ليكون ملتصقاً) لا نريد مسافات بين الأجزاء --> لجعل الألوان متلاصقة تماماً بدون فراغات بيضاء بينها.
            // لرسم الاجزاء sections
          sections: incomeDetails.map((item) {
            return PieChartSectionData(
              title: item.title, // كتابة العنوان من ال list اللي اسمها incomeDetails
              value: double.parse(item.value.replaceAll('%', ''),), // تحويل النص (مثل "40%") إلى رقم عشري (40.0) عن طريق حذف علامة % ثم التحويل
              color: item.color, // لون الجزء المقتطع من الدائرة بناءً على الموديل
              showTitle:false, // لا نريد كتابة النسبة داخل الدائرة لو ب true النسبة هتنكتب جوه الدايرة
              radius: activeIndex == incomeDetails.indexOf(item) ? 35 : 25, // هذا هو "سمك" الحلقة (الدائرة) (Donut Chart). لو زدت الرقم، ستصبح الدائرة ممتلئة أكثر نحو المركز.
            );
          }).toList(),
        ),
      ),
    ),
  ],
);

--------------------------------------------------------------------------------
SliverToBoxAdapter widget في Flutter بيستخدم لتحويل ودجت عادي (مثل Container أو Text) إلى عنصر قابل للاستخدام داخل CustomScrollView أو أي شجرة ودجات تستخدم Slivers.
// عندنا كذا طريقة نعمل بيها سكرول للصفحة كاملة
          // الطريقة الاولى عن طريق CustomScrollView
          CustomScrollView(
            // فقط NewsListView دي ليست بتعمل سكرول للصفحة بحالها وليس لل
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: CategoriesListView()),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              NewsListViewBuilder(category: "general",),
              // SliverToBoxAdapter(child: NewsListView()),
              SliverFillRemaining(child: BestSellerListView()),
              // SliverFillRemaining : بتستخدم عشان تخلي ال ListView اللي جواها تاخد المساحة المتبقية من ال screen نفس فكرة ال Expanded وتتعامل معاها كأنها جزء واحد من ال scroll، وبكده حلينا مشكلة ال scrolling جوا ال ListView اللي كانت بتعارض ال CustomScrollView.
              بنستخدم معاها خاصية hasScrollBody: false,
            ],
          ),
      // الطريقة الثانية عن طريق CustomScrollView
      // SingleChildScrollView(
      //   physics: const BouncingScrollPhysics(),
      //   child: Column(
      //     children: const [
      //       CategoriesListView(),
      //       SizedBox(height: 16),
      //       NewsListView(),
      //     ],
      //   ),
      // ),
      // الطريقة الثالثة مبتعملش سكرول للصفحة كاملة وهي دي Column + Expanded + ListView i built it in the file itself
      // Column(
      //   spacing: 16,
      //   children: const [
      //     CategoriesListView(),
      //     Expanded(child: NewsListView()),
      //   ],
      // ),
--------------------------------------------------------------------------------
height: MediaQuery.of(context,).size.height, // عشان ياخد ارتفاع الشاشة كلها
width: MediaQuery.of(context,).size.width, // عشان ياخد عرض الشاشة كلها
--------------------------------------------------------------------------------
  late Future<List<ArticleModel>> future;
  @override
  void initState() {
    future = NewsService(Dio()).getTopHeadLines(category: widget.category);
    // كدا انا فصلت ال request عن ال وبالتالي هيتبني مرة واحدة بس لانه بقي بره ال build method
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      // FutureBuilder: هو Widget بيستخدم لعرض البيانات اللي بتيجي من Future وبتعمل rebuild لل UI لما البيانات تجهز
      // لازم نمررله future و builder
      // future: بنحط ال request اللي هيجيلنا من المستقبل
      // builder: بنحط ال UI اللي هيظهرلنا لما ال request يكتمل
      // snapshot: هو ال object اللي هيحتوي على البيانات اللي هتيجي من ال future
      // snapshot.data: هي البيانات اللي هتيجي من ال future
      // snapshot.hasData: بتكون true لو في بيانات جايه من ال future
      // snapshot.hasError: بتكون true لو في error حصل في ال future
      // snapshot.connectionState: بيحدد حالة الاتصال بال future
      // ConnectionState.none: مفيش اتصال بال future
      // ConnectionState.waiting: في انتظار البيانات من ال future
      // ConnectionState.active: البيانات بتجيلنا من ال future
      // ConnectionState.done: البيانات وصلت من ال future
      future: future, // كتبنا ال request اللي هيجيلنا من المستقبل
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(child: Text("Oops , There was an error , Try Later")),
          );
        } else {
          return ...
--------------------------------------------------------------------------------
StreamBuilder widget في Flutter بيستخدم لعرض البيانات اللي بتيجي من Stream وبتعمل rebuild لل UI لما البيانات تجهز
مثال:
StreamBuilder<QuerySnapshot>(
  stream: myStream, // Stream اللي هتيجي منه البيانات
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text('Data: ${snapshot.data}'); // عرض البيانات اللي جت من ال Stream
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}'); // عرض الخطأ لو حصل في ال Stream
    } else {
      return CircularProgressIndicator(); // عرض مؤشر تحميل أثناء انتظار البيانات
    }
  },
);
الفرق بين ال FutureBuilder و StreamBuilder:
- FutureBuilder: بيستخدم لعرض البيانات اللي بتيجي من Future، وبيعمل rebuild لل UI لما البيانات تجهز مرة واحدة.
- StreamBuilder: بيستخدم لعرض البيانات اللي بتيجي من Stream، وبيعمل rebuild لل UI لما البيانات تجهز بشكل مستمر، يعني ممكن يجي بيانات جديدة من ال Stream ويحدث ال UI تلقائيًا.
--------------------------------------------------------------------------------
  SliverList widget : دي ويدجت بتستخدم لعرض قائمة من العناصر (items) بشكل فعال داخل CustomScrollView أو أي شجرة ودجات تستخدم Slivers.
  بتسمحلك تعرض عدد كبير من العناصر بدون ما تستهلك كتير من الذاكرة، لأنها بتبني العناصر اللي بتظهر على الشاشة بس.
  SliverChildBuilderDelegate : دي بتستخدم مع SliverList عشان تبني العناصر بشكل ديناميكي بناءً على عدد العناصر اللي عندك.
  مثال:

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: NewsTile(articleModel: articles[index]),
        );
      }, childCount: articles.length),
    );
  }
}
الفرق بين SliverList و SliverGrid و listview.builder :
- SliverList: بيستخدم لعرض قائمة من العناصر بشكل عمودي داخل CustomScrollView أو أي شجرة ودجات تستخدم Slivers.
- SliverGrid: بيستخدم لعرض شبكة من العناصر (grid) داخل CustomScrollView أو أي شجرة ودجات تستخدم Slivers.
- listview.builder: بيستخدم لعرض قائمة من العناصر بشكل عمودي أو أفقي داخل ListView، وبيبني العناصر بشكل ديناميكي بناءً على عدد العناصر اللي عندك.
- shrinkWrap: true, // بمعني عايزك تاخدي ال hight بتاع ال children بتوعك فبالتالي ال ListView هتشوف ال items بتوعها قد ايه وهتتعرض كلها مرة واحدة
- physics: const NeverScrollableScrollPhysics(),
--------------------------------------------------------------------------------
InkWell widget في Flutter بيستخدم لإنشاء تأثير اللمس (ripple effect) على الودجات (widgets) اللي هو الضغط يعني او النقر علىها.
مثال:
InkWell(
      onTap: () {
        // Handle tap event
      },
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.blue,
        child: Text('Tap me'),
      ),
    );
GestureDetector vs InkWell :
- GestureDetector: هو ويدجت عام بيستخدم لاكتشاف مختلف أنواع الإيماءات (gestures) زي النقر، السحب، التكبير، وغيرها. لكنه ما بيضيفش تأثير بصري لما المستخدم يتفاعل مع الودجت.
- InkWell: هو ويدجت متخصص بيستخدم لإنشاء تأثير اللمس (ripple effect) على الودجات. بيضيف تأثير بصري لما المستخدم ينقر على الودجت، وبيستخدم غالبًا مع الودجات اللي بتكون داخل Material Design.
--------------------------------------------------------------------------------
ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No article URL available"),),);
--------------------------------------------------------------------------------
ClipRRect widget في Flutter بيستخدم لقص (clip) الودجات (widgets) بشكل دائري أو مستطيل بزوايا مدورة.
ClipRRect(
            borderRadius: BorderRadius.circular(6),
            // ال NetworkImage ليها شوية عيوب منها ان لما بعمل restart للتطبيق الصور مش بتكون لسه اتحملت فبيجبلي loading indicator وتاني مشكلة لما اعمل rebuild فوقتها الصور بتتحمل مرة اخرى ودا بيستهلك النت والمشكلة التالتة ان لو ال url بتاع الصورة غلط فهو مش بيقدر يحملها اصلا ومش بيقولي المشكلة فين
            // هنحل المشاكل دي عن طريق cached_network_image package
            // بعد مضيفها لازم اوقف التطبيق واشغله تاني
            // ال CachedNetworkImage بتكيش الداتا يعني بتحملها مرة واحدة بس وبتحفظها والظهور بتاع الصور بيكون بشكل سلس ولو اللينك غلط بيعرضلي علي الشاشة المشكلة
            child: CachedNetworkImage(
              // بستخدمها عشان اعرض كل ال urls اللي بتيجي من علي النت
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
              Image.network(
              articleModel.image ??
                  "https://via.placeholder.com/400x200?text=No+Image",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/news.png",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

      AspectRatio widget: بتستخدم لضبط نسبة الطول والعرض وبتطنش ال width, height بتاع ال child
      يعني انا بقولها انا هديكي قيمة واحدة وعايزك تظبطي القيمة التانية علي اساسها
      return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      // ال AspectRatio هتظبط ابعاد الصورة علي اساس ابعاد ال SizedBox والصورة هتبقي Responsible و مظبوطة علي اي جهاز
      child: AspectRatio(
        // AspectRatio widget: بتستخدم لضبط نسبة الطول والعرض وبتطنش ال width, height بتاع ال child
        // يعني انا بقولها انا هديكي قيمة واحدة وعايزك تظبطي القيمة التانية علي اساسها
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            image: const DecorationImage(
              image: AssetImage(AssetsData.testImage),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
      
--------------------------------------------------------------------------------
Text(
overflow: TextOverflow.ellipsis في Flutter بيستخدم لما يكون النص طويل وعايز تقصه وتضيف "..." في النهاية بدل ما يعرض النص كامل.
--------------------------------------------------------------------------------
Form widget في Flutter بيستخدم لإنشاء نموذج (form) يحتوي على حقول إدخال (input fields) زي TextFormField.
مثال:
class MyFormWidget extends StatelessWidget {
  // عملت GlobalKey شغال مع FormState واسمه formKey واستدعيت ال constructor GlobalKey()
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
    // ModalProgressHUD : is a package for circular indicator
      inAsyncCall: isLoading,
      // احنا عملنا ال Form Widget كأب لل ListView لاننا هنعمل validate لل email , password اللي هما جواها لان ال Form لازم تكون اب لل TextFormField اللي هعمله validate
      child: Form(
      key: formKey,
            child: ListView(
            .. .. ...
-----------------------------------------  in Flutter ---------------------------------------

--------------------------------------------------------------------------------
*/
