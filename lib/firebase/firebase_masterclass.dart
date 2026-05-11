import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'firebase_options.dart';


/**
 * ====================================================================================
 * 🚀 الدليل الاحترافي الكامل: ربط Flutter بـ Firebase وتفعيل أنظمة المصادقة
 * ====================================================================================
 *
 * هذا الدليل سيأخذك خطوة بخطوة لربط تطبيق فلاتر الخاص بك بـ Firebase لجميع المنصات
 * (Android, iOS, Web, Desktop) وتفعيل أشهر طرق تسجيل الدخول مع أمثلة عملية مفصلة.
 *
 * ------------------------------------------------------------------------------------
 *
 * [1] الخطوة الأولى (والأهم): الإعداد التلقائي باستخدام FlutterFire CLI
 * --------------------------------------------------------------------
 *
 * بدلاً من الطريقة اليدوية القديمة والمعرضة للأخطاء، سنستخدم أداة FlutterFire CLI
 * الرسمية التي تقوم بكل العمل الشاق بالنيابة عنا.
 *
 * ### ماذا تفعل هذه الأداة؟
 * - تتصل بمشروعك على Firebase.
 * - تنشئ تطبيقات لكل منصة (Android, iOS, Web, etc.) داخل مشروع Firebase.
 * - تنشئ كل مفاتيح الربط (API Keys) ومعرفات العملاء (OAuth Client IDs) اللازمة.
 * - تولد ملف `firebase_options.dart` الذي يحتوي على كل هذه الإعدادات، مما يجعل
 *   عملية التهيئة في الكود سهلة جداً.
 *
 * ### خطوات التنفيذ:
 *
 * 1. **تثبيت الأداة (مرة واحدة فقط):**
 *    في الـ Terminal، اكتب الأمر التالي:
 *    ```
 *    dart pub global activate flutterfire_cli
 *    ```
 *
 * 2. **تسجيل الدخول إلى Firebase:**
 *    ```
 *    firebase login
 *    ```
 *    سيفتح المتصفح لتسجيل الدخول بحساب جوجل المرتبط بـ Firebase.
 *
 * 3. **ربط المشروع:**
 *    داخل مجلد مشروع فلاتر الخاص بك، اكتب الأمر:
 *    ```
 *    flutterfire configure
 *    ```
 *    - ستظهر لك قائمة بمشاريعك على Firebase، اختر المشروع الذي أنشأته.
 *    - سيطلب منك تحديد المنصات التي تريد ربطها، اخترها جميعاً (android, ios, web, windows, macos).
 *
 * 4. **النتيجة:**
 *    بعد انتهاء الأمر، ستجد ملف `lib/firebase_options.dart` قد تم إنشاؤه. هذا الملف
 *    هو "الكنز" الذي يجعل التهيئة تعمل على كل المنصات بسطر كود واحد.
 *
 * ------------------------------------------------------------------------------------
 *
 * [2] الخطوة الثانية: إعدادات خاصة بكل منصة (Platform-Specific Setup)
 * --------------------------------------------------------------------
 *
 * على الرغم من أن `flutterfire configure` يقوم بمعظم العمل، إلا أن بعض طرق تسجيل الدخول
 * (مثل Google Sign-In) تحتاج خطوات إضافية بسيطة.
 *
 * ### أ- إعدادات Android (لـ Google Sign-In و Phone Auth):
 *
 * **الحصول على بصمات SHA-1 و SHA-256:**
 * خدمات جوجل تحتاج للتحقق من أن التطبيق الذي يحاول تسجيل الدخول هو تطبيقك فعلاً.
 *
 * 1. افتح الـ Terminal داخل مجلد مشروعك.
 * 2. انتقل إلى مجلد الأندرويد: `cd android`
 * 3. نفذ الأمر التالي:
 *    - على ماك/لينكس: `./gradlew signingReport`
 *    - على ويندوز: `gradlew signingReport`
 *
 * 4. **النتيجة:** سيظهر لك تقرير طويل، ابحث فيه عن `Variant: debug` وانسخ قيم `SHA-1` و `SHA-256`.
 *
 * او:
 *    - على ويندوز Command Prompt(cmd): keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
 *    - على ويندوز PowerShell: keytool -list -v -keystore "$env:USERPROFILE\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
  * النتيجة ل cmd,PowerShell:
  Serial number: 1
  Valid from: Sun Apr 05 01:41:00 EET 2026 until: Tue Mar 28 01:41:00 EET 2056
  Certificate fingerprints:
          SHA1: C1:83:52:56:71:E4:7D:50:24:7B:56:75:DB:56:74:DF:8F:BB:7B:29 --> fingerprint اللي احنا عايزينها وبنكتبه في ال firebase console للمشروع اللي احنا عايزينه في الاعدادات العامة ليه تحت SHA certificate fingerprints تحتها علطول Add fingerprint
          SHA256: 18:B2:11:E8:04:68:9D:94:28:BF:43:05:E2:16:A8:10:1C:EB:89:0A:27:6A:9D:A3:7E:7A:0E:52:BB:B6:C0:E1
  Signature algorithm name: SHA256withRSA
  Subject Public Key Algorithm: 2048-bit RSA key
  Version: 1

 *
 * 5. **إضافة البصمات إلى Firebase (لكل بصمة على حدة):**
 *    - اذهب إلى Firebase Console > Project settings (أيقونة الترس).
 *    - انزل إلى قسم "Your apps" واختر تطبيق الأندرويد.
 *    - في قسم "SHA certificate fingerprints"، ستجد زر "Add fingerprint".
 *    - **الخطوة الأولى (إضافة SHA-1):**
 *      - اضغط على "Add fingerprint".
 *      - الصق قيمة **SHA-1** التي نسختها.
 *      - اضغط Save.
 *    - **الخطوة الثانية (إضافة SHA-256):**
 *      - اضغط على "Add fingerprint" **مرة أخرى**.
 *      - الصق قيمة **SHA-256** التي نسختها.
 *      - اضغط Save.
 *    - **النتيجة:** يجب أن ترى الآن بصمتين مسجلتين في القائمة، واحدة لـ SHA-1 والأخرى لـ SHA-256.
 *
 * 6. **تحديث ملف الإعدادات (إلزامي):**
 *    بعد إضافة البصمات، قم بتحميل ملف `google-services.json` الجديد من نفس الصفحة
 *    وضعه في مجلد `android/app`، مستبدلاً الملف القديم.
 *
 * ### **إعدادات إضافية في Google Cloud (لمصادقة الهاتف على Android):**
 * لتمكين التحقق التلقائي من رقم الهاتف على أجهزة أندرويد (حيث لا يحتاج المستخدم لإدخال الكود يدوياً في بعض الحالات)، يجب تفعيل واجهة برمجة تطبيقات إضافية.
 *
 * 1.  اذهب إلى Google Cloud Console.
 * 2.  تأكد من أنك في المشروع الصحيح المرتبط بـ Firebase.
 * 3.  من القائمة الجانبية، اذهب إلى `APIs & Services > Library`.
 * 4.  في شريط البحث، ابحث عن `Android Device Verification`.
 * 5.  اضغط عليها ثم اضغط `Enable`.
 *
 * هذه الخطوة اختيارية ولكنها تحسن تجربة المستخدم بشكل كبير على أندرويد.
 *
 * --------------------------------------------------------------------
 *
 * ### ب- إعدادات iOS (لـ Google Sign-In والروابط الخارجية):
 *
 * هذه الخطوة ضرورية للسماح لتطبيق جوجل بالعودة إلى تطبيقك بعد إتمام عملية تسجيل الدخول.
 *
 * 1. **الحصول على REVERSED_CLIENT_ID:**
 *    - بعد تشغيل `flutterfire configure`، سيتم إنشاء ملف `ios/Runner/GoogleService-Info.plist`.
 *    - افتح هذا الملف، وابحث عن مفتاح `<key>REVERSED_CLIENT_ID</key>`.
 *    - انسخ القيمة النصية (`<string>...`) الموجودة تحته.
 *
 * 2. **إضافة URL Scheme في Xcode:**
 *    - افتح مشروعك في Xcode (عبر ملف `ios/Runner.xcworkspace`).
 *    - من القائمة اليسرى، اختر `Runner`، ثم اذهب إلى تبويب `Info`.
 *    - انزل للأسفل إلى قسم `URL Types` واضغط على زر `+`.
 *    - في خانة `URL Schemes`، الصق القيمة التي نسختها في الخطوة السابقة.
 *
 * **💡 طريقة بديلة لمستخدمي ويندوز (بدون Xcode):**
 * إذا كنت تعمل على نظام ويندوز ولا تملك جهاز ماك، يمكنك تنفيذ نفس الخطوة السابقة يدوياً عن طريق تعديل ملف `Info.plist` مباشرة:
 *
 * 1. **الحصول على REVERSED_CLIENT_ID (نفس الخطوة السابقة):**
 *    - افتح ملف `ios/Runner/GoogleService-Info.plist` في محرر الأكواد (مثل VS Code).
 *    - ابحث عن مفتاح `<key>REVERSED_CLIENT_ID</key>`.
 *    - انسخ القيمة النصية (`<string>...`) الموجودة تحته. (مثال: `com.googleusercontent.apps.xxxxxxxx-xxxxxxxx`)
 *
 * 2. **تعديل ملف `Info.plist` يدوياً:**
 *    - افتح ملف `ios/Runner/Info.plist` في محرر الأكواد.
 *    - قبل نهاية الملف (قبل آخر سطرين `</dict>` و `</plist>`)، أضف الكود التالي:
 *
 *    ```xml
 *    <key>CFBundleURLTypes</key>
 *    <array>
 *      <dict>
 *        <key>CFBundleTypeRole</key>
 *        <string>Editor</string>
 *        <key>CFBundleURLSchemes</key>
 *        <array>
 *          <string>YOUR_REVERSED_CLIENT_ID_HERE</string>
 *        </array>
 *      </dict>
 *    </array>
 *    ```
 *    - **مهم:** استبدل `YOUR_REVERSED_CLIENT_ID_HERE` بالقيمة الفعلية التي نسختها في الخطوة الأولى.
 *    - احفظ الملف. بهذه الطريقة تكون قد أضفت الـ URL Scheme بنجاح بدون الحاجة لـ Xcode.
 *
 * ### **إعدادات إضافية في Firebase و Xcode (لمصادقة الهاتف على iOS):**
 * مصادقة الهاتف على iOS تتطلب إعداد إشعارات Apple (APNs) لكي يتمكن Firebase من إرسال إشعار صامت للتحقق من الجهاز بأمان.
 *
 * **الخطوة 1: إنشاء مفتاح مصادقة APNs (.p8) من حساب مطور Apple:**
 *   - اذهب إلى `developer.apple.com` وسجل الدخول.
 *   - اذهب إلى `Certificates, Identifiers & Profiles > Keys`.
 *   - اضغط على زر `+` لإنشاء مفتاح جديد.
 *   - أعطِ المفتاح اسماً (مثلاً: `Firebase APNs Key`) وقم بتفعيل `Apple Push Notifications service (APNs)`.
 *   - اضغط `Continue` ثم `Register`. قم بتحميل الملف الذي سينتهي بـ `.p8` واحتفظ به في مكان آمن (لا يمكنك تحميله مرة أخرى!).
 *   - انسخ الـ `Key ID` الذي سيظهر لك، وانسخ الـ `Team ID` الخاص بك (يمكنك إيجاده في أعلى يمين الصفحة بجانب اسمك).
 *
 * **الخطوة 2: رفع المفتاح إلى Firebase Console:**
 *   - في مشروعك على Firebase، اذهب إلى `Project settings > Cloud Messaging`.
 *   - تحت قسم `Apple app configuration`، اختر تطبيق iOS الخاص بك.
 *   - اضغط على زر `Upload` بجانب `APNs Authentication Key`.
 *   - ارفع ملف `.p8` الذي قمت بتحميله، وأدخل الـ `Key ID` والـ `Team ID`.
 *   - اضغط `Upload`.
 *
 * **الخطوة 3: تفعيل Push Notifications و Background Modes في Xcode:**
 *   - افتح مشروعك في Xcode (`ios/Runner.xcworkspace`).
 *   - اختر `Runner` ثم اذهب إلى تبويب `Signing & Capabilities`.
 *   - اضغط `+ Capability` وأضف `Push Notifications`.
 *   - اضغط `+ Capability` مرة أخرى وأضف `Background Modes`.
 *   - في قسم `Background Modes`، قم بتفعيل `Background fetch` و `Remote notifications`.
 *
 * --------------------------------------------------------------------
 *
 * ### ج- إعدادات Web:
 * `flutterfire configure` يقوم بالإعدادات الأساسية، لكن للتشغيل في بيئة الإنتاج (Production) والتعامل مع النطاقات المخصصة، تحتاج لخطوات إضافية.
 *
 * **1. إضافة نطاقات الويب المصرح بها (Authorized Domains):**
 *   - في Firebase Console > Authentication > Settings > Authorized domains.
 *   - تأكد من وجود `localhost` (للتطوير).
 *   - **مهم:** عند نشر تطبيقك، يجب إضافة النطاق الفعلي الذي سيعمل عليه التطبيق، مثل `your-app-name.web.app` أو `www.your-custom-domain.com`.
 *
 * **2. تكوين معرّف عميل OAuth 2.0 في Google Cloud:**
 *   - اذهب إلى Google Cloud Console > APIs & Services > Credentials.
 *   - ابحث عن معرّف العميل الذي تم إنشاؤه للويب (عادة ما يكون اسمه `Web client (auto created by Google Service)`).
 *   - اضغط عليه لتعديله. في قسم `Authorized JavaScript origins`، تأكد من وجود نطاق تطبيقك (مثل `https://your-app-name.firebaseapp.com`). أضف أي نطاقات أخرى ستستخدمها.
 *
 * --------------------------------------------------------------------
 *
 * ### د- إعدادات Desktop (Windows, macOS, Linux):
 * - هذه المنصات تستخدم غالباً تدفق المصادقة الخاص بالويب (Web-based OAuth flow).
 * - **إعداد Redirect URI في Google Cloud Console:**
 *   - كما في إعدادات الويب، اذهب إلى Google Cloud Console > APIs & Services > Credentials واختر معرّف عميل الويب (Web client).
 *   - في قسم `Authorized redirect URIs`، يجب إضافة الرابط الذي سيستمع إليه تطبيق سطح المكتب للعودة إليه بعد المصادقة.
 *   - عادةً ما يكون هذا الرابط على `localhost` مع منفذ (port) معين. مثال: `http://localhost:12345`.
 *   - اضغط `Add URI` وأضف هذا الرابط. يجب أن يكون المنفذ الذي تحدده هنا هو نفس المنفذ الذي تستخدمه في كود فلاتر للاستماع إلى الاستجابة.
 *
 * ------------------------------------------------------------------------------------
 *
 * [3] الخطوة الثالثة: تفعيل طرق تسجيل الدخول في Firebase Console
 * --------------------------------------------------------------------
 *
 * قبل كتابة أي كود، اذهب إلى:
 * **Firebase Console > (مشروعك) > Authentication > Sign-in method**
 *
 * وقم بتفعيل (Enable) الطرق التي تريد استخدامها:
 * - **Email/Password**
 * - **Google** (سيطلب منك اختيار بريد إلكتروني للدعم "Project support email").
 * - **Phone**
 * - **Anonymous**
 *
 * ------------------------------------------------------------------------------------
 *
 * [4] الخطوة الرابعة: إضافة الحزم وكتابة الكود
 * ------------------------------------------------
 *
 * أضف الحزم اللازمة في `pubspec.yaml`:
 * ```yaml
 * dependencies:
 *   firebase_core: ^...
 *   firebase_auth: ^...
 *   google_sign_in: ^... # إذا كنت ستستخدم تسجيل دخول جوجل
 * ```
 *
 * **تهيئة Firebase في ملف `main.dart`:**
 * ```dart
 * import 'package:firebase_core/firebase_core.dart';
 * import 'firebase_options.dart'; // الملف الذي تم توليده
 *
 * void main() async {
 *   WidgetsFlutterBinding.ensureInitialized();
 *   await Firebase.initializeApp(
 *     options: DefaultFirebaseOptions.currentPlatform,
 *   );
 *   runApp(MyApp());
 * }
 * ```
 *
 * --- أمثلة الكود لكل طريقة ---
 *
 * ////////////////////////////////////////////////////////////////////
 * // 1. إنشاء حساب وتسجيل الدخول بالبريد وكلمة السر (Email & Password)
 * ////////////////////////////////////////////////////////////////////
 *
 * /// دالة لإنشاء مستخدم جديد
 * Future<UserCredential?> createAccountWithEmail(String email, String password) async {
 *   try {
 *     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
 *       email: email,
 *       password: password,
 *     );
 *     print("تم إنشاء الحساب بنجاح: ${credential.user?.uid}");
 *     return credential;
 *   } on FirebaseAuthException catch (e) {
 *     if (e.code == 'weak-password') {
 *       print('كلمة السر ضعيفة جداً.');
 *     } else if (e.code == 'email-already-in-use') {
 *       print('هذا البريد الإلكتروني مستخدم بالفعل.');
 *     } else {
 *       print('حدث خطأ: ${e.message}');
 *     }
 *     return null;
 *   }
 * }
 *
 * /// دالة لتسجيل دخول مستخدم موجود
 * Future<UserCredential?> signInWithEmail(String email, String password) async {
 *   try {
 *     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
 *       email: email,
 *       password: password,
 *     );
 *     print("تم تسجيل الدخول بنجاح: ${credential.user?.uid}");
 *     return credential;
 *   } on FirebaseAuthException catch (e) {
 *     if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
 *       print('البريد الإلكتروني أو كلمة السر غير صحيحة.');
 *     } else {
 *       print('حدث خطأ: ${e.message}');
 *     }
 *     return null;
 *   }
 * }
 *
 * ////////////////////////////////////////////////////////////////////
 * // 2. تسجيل الدخول باستخدام جوجل (Google Sign-In) - شامل كل المنصات
 * ////////////////////////////////////////////////////////////////////
 *
 * /// هذه الدالة تعمل على Android, iOS, Web, و macOS
 * Future<UserCredential?> signInWithGoogle() async {
 *   try {
 *     // 1. بدء عملية تسجيل الدخول مع جوجل (تفتح نافذة للمستخدم)
 *     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
 *
 *     // إذا ألغى المستخدم العملية
 *     if (googleUser == null) {
 *       print("تم إلغاء تسجيل الدخول بجوجل.");
 *       return null;
 *     }
 *
 *     // 2. الحصول على تفاصيل المصادقة (tokens) من حساب جوجل
 *     final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
 *
 *     // 3. إنشاء "بيانات اعتماد" (Credential) خاصة بـ Firebase
 *     final credential = GoogleAuthProvider.credential(
 *       accessToken: googleAuth?.accessToken,
 *       idToken: googleAuth?.idToken,
 *     );
 *
 *     // 4. استخدام بيانات الاعتماد لتسجيل الدخول في Firebase
 *     final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
 *     print("مرحباً بك: ${userCredential.user?.displayName}");
 *     return userCredential;
 *
 *   } catch (e) {
 *     print("حدث خطأ أثناء تسجيل الدخول بجوجل: $e");
 *     return null;
 *   }
 * }
 *
 * ////////////////////////////////////////////////////////////////////
 * // 3. تسجيل الدخول برقم الهاتف (Phone Authentication)
 * ////////////////////////////////////////////////////////////////////
 *
 * /// هذه العملية تتم على خطوتين: طلب الكود، ثم التحقق منه.
 * /// تحتاج إلى إدارة الحالة (state management) للانتقال بين الشاشات.
 *
 * // الخطوة الأولى: إرسال الكود إلى رقم الهاتف
 * Future<void> sendOtpToPhone(BuildContext context, String phoneNumber) async {
 *   await FirebaseAuth.instance.verifyPhoneNumber(
 *     phoneNumber: phoneNumber, // مثال: '+201234567890'
 *
 *     // (أ) يتم استدعاؤها عند اكتمال التحقق تلقائياً (في بعض أجهزة الأندرويد)
 *     verificationCompleted: (PhoneAuthCredential credential) async {
 *       await FirebaseAuth.instance.signInWithCredential(credential);
 *       print("تم التحقق وتسجيل الدخول تلقائياً!");
 *       // هنا يمكنك الانتقال إلى الشاشة الرئيسية
 *     },
 *
 *     // (ب) يتم استدعاؤها عند فشل التحقق
 *     verificationFailed: (FirebaseAuthException e) {
 *       print("فشل التحقق من الرقم: ${e.message}");
 *     },
 *
 *     // (ج) الأهم: يتم استدعاؤها عند إرسال الكود بنجاح
 *     codeSent: (String verificationId, int? resendToken) {
 *       // هنا يجب حفظ الـ verificationId والانتقال إلى شاشة إدخال الكود (OTP)
 *       print("تم إرسال الكود. معرف التحقق: $verificationId");
 *       // Navigator.push(context, MaterialPageRoute(builder: (_) => OTPScreen(verificationId: verificationId)));
 *     },
 *
 *     // (د) يتم استدعاؤها عند انتهاء مهلة التحقق التلقائي
 *     codeAutoRetrievalTimeout: (String verificationId) {},
 *   );
 * }
 *
 * // الخطوة الثانية: التحقق من الكود الذي أدخله المستخدم
 * Future<UserCredential?> verifyOtpAndSignIn(String verificationId, String smsCode) async {
 *   try {
 *     // إنشاء بيانات اعتماد باستخدام المعرف والكود
 *     PhoneAuthCredential credential = PhoneAuthProvider.credential(
 *       verificationId: verificationId,
 *       smsCode: smsCode,
 *     );
 *
 *     // تسجيل الدخول باستخدام بيانات الاعتماد
 *     final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
 *     print("تم التحقق وتسجيل الدخول بنجاح!");
 *     return userCredential;
 *   } on FirebaseAuthException catch (e) {
 *     print("كود التحقق غير صحيح أو حدث خطأ: ${e.message}");
 *     return null;
 *   }
 * }
 *
 * ////////////////////////////////////////////////////////////////////
 * // 4. تسجيل الدخول المجهول (Anonymous Sign-in)
 * ////////////////////////////////////////////////////////////////////
 *
 * /// مفيدة للسماح للمستخدمين باستخدام التطبيق (مثل إضافة منتجات للسلة)
 * /// قبل إنشاء حساب دائم.
 * Future<UserCredential?> signInAnonymously() async {
 *   try {
 *     final userCredential = await FirebaseAuth.instance.signInAnonymously();
 *     print("تم تسجيل الدخول كضيف. UID: ${userCredential.user?.uid}");
 *     return userCredential;
 *   } catch (e) {
 *     print("فشل تسجيل الدخول المجهول: $e");
 *     return null;
 *   }
 * }
 *
 * ////////////////////////////////////////////////////////////////////
 * // 5. تسجيل الخروج (Sign Out)
 * ////////////////////////////////////////////////////////////////////
 *
 * Future<void> signOut() async {
 *   // تسجيل الخروج من Firebase
 *   await FirebaseAuth.instance.signOut();
 *
 *   // إذا كان المستخدم قد سجل دخوله بجوجل، يجب تسجيل الخروج منها أيضاً
 *   // لمنع تسجيل الدخول التلقائي في المرة القادمة.
 *   if (await GoogleSignIn().isSignedIn()) {
 *     await GoogleSignIn().signOut();
 *   }
 *
 *   print("تم تسجيل الخروج بنجاح.");
 * }
 *
 * ====================================================================================
 * خلاصة ونصائح احترافية:
 * ====================================================================================
 *
 * 1. **إدارة الحالة (State Management):** استخدم BLoC أو Provider للاستماع لتغيرات
 *    حالة المصادقة (`FirebaseAuth.instance.authStateChanges()`) وتوجيه المستخدم
 *    تلقائياً إلى شاشة تسجيل الدخول أو الشاشة الرئيسية.
 *
 * 2. **التعامل مع الأخطاء:** دائماً استخدم `try-catch` مع `FirebaseAuthException`
 *    لعرض رسائل خطأ واضحة ومفهومة للمستخدم بدلاً من طباعتها في الـ console فقط.
 *
 * 3. **الأمان:** لا تقم أبداً بتخزين كلمات المرور أو البيانات الحساسة في الكود.
 *    Firebase يتولى كل عمليات التشفير والتخزين الآمن.
 *
 * 4. **الدمج بين الحسابات:** إذا سجل مستخدم مجهول دخوله ثم قرر إنشاء حساب دائم
 *    (بجوجل أو بريد إلكتروني)، يمكنك استخدام `user.linkWithCredential()` لدمج
 *    بيانات الحساب المجهول (مثل سلة التسوق) مع الحساب الدائم الجديد.
 *
 * 5. **التنظيف:** عند تسجيل الخروج، تأكد من الخروج من جميع الخدمات (مثل GoogleSignIn)
 *    وليس فقط Firebase Auth.
 *
 * ====================================================================================
 */

/// هذا الكود هو مجرد هيكل توضيحي، ستحتاج إلى استدعاء هذه الدوال من واجهة المستخدم الخاصة بك.
/// على سبيل المثال، في `onPressed` لزر تسجيل الدخول.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Firebase Masterclass'))),
    );
  }
}
