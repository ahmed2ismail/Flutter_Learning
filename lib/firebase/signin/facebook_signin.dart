// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

/**
 * ====================================================================================
 * 🚀 الدليل الاحترافي: ربط تسجيل الدخول بفيسبوك (Facebook Login) مع Flutter
 * ====================================================================================
 *
 * هذا الدليل يشرح بالتفصيل الممل كيفية ربط تطبيقك بنظام المصادقة عبر فيسبوك،
 * بدءًا من إعداد حساب المطورين وانتهاءً بكتابة الكود لجميع المنصات.
 *
 * ------------------------------------------------------------------------------------
 *
 * [1] الخطوة الأولى: إعداد التطبيق على منصة Facebook for Developers
 * --------------------------------------------------------------------
 *
 * 1.  اذهب إلى `developers.facebook.com` وسجل الدخول.
 * 2.  من "My Apps"، اضغط "Create App".
 * 3.  اختر نوع التطبيق "Consumer" (مستهلك).
 * 4.  أدخل اسم التطبيق (App Display Name) وبريدك الإلكتروني، ثم اضغط "Create App".
 * 5.  من لوحة التحكم، ابحث عن منتج "Facebook Login" واضغط "Set up".
 * 6.  من القائمة اليسرى، اذهب إلى `App Settings > Basic`. هنا ستجد `App ID` و `App Secret`. احتفظ بهما، سنحتاجهما في الخطوة التالية.
 * 7. هناخد الرابط الموجود في firebase Console اللي تحت اللي زي ده: https://fruit-hub-195d3.firebaseapp.com/__/auth/handler وهنحطه في Facebook for Developers > myApp > Use Cases > Facebook Login > Customize > Settings > Valid OAuth Redirect URIs عشان نربط بين التطبيق وفيسبوك
 *
 * ------------------------------------------------------------------------------------
 *
 * [2] الخطوة الثانية: تفعيل فيسبوك في Firebase Console
 * --------------------------------------------------------------------
 *
 * 1.  اذهب إلى مشروعك في Firebase Console.
 * 2.  من القائمة، اختر `Authentication > Sign-in method`.
 * 3.  اضغط على "Add new provider" واختر "Facebook".
 * 4.  قم بتفعيل (Enable) الخدمة.
 * 5.  الصق `App ID` و `App Secret` اللذين حصلت عليهما من منصة فيسبوك.
 * 6.  **نقطة هامة جداً:** قم بنسخ `OAuth redirect URI` الذي يظهر في هذه الصفحة (يبدو هكذا: `https://your-project-id.firebaseapp.com/__/auth/handler`).
 * 7.  اضغط "Save".
 *
 * ------------------------------------------------------------------------------------
 *
 * [3] الخطوة الثالثة: العودة إلى Facebook for Developers لإكمال الإعداد
 * --------------------------------------------------------------------
 *
 * 1.  ارجع إلى لوحة تحكم تطبيقك على `developers.facebook.com`.
 * 2.  من القائمة اليسرى، تحت "Facebook Login"، اختر "Settings".
 * 3.  في قسم `Valid OAuth Redirect URIs`، الصق الـ URI الذي نسخته من Firebase.
 * 4.  اضغط "Save Changes" في أسفل الصفحة.
 *
 * ### أ- إعدادات Android:
 * ### أ- إعدادات Android (الشرح التفصيلي خطوة بخطوة)
 * 
 * هذا الشرح مبني على التوثيق الرسمي لفيسبوك ويشرح لك بالتحديد أين تضع كل شيء.
 * 
 * **1. إضافة حزمة فيسبوك (Facebook SDK) لمشروعك:**
 * 
 *    - **الملف:** افتح الملف الموجود في المسار: `android/app/build.gradle.kts`.
 *    - **المكان:** ابحث عن قسم `dependencies { ... }`.
 *    - **الإضافة:** أضف السطر التالي داخل هذا القسم:
 *      ```groovy
 *      implementation("com.facebook.android:facebook-login:latest.release")
 *      ```
 * 
 * **2. تعديل ملفات الموارد والـ Manifest:**
 * 
 *    - **أولاً: إضافة قيم `strings.xml`:**
 *      - **الغرض:** هذا الملف يحتوي على قيم ثابتة مثل App ID الخاص بفيسبوك.
 *      - **المسار:** اذهب إلى المجلد `android/app/src/main/res/values/`.
 *      - **الإنشاء:** إذا لم تجد ملفاً باسم `strings.xml`، قم بإنشائه.
 *      - **المحتوى:** افتح الملف وأضف الأكواد التالية. ستحتاج للـ `App ID` والـ `Client Token` من لوحة تحكم مطوري فيسبوك (`Settings > Basic` و `Settings > Advanced`).
 *        ```xml
 *        <?xml version="1.0" encoding="utf-8"?>
 *        <resources>
 *           <string name="app_name">App Name</string>
 *            <string name="facebook_app_id">YOUR_FACEBOOK_APP_ID</string>
 *            <string name="fb_login_protocol_scheme">fbYOUR_FACEBOOK_APP_ID</string>
 *            <string name="facebook_client_token">YOUR_FACEBOOK_CLIENT_TOKEN</string>
 *        </resources>
 *        ```
 *      - **مهم:** استبدل `YOUR_FACEBOOK_APP_ID` و `YOUR_FACEBOOK_CLIENT_TOKEN` بالقيم الحقيقية من حسابك.
 * 
 *      كيفية الحصول على هذه القيم بالتفصيل:
 *       1. اذهب إلى https://developers.facebook.com وسجل الدخول.
 *       2. اختر تطبيقك الذي قمت بإنشائه.
 *       3. من القائمة الجانبية اليسرى، اذهب إلى "App Settings" ثم اختر "Basic".
 *       4. ستجد "App ID" في أعلى الصفحة، انسخه وضعه مكان YOUR_FACEBOOK_APP_ID.
 *       5. في نفس الصفحة (Basic)، ستجد "App Secret"، اضغط "Show" لنسخه (قد يطلب كلمة مرور حسابك).
 *       6. للحصول على الـ Client Token: من القائمة الجانبية اختر "Settings" ثم "Advanced".
 *       7. انزل لأسفل حتى تجد قسم "Security"، ستجد هناك حقل "Client Token"، انسخه وضعه مكان YOUR_FACEBOOK_CLIENT_TOKEN.
 * 
 * 
 *    - **ثانياً: تعديل ملف `AndroidManifest.xml`:**
 *      - **الغرض:** هذا هو الملف الرئيسي لتعريف مكونات تطبيق أندرويد وصلاحياته.
 *      - **المسار:** افتح الملف الموجود في `android/app/src/main/AndroidManifest.xml`.
 *      - **التعديلات:**
 * 
 *        - **إضافة `meta-data`:** داخل وسم `<application>`، وقبل وسم الإغلاق `</activity>` الخاص بالـ `MainActivity`، أضف السطرين التاليين:
 *          ```xml
 *          <meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id"/>
 *          <meta-data android:name="com.facebook.sdk.ClientToken" android:value="@string/facebook_client_token"/>
 *          ```
 * 
 *        - **إضافة `activities` فيسبوك:** في نفس المكان (داخل `<application>`)، وبعد وسم الإغلاق `</activity>` الخاص بالـ `MainActivity`، أضف الأكواد التالية:
 *          ```xml
 *          <activity android:name="com.facebook.FacebookActivity"
 *              android:configChanges="keyboard|keyboardHidden|screenLayout|screenSize|orientation"
 *              android:label="@string/app_name" />
 *          <activity
 *              android:name="com.facebook.CustomTabActivity"
 *              android:exported="true">
 *              <intent-filter>
 *                  <action android:name="android.intent.action.VIEW" />
 *                  <category android:name="android.intent.category.DEFAULT" />
 *                  <category android:name="android.intent.category.BROWSABLE" />
 *                  <data android:scheme="@string/fb_protocol_scheme" />
 *              </intent-filter>
 *          </activity>
 *          ```
 * 
 *        - **إضافة صلاحية الإنترنت:** تطبيقك يحتاج للوصول للإنترنت. هذه الصلاحية تضاف **خارج** وسم `<application>` ولكن **داخل** وسم `<manifest>` الرئيسي. أضف السطر التالي مباشرة **قبل** وسم `<application>`:
 *          ```xml
 *          <uses-permission android:name="android.permission.INTERNET"/>
 *          ```
 * 
 * **3. ربط اسم الحزمة (Package Name) والـ Key Hash في منصة فيسبوك:**
 * 
 *    - **الغرض:** هذه الخطوة تتم في لوحة تحكم مطوري فيسبوك (`developers.facebook.com`) لتخبر فيسبوك عن تطبيقك.
 *    - **الذهاب إلى:** `My Apps` -> اختر تطبيقك -> `App Settings` -> `Basic` -> انزل للأسفل واضغط `+ Add Platform` واختر `Android`.
 *    - **اختيار المتجر (App Stores):**
 *    - ستظهر لك قائمة بمتاجر التطبيقات (Google Play, Amazon Appstore, etc.).
 *    - **الخيار الصحيح:** اختر **"Google Play"** فقط، لأنه المتجر الأساسي والرسمي لنظام أندرويد والذي يتم ربطه عادةً مع Firebase وخدمات Google.
 *    - اضغط **"Next"**.
 * 
 *    - **اسم الحزمة (Package Name):**
 *      - **من أين؟** افتح ملف `android/app/build.gradle.kts` وابحث عن `applicationId`. في مشروعك، القيمة هي `com.example.flutter_learning`.
 *      - **ماذا تفعل؟** انسخ هذه القيمة والصقها في حقل `Package Name` في منصة فيسبوك.
 * 
 *    - **اسم الكلاس (Class Name):**
 *      - **ما هو؟** هو اسم الحزمة متبوعاً بـ `.MainActivity`.
 *      - **في حالتك:** سيكون `com.example.flutter_learning.MainActivity`. الصق هذا في حقل `Class Name`.
 * 
 *    - **الحصول على Key Hash (مهم جداً):**
 *      - **الغرض:** هذا الـ Hash يثبت لفيسبوك أن الطلب قادم من تطبيقك الأصلي وليس تطبيقاً مزيفاً.
 *      - **المتطلبات:** ستحتاج لتثبيت `OpenSSL` على جهازك.
 *      - **الخطوات:** افتح نافذة الأوامر (Terminal على Mac/Linux أو Command Prompt/PowerShell على Windows).
 * 
 *      - **على نظام Windows:**
 *      - هنجيب ال sha1 اللي احنا طلعناه قبل كده وموجود في https://console.firebase.google.com/project/fruit-hub-195d3/settings/general/ تحت خالص عند ال SHA certificate fingerprints هنلاقي ال sha1 هناخده كوبيه
 *      - وهنروح علي موقع hex to base64 tomeko من بحث جوجل وهنحط ال sha1 وهنضغط علي convert وهناخد ال Output وهو دا ال Key Hash او
 *
 *      - ستحتاج لمعرفة مسار تثبيت OpenSSL. لنفترض أنه في `C:\Program Files\Git\usr\bin\openssl.exe`.
 *      - إذا لم يكن لديك OpenSSL مثبتًا في مسار محدد، يمكنك استخدام المسار الافتراضي لـ Java (الذي يأتي مع Android Studio) لتوليد المفتاح، أو تحميل النسخة المحمولة من OpenSSL.
 *      - إليك الطريقة باستخدام `keytool` فقط للحصول على الـ SHA1 ثم تحويله يدوياً، أو الأمر المدمج إذا كان OpenSSL متاحاً في الـ Path:
```bash
 *        keytool -exportcert -alias androiddebugkey -keystore "C:\Users\ahhan\.android\debug.keystore" | openssl sha1 -binary | openssl base64
```

```bash
 *        - **ملاحظة لمستخدمي Windows:** إذا ظهر لك خطأ أن 'openssl' غير معروف، يمكنك تحميله من (https://slproweb.com/products/Win32OpenSSL.html) وتثبيته، أو البحث عن ملف `openssl.exe` داخل مجلد تثبيت Git (غالباً في `C:\Program Files\Git\usr\bin\openssl.exe`).
 *        - **ملاحظة لمستخدمي Windows:** بما أنك وجدت `openssl.exe` في مسار تثبيت Git وهو `C:\Program Files\Git\usr\bin\openssl.exe` (وليس في مجلد منفصل باسم openssl-win64)، فسنستخدم هذا المسار مباشرة في الأوامر التالية.
 *        - بدلاً من كتابة `openssl` فقط، سنضع المسار الكامل بين علامتي تنصيص `"C:\Program Files\Git\usr\bin\openssl.exe"`.
 *        - **الأمر الكامل لنظام Windows (باستخدام مسار OpenSSL الخاص بـ Git):**
 *        - **أين تنفذ هذا الأمر؟** افتح الـ Terminal أو Command Prompt وتأكد أنك تقف داخل مجلد المشروع الرئيسي (flutter_learning)، أو يمكنك تنفيذه من أي مكان طالما أن المسارات للملفات (debug.keystore و openssl.exe) صحيحة.
 *
 *        - انسخ الكود التالي والصقه في الـ Command Prompt (cmd):
 *        ```bash
 *        keytool -exportcert -alias androiddebugkey -keystore "C:\Users\ahhan\.android\debug.keystore" | "C:\Program Files\Git\usr\bin\openssl.exe" sha1 -binary | "C:\Program Files\Git\usr\bin\openssl.exe" base64
 *        ```
 *
 *        - **الأمر الكامل لنظام Windows (باستخدام PowerShell):**
 *        - انسخ الكود التالي والصقه في الـ PowerShell:
 *
 *        ```powershell
 *        keytool -exportcert -alias androiddebugkey -keystore "C:\Users\ahhan\.android\debug.keystore" | & "C:\Program Files\Git\usr\bin\openssl.exe" sha1 -binary | & "C:\Program Files\Git\usr\bin\openssl.exe" base64
 *       
 *          - **ملاحظة هامة:** عند ظهور `Enter keystore password:`، اكتب كلمة المرور الافتراضية وهي `android` (لن تظهر الحروف أثناء الكتابة لأسباب أمنية)، ثم اضغط Enter.
 *          - **ملاحظة هامة:** إذا ظهر لك كود يحتوي على علامات استفهام مثل `JhtbPz8/PyIEPz9IP0E/Pz9xGT8NCg==` فهذا يعني غالباً وجود مشكلة في ترميز (Encoding) الأحرف أو أن مسار الـ OpenSSL غير صحيح.
 *          - **الحل:** تأكد من استخدام مسار OpenSSL الخاص بـ Git كما في المثال أعلاه، أو جرب تنفيذ الأمر من داخل `Command Prompt (cmd)` العادي وليس PowerShell، وتأكد من كتابة كلمة المرور `android` بشكل صحيح.
 *
 *          - **ملاحظة إضافية:** إذا ضغطت Enter بعد كتابة `android` ولم يظهر أي مخرج (Output) في السطر التالي، فهذا يعني غالباً أن المسارات التي أدخلتها بها خطأ أو أن الأداة تنتظر أمراً آخر. 
 *          - **تأكد من:** 
 *            1. وجود ملف الـ keystore فعلياً في المسار: `C:\Users\ahhan\.android\debug.keystore`.
 *            2. تأكد من انك قمت بنسخ الأمر كاملاً (من كلمة keytool وحتى base64) كسطر واحد.
 *            3. جرب تشغيل الـ Command Prompt كمسؤول (Run as Administrator).
 *          - **طريقة بديلة للحصول على الـ Key Hash (عن طريق الكود):**
 *            إذا واجهت صعوبة في استخدام سطر الأوامر، يمكنك إضافة هذا الكود مؤقتاً في `MainActivity.kt` أو `MainActivity.java` لطباعة الـ Hash في الـ Logcat عند تشغيل التطبيق:
 *            
 *            ```kotlin
 *            // Kotlin example
            import android.util.Base64
            import android.util.Log
            import java.security.MessageDigest
            
            try {
                val info = packageManager.getPackageInfo("com.example.flutter_learning", android.content.pm.PackageManager.GET_SIGNATURES)
                for (signature in info.signatures) {
                    val md = MessageDigest.getInstance("SHA")
                    md.update(signature.toByteArray())
                    Log.d("KeyHash:", Base64.encodeToString(md.digest(), Base64.DEFAULT))
                }
            } catch (e: Exception) {
                Log.e("KeyHash:", e.toString())
            }
/*
 * بعد إضافة الكود أعلاه في ملف MainActivity.kt:
 * 1. قم بتشغيل التطبيق على هاتف أندرويد حقيقي أو محاكي (Emulator).
 * 2. افتح نافذة الـ Logcat في Android Studio.
 * 3. ابحث في خانة البحث (Filter) عن كلمة "KeyHash:".
 * 4. ستجد الكود المكون من 28 حرفاً مطبوعاً هناك.
 * 5. انسخ هذا الكود وضعه في حقل "Key Hashes" في إعدادات تطبيقك على developers.facebook.com.
 * 6. **هام جداً:** بعد الحصول على الـ Hash، قم بحذف هذا الكود من ملف MainActivity.kt قبل نشر التطبيق.
*/
 *
 * 
 *      ------------------------------------------------------------------------------------
 *       **على نظام Mac/Linux:** ---------------------------------------
 *      ------------------------------------------------------------------------------------
 *        - الأمر أبسط:
 *          ```bash
 *          keytool -exportcert -alias androiddebugkey -keystore "~/.android/debug.keystore" | openssl sha1 -binary | openssl base64
 *          ```
 * 
 *      - **بعد تنفيذ الأمر:**
 *        - سيطلب منك كلمة مرور، وهي `android` بشكل افتراضي. اكتبها واضغط Enter.
 *        - سينتج عن الأمر سلسلة طويلة من الأحرف (28 حرفًا). **انسخها بالكامل** والصقها في حقل `Key Hashes` في منصة فيسبوك.
 *        - اضغط `Save Changes`.
 * 
 * **ملاحظة هامة:** الـ Hash الذي قمت بتوليده هو لنسخة التطوير (Debug). عند رفع التطبيق على المتجر، ستحتاج لتوليد `Release Key Hash` باستخدام مفتاح التوقيع الخاص بنسخة الإنتاج.
 *
 * ### ب- إعدادات iOS:
 * ### ب- إعدادات iOS (الشرح التفصيلي خطوة بخطوة)
 * 
 * **ملاحظة:** إعدادات iOS لا تتطلب `Key Hash` مثل أندرويد، بل تعتمد على `Bundle ID`.
 * 
 * **1. ربط معرف الحزمة (Bundle ID) في منصة فيسبوك:**
 * 
 *    - **الغرض:** هذه الخطوة تخبر فيسبوك عن تطبيق iOS الخاص بك.
 *    - **الذهاب إلى:** `My Apps` -> اختر تطبيقك -> `App Settings` -> `Basic` -> انزل للأسفل واضغط `+ Add Platform` واختر `iOS`.
 * 
 *    - **معرف الحزمة (Bundle ID):**
 *      - **من أين؟** هذا هو المعرف الفريد لتطبيقك على أجهزة أبل.
 *        - **إذا كنت تستخدم جهاز Mac:** افتح مشروعك في Xcode (ملف `ios/Runner.xcworkspace`)، اختر `Runner` من القائمة اليسرى، ثم اذهب إلى تبويب `General`. ستجد `Bundle Identifier` هناك.
 *        - **إذا كنت تستخدم Windows:** يمكنك إيجاده في ملف `ios/Runner.xcodeproj/project.pbxproj`. ابحث عن `PRODUCT_BUNDLE_IDENTIFIER`. في مشروعك، القيمة الافتراضية هي `com.example.flutter_learning`.
 *      - **ماذا تفعل؟** انسخ هذه القيمة والصقها في حقل `Bundle ID` في منصة فيسبوك واضغط `Save Changes`.
 * 
 * **2. تعديل ملف `Info.plist`:**
 * 
 *    - **الغرض:** هذا الملف يحتوي على معلومات التكوين الأساسية لتطبيق iOS، وسنضيف إليه معلومات فيسبوك.
 *    - **المسار:** افتح الملف الموجود في `ios/Runner/Info.plist`.
 *    - **المحتوى:** افتح الملف في محرر الأكواد (مثل VS Code) وأضف الكود التالي مباشرة **قبل** آخر وسم `</dict>` في الملف.
 * 
 *      ```xml
 *      <key>CFBundleURLTypes</key>
 *      <array>
 *        <dict>
 *        <key>CFBundleURLSchemes</key>
 *        <array>
 *          <string>fbYOUR_FACEBOOK_APP_ID</string>
 *        </array>
 *        </dict>
 *      </array>
 *      <key>FacebookAppID</key>
 *      <string>YOUR_FACEBOOK_APP_ID</string>
 *      <key>FacebookClientToken</key>
 *      <string>YOUR_FACEBOOK_CLIENT_TOKEN</string>
 *      <key>FacebookDisplayName</key>
 *      <string>YOUR_APP_NAME</string>
 *      <key>LSApplicationQueriesSchemes</key>
 *      <array>
 *        <string>fbapi</string>
 *        <string>fb-messenger-share-api</string>
 *      </array>
 *      ```
 * 
 *    - **شرح واستبدال القيم:**
 *      - `fbYOUR_FACEBOOK_APP_ID`: استبدل `YOUR_FACEBOOK_APP_ID` بالـ App ID الخاص بك من فيسبوك. هذا يسمح لتطبيق فيسبوك بالعودة إلى تطبيقك بعد تسجيل الدخول.
 *      - `YOUR_FACEBOOK_APP_ID`: استبدلها بالـ App ID مرة أخرى.
 *      - `YOUR_FACEBOOK_CLIENT_TOKEN`: استبدلها بالـ Client Token من `Settings > Advanced` في منصة فيسبوك.
 *      - `YOUR_APP_NAME`: استبدله باسم تطبيقك كما هو معروض للمستخدمين.
 *      - `LSApplicationQueriesSchemes`: هذه الجزئية تسمح لتطبيقك بالتحقق مما إذا كان تطبيق فيسبوك أو ماسنجر مثبتًا على الجهاز لتوفير تجربة تسجيل دخول أفضل (Single Sign On). اتركها كما هي.
 * 
 * **3. (اختياري ولكن موصى به) التعامل مع شفافية تتبع التطبيقات (App Tracking Transparency):**
 * 
 *    - **الغرض:** منذ إصدار iOS 14، تطلب أبل من التطبيقات طلب إذن المستخدم قبل تتبعهم أو الوصول إلى معرّف الإعلانات (IDFA)، والذي تستخدمه حزمة فيسبوك.
 *    - **الخطوة:** في نفس ملف `Info.plist`، أضف المفتاح التالي مع رسالة توضح للمستخدم لماذا تحتاج إلى هذا الإذن.
 *      ```xml
 *      <key>NSUserTrackingUsageDescription</key>
 *      <string>This identifier will be used to deliver personalized ads to you.</string>
 *      ```
 *    - بعد ذلك، ستحتاج إلى طلب الإذن من المستخدم في كود Flutter باستخدام حزمة مثل `app_tracking_transparency`.
 *
 * --------------------------------------------------------------
 * ### ج- إعدادات Web:
 * --------------------------------------------------------------
 * 1.  اضغط "Add Platform" واختر "Website".
 * 2.  أدخل رابط موقعك (مثلاً: `https://your-project-id.web.app`).
 * 3.  اضغط "Save Changes".
 *
 * ------------------------------------------------------------------------------------
 *
 * [4] الخطوة الرابعة: كتابة الكود في Flutter
 * --------------------------------------------------------------------
 *
 * 1.  **إضافة الحزمة:**
 *     ```yaml
 *     dependencies:
 *       flutter_facebook_auth: ^6.0.0 # تأكد من استخدام أحدث إصدار
 *     ```
 *
 * 2.  **مثال الكود:**
 */

