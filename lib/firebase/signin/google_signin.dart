/*
أولاً: كيفية الحصول على مفتاح SHA-1 وإضافته (لنظام ويندوز)
اتبع هذه الخطوات بدقة:

افتح موجه الأوامر (Command Prompt) في ويندوز.

انسخ الأمر التالي والصقه في موجه الأوامر كما هو، ثم اضغط Enter:

الحل الأول (الأسهل): استخدم نافذة Command Prompt(cmd):
keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

الحل الثاني: استخدم الأمر الصحيح في PowerShell
إذا كنت تفضل البقاء في نافذة PowerShell، فاستخدم هذا الأمر المعدل الذي يفهمه PowerShell:
keytool -list -v -keystore "$env:USERPROFILE\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

النتيجة:
Serial number: 1
Valid from: Sun Apr 05 01:41:00 EET 2026 until: Tue Mar 28 01:41:00 EET 2056
Certificate fingerprints:
         SHA1: C1:83:52:56:71:E4:7D:50:24:7B:56:75:DB:56:74:DF:8F:BB:7B:29 --> fingerprint اللي احنا عايزينها وبنكتبه في ال firebase console للمشروع اللي احنا عايزينه في الاعدادات العامة ليه تحت SHA certificate fingerprints تحتها علطول Add fingerprint
         SHA256: 18:B2:11:E8:04:68:9D:94:28:BF:43:05:E2:16:A8:10:1C:EB:89:0A:27:6A:9D:A3:7E:7A:0E:52:BB:B6:C0:E1
Signature algorithm name: SHA256withRSA
Subject Public Key Algorithm: 2048-bit RSA key
Version: 1

والطريقة التانية هي اننا نفتح فولدر ال android in cmd ونكتب امر gradlew signingReport

ثانياً: إعدادات نظام iOS (iOS Setup)
لإعداد تسجيل الدخول بجوجل على نظام iOS، اتبع الخطوات التالية:

لـ iOS: حمل ملف اسمه GoogleService-Info.plist. افتحه كـ نص (Text)، وابحث جوا الكود عن مفتاح اسمه CLIENT_ID وواحد تاني اسمه REVERSED_CLIENT_ID. دول اللي هتحطهم في Xcode.
1. الحصول على الـ REVERSED_CLIENT_ID:
   - اذهب إلى ملف `ios/Runner/GoogleService-Info.plist` في مشروعك.
   - ابحث عن المفتاح `<key>REVERSED_CLIENT_ID</key>`.
   - انسخ القيمة الموجودة تحته (تكون على شكل: `com.googleusercontent.apps.xxxxxxxxxx-xxxxxxxxxx`).

2. إضافة الـ URL Scheme في Xcode:
   - افتح مشروعك باستخدام Xcode (عن طريق فتح ملف `ios/Runner.xcworkspace`).
   - اختر هدف التطبيق (Runner) من القائمة اليسرى.
   - اذهب إلى تبويب Info.
   - انزل إلى الأسفل حتى تجد قسم URL Types واضغط على زر (+).
   - في خانة URL Schemes، الصق القيمة التي نسختها (الـ REVERSED_CLIENT_ID).

ثالثاً: إعدادات الويب (Web Setup)
إذا كنت تستهدف منصة الويب، ستحتاج إلى:
1. الذهاب إلى Google Cloud Console.
2. اختيار مشروعك المرتبط بـ Firebase.
3. الذهاب إلى APIs & Services > Credentials.
4. تحت قسم OAuth 2.0 Client IDs، ستجد "Web client (auto created by Google Service)".
5. تأكد من إضافة رابط موقعك (أو localhost أثناء التطوير) في قسم "Authorized JavaScript origins".

رابعاً: إعدادات نظام الأندرويد (Android Setup)
لضمان عمل تسجيل الدخول بجوجل بشكل صحيح على الأندرويد، تأكد من الآتي:
1. التأكد من إضافة مكتبة `google_sign_in` في ملف `pubspec.yaml`.
2. التأكد من أن الـ `applicationId` في ملف `android/app/build.gradle` يتطابق تماماً مع الـ `package name` المسجل في Firebase Console.
3. إضافة الـ SHA-1 والـ SHA-256 (كما هو موضح في الخطوات السابقة) ضروري جداً لتفعيل خدمات Google Identity.

خامساً: إعدادات نظام الويندوز (Windows Setup)
لتفعيل تسجيل الدخول بجوجل على تطبيق Desktop (Windows):
1. يجب استخدام مكتبات تدعم الـ OAuth2 للويندوز مثل `google_sign_in_desktop` أو استخدام `url_launcher` لفتح المتصفح.
2. في Firebase Console، يجب إضافة تطبيق "Web" لأن الويندوز غالباً ما يعامل معاملة الويب في عملية الـ OAuth.
3. ستحتاج إلى الـ `Client ID` الخاص بالويب من ملف `google-services.json` أو من Google Cloud Console لاستخدامه في كود التهيئة.
-------------------

ومن نفس المكان بنحمل ملف ال google-services.json وبنحطه بدل نفس الملف القديم اللي شبهه في android/app/google-services.json
شرح الأمر: هذا الأمر يستخدم أداة keytool (الموجودة مع Java) لقراءة ملف debug.keystore (الذي يستخدمه Flutter عند تشغيل التطبيق في وضع التطوير) واستخراج البصمات الرقمية منه. كلمة المرور الافتراضية هي android.
انسخ قيمة SHA-1: سيظهر لك ناتج مشابه لهذا. ابحث عن SHA1 وانسخ القيمة السداسية العشرية الطويلة التي بجانبها.

!مثال على ناتج الأمر وكيفية نسخ قيمة SHA-1

أضف البصمة إلى Firebase:

اذهب إلى Firebase Console وافتح مشروعك.
اضغط على أيقونة الترس (⚙️) بجوار "Project Overview" واختر Project settings.
انزل لأسفل إلى قسم Your apps.
اختر تطبيق الأندرويد الخاص بك.
انزل إلى قسم SHA certificate fingerprints واضغط على Add fingerprint.
الصق القيمة التي نسختها في الخطوة السابقة واضغط Save.
تحديث ملف الإعدادات (خطوة إلزامية):

بعد حفظ البصمة، يجب عليك تحميل ملف google-services.json الجديد.
ضع الملف الجديد في مجلد android/app داخل مشروعك، واستبدل الملف القديم.

*/