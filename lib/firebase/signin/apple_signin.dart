// import 'dart:convert';
// import 'dart:math';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/**
 * ====================================================================================
 * 🚀 الدليل الاحترافي: ربط تسجيل الدخول بأبل (Sign in with Apple) مع Flutter
 * ====================================================================================
 *
 * هذا الدليل يشرح بالتفصيل كيفية تفعيل المصادقة عبر أبل، مع التركيز على
 * المتطلبات الخاصة بمنصة أبل والخطوات اللازمة في Flutter.
 *
 * **متطلب أساسي:** هذه الميزة تتطلب اشتراكاً مدفوعاً في برنامج مطوري أبل (Apple Developer Program).
 *
 * ------------------------------------------------------------------------------------
 *
 * [1] الخطوة الأولى: إعداد التطبيق على Apple Developer Portal
 * --------------------------------------------------------------------
 *
 * 1.  اذهب إلى `developer.apple.com` وسجل الدخول بحساب المطورين الخاص بك.
 * 2.  اذهب إلى `Certificates, Identifiers & Profiles`.
 * 3.  من القائمة اليسرى، اختر `Identifiers`.
 * 4.  ابحث عن معرف التطبيق (App ID) الخاص بك واضغط عليه.
 * 5.  انزل للأسفل في قائمة `Capabilities` وتأكد من تفعيل `Sign in with Apple`. اضغط "Save".
 *
 * **(إذا كنت ستدعم Android/Web، أكمل هذه الخطوات الإضافية):**
 * 6.  في نفس قسم `Identifiers`، اختر `Services IDs` من القائمة المنسدلة في الأعلى.
 * 7.  اضغط على زر `+` لإنشاء Service ID جديد.
 * 8.  أدخل وصفاً ومعرفاً (Identifier)، مثلاً: `com.yourcompany.yourapp.signin`.
 * 9.  اضغط `Continue` ثم `Register`.
 * 10. اضغط على الـ Service ID الذي أنشأته للتو، وقم بتفعيل `Sign in with Apple` ثم اضغط `Configure`.
 * 11. في `Domains and Subdomains`، أضف نطاق مشروعك على Firebase (مثل `your-project-id.firebaseapp.com`).
 * 12. في `Return URLs`، أضف رابط الاستجابة من Firebase (نفس الرابط الذي استخدمناه مع فيسبوك: `https://your-project-id.firebaseapp.com/__/auth/handler`).
 * 13. اضغط `Save`.
 *
 * ------------------------------------------------------------------------------------
 *
 * [2] الخطوة الثانية: تفعيل أبل في Firebase Console
 * --------------------------------------------------------------------
 *
 * 1.  اذهب إلى مشروعك في Firebase Console.
 * 2.  اختر `Authentication > Sign-in method`.
 * 3.  اضغط "Add new provider" واختر "Apple".
 * 4.  قم بتفعيل (Enable) الخدمة.
 * 5.  **للويب والأندرويد:** في قسم `OAuth code flow configuration`، ستحتاج إلى ملء `Services ID`, `Team ID`, `Key ID`, والمفتاح الخاص (`.p8`).
 *     - `Team ID`: يمكنك إيجاده في أعلى يمين صفحة حساب مطوري أبل.
 *     - `Key ID` و `Private Key (.p8)`: يمكنك إنشاؤهما من `Certificates, Identifiers & Profiles > Keys`. أنشئ مفتاحاً جديداً وقم بتفعيل "Sign in with Apple"، ثم قم بتحميل ملف `.p8` (احتفظ به جيداً، لا يمكنك تحميله مرة أخرى!).
 * 6.  اضغط "Save".
 *
 * ------------------------------------------------------------------------------------
 *
 * [3] الخطوة الثالثة: إعداد Xcode (لـ iOS و macOS)
 * --------------------------------------------------------------------
 *
 * هذه هي أسهل خطوة وأهمها للمنصات الأصلية.
 * 1.  افتح مشروعك في Xcode (`ios/Runner.xcworkspace`).
 * 2.  اختر `Runner` من القائمة اليسرى، ثم اذهب إلى تبويب `Signing & Capabilities`.
 * 3.  اضغط على `+ Capability`.
 * 4.  ابحث عن `Sign in with Apple` وقم بإضافتها.
 *
 * هذا كل شيء! Xcode سيقوم بالباقي تلقائياً.
 *
 * **💡 ملاحظة هامة لمستخدمي ويندوز (بدون Xcode):**
 * على عكس تعديل ملف `Info.plist` الذي يمكن إجراؤه يدوياً، فإن إضافة "Capability" (صلاحية) مثل "Sign in with Apple" هي عملية أكثر تعقيداً.
 *
 * - **لماذا لا يمكن تعديلها يدوياً بسهولة؟**
 *   - هذه العملية لا تقوم فقط بتعديل ملف واحد، بل تقوم بتغيير ملفات إعدادات المشروع الأساسية (`project.pbxproj`) وإنشاء ملف صلاحيات خاص (`Runner.entitlements`).
 *   - التعديل اليدوي لملف `project.pbxproj` خطير جداً ويمكن أن يتسبب في تلف مشروع iOS بالكامل ويمنع بناء التطبيق.
 *
 * - **ما هو الحل؟**
 *   هذه الخطوة هي من متطلبات نظام أبل البيئي ولا يمكن تجاوزها. لتنفيذها، ستحتاج إلى أحد الخيارين التاليين:
 *   1.  **استخدام جهاز macOS:** الوصول إلى جهاز Mac لتشغيل Xcode وإضافة الصلاحية. هذا هو الحل الرسمي والمباشر.
 *   2.  **استخدام خدمات البناء السحابي (Cloud CI/CD):** عند تجهيز تطبيقك للنشر، ستحتاج على الأرجح لاستخدام خدمة مثل Codemagic أو Bitrise. هذه الخدمات تتيح لك تفعيل صلاحية "Sign in with Apple" من خلال إعداداتها على الويب، وهي ستقوم بالخطوات اللازمة بالنيابة عنك أثناء عملية بناء التطبيق.
 *
 * **الخلاصة:** لا توجد طريقة آمنة ومباشرة لإضافة هذه الصلاحية من نظام ويندوز فقط. يجب أن تتم هذه الخطوة عبر Xcode أو خدمة بناء سحابية.
 *
 * ------------------------------------------------------------------------------------
 *
 * [4] الخطوة الرابعة: كتابة الكود في Flutter
 * --------------------------------------------------------------------
 *
 * 1.  **إضافة الحزمة:**
 *     ```yaml
 *     dependencies:
 *       sign_in_with_apple: ^5.0.0 # تأكد من استخدام أحدث إصدار
 *       crypto: ^3.0.3 # لتوليد الـ nonce
 *     ```
 *
 * 2.  **مثال الكود:**
 */

