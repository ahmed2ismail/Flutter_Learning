/*

### English Introduction

**What is Firebase?**

Firebase is a comprehensive app development platform, backed by Google, that helps developers build, improve, and grow their apps. It's often referred to as a "Backend-as-a-Service" (BaaS) because it provides developers with a variety of tools and services to manage the backend infrastructure. This allows them to focus on creating a great user experience on the frontend without worrying about server management.

**Key Features:**

*   **Authentication:** Easily manage user sign-up and sign-in using various providers like email/password, Google, Facebook, and more.
*   **Databases:** Offers two powerful NoSQL database solutions:
    *   **Cloud Firestore:** A flexible, scalable database that keeps your data in sync across client apps through realtime listeners.
    *   **Realtime Database:** The original Firebase database, providing low-latency data synchronization for realtime applications.
*   **Cloud Storage:** Store and manage user-generated content like photos and videos.
*   **Hosting:** Fast and secure hosting for your web apps, static content, and microservices.
*   **Cloud Functions:** Run backend code in response to events without managing servers.
*   **Cloud Messaging (FCM):** Send push notifications to engage with your users.

The combination of Flutter and Firebase is extremely powerful, as it allows for the rapid development of high-quality, scalable, and feature-rich cross-platform applications.

---

### مقدمة باللغة العربية

**ما هو Firebase؟**

Firebase هي منصة شاملة لتطوير التطبيقات، مدعومة من Google، تساعد المطورين على بناء تطبيقاتهم وتحسينها وتنميتها. يشار إليها غالبًا باسم "الواجهة الخلفية كخدمة" (BaaS) لأنها توفر للمطورين مجموعة متنوعة من الأدوات والخدمات لإدارة البنية التحتية الخلفية. هذا يسمح لهم بالتركيز على إنشاء تجربة مستخدم رائعة في الواجهة الأمامية دون القلق بشأن إدارة الخوادم.

**أهم الميزات:**

*   **المصادقة (Authentication):** إدارة عمليات تسجيل دخول وإنشاء حسابات المستخدمين بسهولة باستخدام طرق متعددة مثل البريد الإلكتر الإلكتروني/كلمة المرور، وحسابات Google و Facebook وغيرها.
*   **قواعد البيانات (Databases):** تقدم حلين قويين لقواعد بيانات NoSQL:
    *   **Cloud Firestore:** قاعدة بيانات مرنة وقابلة للتطوير، تحافظ على مزامنة بياناتك عبر تطبيقات العملاء من خلال المستمعين في الوقت الفعلي (realtime listeners).
    *   **Realtime Database:** قاعدة بيانات Firebase الأصلية، توفر مزامنة بيانات بزمن وصول منخفض للتطبيقات التي تتطلب تفاعلًا فوريًا.
*   **التخزين السحابي (Cloud Storage):** لتخزين وإدارة المحتوى الذي ينشئه المستخدمون مثل الصور ومقاطع الفيديو.
*   **الاستضافة (Hosting):** استضافة سريعة وآمنة لتطبيقات الويب والمحتوى الثابت والخدمات المصغرة.
*   **الدوال السحابية (Cloud Functions):** تشغيل كود الواجهة الخلفية استجابةً للأحداث دون الحاجة لإدارة خوادم.
*   **الرسائل السحابية (FCM):** إرسال إشعارات (Push Notifications) للتفاعل مع المستخدمين.
يعتبر الجمع بين Flutter و Firebase قويًا للغاية، حيث يتيح التطوير السريع لتطبيقات عالية الجودة وقابلة للتطوير وغنية بالميزات تعمل على مختلف المنصات.

----------------------------------------------------------------------------------------------
:::::::::::::::::::::::::: خطوات اضافة ال firebase للمشروع بتاعي ::::::::::::::::::::::::::::::::
----------------------------------------------------------------------------------------------
--- initialize firebase ---

1- هنضيف مكتية firebase_core للتطبيق عن طريق flutter pub add firebase_core
2- firebase cli دا بينزل مرة واحدة فقط ومش بيحصل تاني
بعد تنزيل firebase cli هنستخدام امر firebase login ولو كنت مسجل هنكتب امر firebase login --reauth عشان اتاكد ان انا عامل عملية Authentication بشكل صحيح
3-  هنفتح ال command line ونكتب dart pub global activate flutterfire_cli وممكن يطلب مننا نثبت ال path في ال environment variables للجهاز
4- هنكتب امر ال Firebase.initializeApp في التطبيق عندنا بس عشان يتفعل لازم يبقي عندنا ملف firebase_options.dart ودا ملف بيتعمله generate بشكل تلقائي يعني مش احنا اللي بنكتبه وعشان نعمله بنكتب امر flutterfire configure في ال root for my app يعني جوه ال terminal للتطبيق
flutterfire configure دا بي fetch كل المشاريع اللي انا عاملها علي ال firebase وهختار من الخيارات اللي هو هيجبهالي <create a project> ولكن دي مش افضل طريقة
افضل طريقة هي اني اروح علي موقع ال firebase من بحث جوجل 'console.firebase.google.com/u/0' واول مدخل هلاقي كل المشاريع اللي انا عاملها مع امكانية add project
هختار add project وهكتب اسم المشروع ومينفعش يبقي فيه underscore _ لازم تبقي dash - زي 'chat-app' وبعدين continue وبعدين هختار default account for firebase وبعدين create project
وكده لما انشات المشروع هرجع للمشروع علي vs code وهرن نفس الكود flutterfire configure وهختار المشروع اللي انا انشاته مع العلم انه هيكون مكتوب بالطريقة دي 'project id(project name)' زي كده 'chat-app-d17c9(chat-app)' وبعد مختاره هيسالني ويقولي تختار انهي platform تعملها setup وايا كان اللي هختارها هو هيعمل setup ليهم كلهم وهيتضيف ال firebase ليهم واحدة ورا واحدة
اثناء عمل ال setup لل ios هو هيطلب من حاجة اسمها bundle id وهنجيبها بنفسنا بس هو بيجيبها لوحده في ال android اما في ال ios احنا اللي هنجيبها
كل تطبيق بيبقي ليه id مميز خاص بيه عشان لما يجي يترفع علي ال store وبيكون كلآتي 'com.domain name بتاعك.appname' زي كده 'com.ahmed.com.chat-app' او 'com.google.chat-app' دا دومين بتاع جوجل مثلا
في الاندرويد احنا عندنا ملفين مهمين اوي وهما -android>build.gradle و -android>app>build.gradle
-android>app>build.gradle : هنلاقي جواه default config{وفيها ال application id بتاع التطبيق وهو بيتضاف تلقائي } اما في حالة ال ios انا اللي هضيفه
طريقة اضافة ال id لل ios : ios folder>وبنفتحه جوه ال xcode وبعد كده بنروح علي خانة اسمها runner وبعد كده بنلاقي ال bundle identifire بس لازم يبقي عندنا ال xcode عشان نقدر نفتحتها يعني لازم يكون عندنا جهاز macos بس مش ضروري نروح نجيبها طالما مش هنغير ال id اللي في الاندرويد مثلا
بس احنا نقدر نخمن ال id بتاع ال ios وهو : com.example.chatApp ==> بيشيل ال dash - وبيخلي اول حرف من الكلمة التانية كابيتال
بعد منخلص هنروح علي الموقع بتاعنا بتاع ال firebase وهنخش علي المشروع اللي عملناه وهنخش علي ال setting وهننزل تحت خالص هنلاقي ان هو عمل setup للمنصات بنجاح
وبعدين بعد متم توليد ملف ال firebase_options هنعمل في void main دا
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChatApp());
}
--- وكدا عملنا initialize لل Firebase ---
وكده نقدر نعمل Authentication او اي عملية احنا عايزنها
###
For overview & learn read flutterfire documentation on google ==> https://firebase.flutter.dev/docs/overview
install flutter firebase backage write in terminal ==> flutter pub add firebase_core , https://pub.dev/packages/firebase_core
read & learn about Firebase CLI (command line interface) documentation ==> https://firebase.google.com/docs/cli , https://firebase.flutter.dev/docs/cli/

bunndle identifire ما هو وال id الخاص بالتطبيق
1- flutterfire configure ==> To generate firebase_options.dart
2- Initialization :
-- lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

Add Firebase Authentication to your app:
1- flutter pub add firebase_auth
2- 
*/