/// دالة لتسجيل الدخول باستخدام فيسبوك
/*
Future<UserCredential?> signInWithFacebook() async {
  try {
    // 1. طلب تسجيل الدخول من فيسبوك
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['public_profile', 'email'], // الصلاحيات التي تطلبها
    );

    // 2. التحقق من حالة تسجيل الدخول
    if (result.status == LoginStatus.success) {
      // 3. إذا نجح، احصل على Access Token
      final AccessToken accessToken = result.accessToken!;

      // 4. إنشاء بيانات اعتماد (Credential) لـ Firebase
      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.tokenString);

      // 5. تسجيل الدخول في Firebase باستخدام بيانات الاعتماد
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      print("تم تسجيل الدخول بنجاح عبر فيسبوك: ${userCredential.user?.displayName}");
      return userCredential;
    } else {
      // إذا ألغى المستخدم العملية أو فشلت
      print('فشل تسجيل الدخول بفيسبوك: ${result.status}');
      print('الرسالة: ${result.message}');
      return null;
    }
  } on FirebaseAuthException catch (e) {
    print("خطأ Firebase Auth: ${e.message}");
    return null;
  } catch (e) {
    print("خطأ غير متوقع: $e");
    return null;
  }
}

/// دالة لتسجيل الخروج
Future<void> signOutFromFacebook() async {
  // تسجيل الخروج من فيسبوك
  await FacebookAuth.instance.logOut();
  // تسجيل الخروج من Firebase
  await FirebaseAuth.instance.signOut();
  print("تم تسجيل الخروج بنجاح.");
}


 * ====================================================================================
 * نصائح احترافية:
 * ====================================================================================
 * 1.  **Key Hash للإنتاج (Release):** الـ Key Hash الذي قمنا بتوليده هو لنسخة الـ Debug. عند نشر التطبيق، يجب عليك توليد Key Hash جديد باستخدام مفتاح التوقيع الخاص بنسخة الإنتاج (Release Keystore) وإضافته في منصة فيسبوك.
 * 2.  **مراجعة التطبيق (App Review):** فيسبوك يتطلب مراجعة التطبيق إذا كنت تطلب صلاحيات تتجاوز `public_profile` و `email`.
 * 3.  **الوضع المباشر (Live Mode):** بعد الانتهاء من الاختبار، لا تنسَ تحويل تطبيقك على منصة فيسبوك من "In development" إلى "Live" من لوحة التحكم.
 * ====================================================================================
 */