/// دالة لتسجيل الدخول باستخدام أبل
/*
Future<UserCredential?> signInWithApple() async {
  // الـ Nonce هو رقم عشوائي يستخدم مرة واحدة لمنع هجمات إعادة التشغيل (Replay Attacks).
  // يجب أن يكون فريداً لكل طلب تسجيل دخول.
  final rawNonce = _generateNonce();
  final nonce = _sha256ofString(rawNonce);

  try {
    // 1. طلب بيانات الاعتماد من أبل
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      // مهم جداً للويب والأندرويد
      webAuthenticationOptions: WebAuthenticationOptions(
        clientId: 'com.yourcompany.yourapp.signin', // الـ Service ID الذي أنشأته
        redirectUri: Uri.parse(
          'https://your-project-id.firebaseapp.com/__/auth/handler',
        ),
      ),
      nonce: nonce,
    );

    // 2. إنشاء بيانات اعتماد لـ Firebase باستخدام `idToken` و `rawNonce`
    final oAuthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // 3. تسجيل الدخول في Firebase
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(oAuthCredential);

    // **ملاحظة هامة:** اسم المستخدم والبريد الإلكتروني يتم إرسالهما من أبل
    // **فقط في المرة الأولى** التي يسجل فيها المستخدم دخوله. يجب عليك حفظهما
    // في قاعدة بياناتك (مثل Firestore) في هذه المرة.
    if (userCredential.additionalUserInfo?.isNewUser ?? false) {
      final displayName =
          '${appleCredential.givenName} ${appleCredential.familyName}';
      final email = appleCredential.email;
      print("مستخدم جديد! الاسم: $displayName, البريد: $email");
      // هنا يمكنك حفظ الاسم والبريد في Firestore
    }

    print("تم تسجيل الدخول بنجاح عبر أبل: ${userCredential.user?.uid}");
    return userCredential;
  } on FirebaseAuthException catch (e) {
    print("خطأ Firebase Auth: ${e.message}");
    return null;
  } catch (e) {
    print("خطأ غير متوقع: $e");
    return null;
  }
}

/// دالة مساعدة لتوليد Nonce عشوائي
String _generateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

/// دالة مساعدة لعمل تشفير SHA-256 للـ Nonce
String _sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}


 * ====================================================================================
 * نصائح احترافية:
 * ====================================================================================
 * 1.  **البيانات لأول مرة فقط:** تذكر أن أبل ترسل اسم المستخدم والبريد الإلكتروني مرة واحدة فقط. إذا حذف المستخدم التطبيق وأعاده، لن تحصل على هذه البيانات مرة أخرى. الحل هو تخزينها في قاعدة بياناتك فوراً.
 * 2.  **البريد الإلكتروني المخفي (Private Relay):** قد يختار المستخدم إخفاء بريده الإلكتروني. في هذه الحالة، ستنشئ أبل بريداً عشوائياً (مثل `xxxxx@privaterelay.appleid.com`) يقوم بإعادة توجيه الرسائل إلى بريده الحقيقي. تعامل معه كأي بريد إلكتروني عادي.
 * 3.  **الاختبار على أجهزة حقيقية:** تسجيل الدخول بأبل لا يعمل على محاكيات iOS (Simulators) قبل إصدار iOS 13. الأفضل دائماً هو الاختبار على جهاز حقيقي.
 * ====================================================================================
 */
