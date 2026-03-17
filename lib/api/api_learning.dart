// ====================== HTTP & API =======================
/*
// وعلي استعمالاته API هنتعرف علي مفهوم ال
// API ( Application Progarmming Interface ) يعني "واجهة برمجية للتواصل مع البرامج الأخرى" <== يعني واجهة التطبيق البرمجية
// =========== الملخص ============
// API ==> هو طريقة التواصل مع سيرفر أو خدمة للحصول على بيانات
// Request ==> الطلب اللي بتبعته للسيرفر
// Response ==> (غالبًا JSON) الرد اللي السيرفر بيرجعه
// http package	==> API مكتبة في فلاتر عشان تبعت وتستقبل
// Dio package	==> API مكتبة في فلاتر عشان تبعت وتستقبل
// =========== الملخص ============
// 🎯 الفكرة ببساطة:
// تخيل إن فيه مطعم:
// أنت (التطبيق بتاعك) عايز تطلب أكل.
// المطبخ (الخادم/السيرفر) هو اللي بيحضّر الأكل.
// لكنك ما بتدخلش المطبخ بنفسك
// بياخد طلبك زي مثلا رقم الفيديو و اسم المستخدم ويروح يجيبلك الاكل اللي هو البيانات من المطبخ (API ال) بدل كده فيه نادل
// بيكون غالبًا Api في فلاتر الـ  🧠 :
// موقع على الإنترنت بيرجع بيانات، زي:
// 🔢 أرقام
// 📄 نصوص
// 📷 صور
// ✅ بيانات مستخدمين، بوستات، فيديوهات، إلخ...
// (response) وتستقبل رد (request) علشان تبعت طلب http , dio وإنت بتستخدم مكتبة زي
// 🎁 مثال بسيط (من الحياة الواقعية لتطبيقات):
// سيناريو: تطبيق بيعرض الطقس
// 1- لموقع الطقس زي كده API التطبيق بيبعت طلب:
// https://api.weatherapi.com/v1/current.json?q=Cairo
// عندنا في ال api حاجة اسمها endpoints ودي اللي هي ال parameters اللي بتتضاف في اخر اللينك زي كده ?q=Cairo اللي بتكون بعد علامة الاستفهام والقيمة بتاعتها اسمها query
// parameter وبيكون ليها دور كبير في تحديد نوع الداتا اللي انا عايزها من ال API مثل ?q وال query بتاعتها Cairo في المثال دا اللي بيحددلي انا عايز داتا عن مدينة القاهرة 
// عشان اضيف parameters اكتر في اللينك بتاعي بستخدم علامة & زي كده &lang=ar عشان اضيف parameter تاني اسمه lang وال query بتاعتها ar عشان احدد اللغة اللي انا عايزها
// key=YOUR_API_KEY ودا parameter تالت اسمه key وال query بتاعتها YOUR_API_KEY ودي بتكون مفتاح ال API الخاص بيا عشان اقدر استخدم ال API
// 2- JSON السيرفر بيرجع لك نتيجة بصيغة :
// {
// "location": {
// "name": "Cairo"
// },
// "current": {
// "temp_c": 32.0
// }
// }
// 3- التطبيق يعرض: القاهرة: 32 درجة مئوية ☀️

// ===================== API طريقة استخدام ال ==================== start
// في فلاتر كمبتدئ API إزاي تستخدم 🛠️ :
// 1- زي كده pubspec.yaml في ملف http تضيف مكتبة
// cupertino_icons: ^1.0.8
// http: ^1.2.0
// flutter pub add http : Command-line أو عن طريق ال

// 2- تكتب كود بسيط:
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void getWeather() async {
//   final url = Uri.parse("https://api.weatherapi.com/v1/current.json?q=Cairo&key=API_KEY");

//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     print("درجة الحرارة: ${data['current']['temp_c']} مئوية");
//   } else {
//     print("حصل خطأ: ${response.statusCode}");
//   }
// }
// ===================== API طريقة استخدام ال ==================== end

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// flutter pub add http ==> http لاضافة مكتبة ال
// post , get مشهورين كتير وهما ال methods فيها 2 Http مكتبة ال
// get ==> ومفيهاش تشفير يعني البيانات بتكون ظاهرة security عادة بيتم استعمالها لجلب الداتا لاٍن مفيهاش
// post ==> لاضافة وعمل تعديل علي الداتا اثناء عمل طلب بسبب اٍن البيانات بتكون مشفرة ومخفية
// ودي مش استخدامات مخصصة لواحدة فيهم بس لان الاتنين بيعملوا نفس الحاجات ولكن كل واحدة متميزة في حاجة عن التانية
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List data =
      []; // بعد فك تشفيرها عشان يتم عرضها API اللي هتتحقظ فيها الداتا بتاعت ال list ال
  bool loading =
      false; // المتغير اللي هنستخدمه عشان نعمل عملية التحميل اللي بتظهرلي ان الداتا بيتم تحميلها عند الضغك علي الزرار بدل ما العملية بتتم بشكل آني
  
  //=============== طريقة اخري افضل بدل الزرار ============== start
  bool loading = true // لان عملية جلب الداتا هتتم مباشرة بدون الحاجة للضغط علي زرار
  List data =[];
  getData() async {
  var response = await get(Uri.parse("https://jsonplaceholder.typecode.com/posts"),);
  var responsebody = jsonDecode(response.body,); // [{}] كده هيشوف الداتا ك
  data.addAll(responsebody);
  loading = false;
  setState(() {});
  }
  @override
  initState(){
  getData();
  super.initState();
  }
  // ودي كانت الطريقة الافضل بدل الزرار لانها وفرت معايا في الكود
  //=============== طريقة اخري افضل بدل الزرار ============== end

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("HTTP & API"), actions: []),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60),
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () async {
                  // ============== بتاعت جلب الداتا اللي زي جاري التحميل كدا loading عملية ال ================== start
                  // بتتم قبل عملية جلب الداتا بمجرد الضغط علي الزرار loading عملية ال
                  loading = true;
                  setState(() {
                    // loading = true عشان عملنا تعديل لل ui لل refresh عملناها عشان تعملي
                  });
                  // false وبعد ميجيب الداتا هنرجع قيمة المتغير تاني ل
                  // ============== بتاعت جلب الداتا اللي زي جاري التحميل كدا loading عملية ال ================== end

                  // Http الخاصة ب get هنستخدم خاصية ال
                  // get(Uri.parse("web link")); ==> async,await يعني بتحتاج وقت لاتمام العملية فلازم نستعمل معاها Future من نوع get
                  // json placeholder api وانا معنديش ولا موقع اعرف اتصل بيه واخد منه داتا فعشان نعمل دا هنخش علي موقع اسمه API طب هنختبر ال
                  // json placeholder api ==> API تجريبي نقدر من خلاله نختبر موضوع ال API بيدينا
                  // posts بعد لما نخش عليه هناخد مثلا مجموعة من ال
                  // map وداخلها list عشان اتلقاها ك json decode فلازم افك التشفير من خلال ال json ولكن مش شرط لانه ممكن يكون اي حاجة ثم ان التطبيق هيتلقاها ك map وجواها list [{}] بيكون عبارة عن API و ال
                  // dart بتفهمها لغة ال [{}] <= map وداخلها list الي json اللي هتفك التشفير وتحوله من jsonDecode اسمها function فانا هعمل json يعني هيتلقاها ك
                  // get(Uri.parse("")); جوه ال https://jsonplaceholder.typecode.com/posts ف اللي هنعمله هو ان احنا هنضيف لينك الصفحة اللي اسمها

                  // عشان عملية الاتصال بالسيرفر بتستغرق وقت async,await عملنا
                  // فكل دا بيستغرق وقت ممكن يصل لثانية او نصف ثانية او ثانيتين في حال كانت العملية معقدة او جودة السيرفر سيئة او اتصال الانترنت عندك سيئ response ويرجعلي النتايج دي من خلال ال API والسيرفر يقوم بمعالجة هذه النتائج من خلال ال request يعني لما بتصل بالسيرفر وببعتله
                  var response = await get(
                    Uri.parse("https://jsonplaceholder.typecode.com/posts"),
                  );
                  // print(response); ==> output: Instance of "Response" ==> بمعني اعرض محتوياته print(response.body) وعشان استقبل الداتا دي فلازم اعمل data وفيه class يعني model بمعني
                  // print(response.body); // ودي تعتبر مشكلة "[{"name":"ahmed"}]" كاٍن العناصر موجودة جوه "" زي مثلا [{list of maps}] وليس string لعرض محتويات الصفحة ولكنه شايفها ك
                  // jsonDecode( map جواها list الحاجة اللي هنفك تشفيرها او اللي هنخلي المشروع يشوفها ك) عشان نحل المشكلة دي هستعمل :
                  // jsonDecode(String source)
                  var responsebody = jsonDecode(
                    response.body,
                  ); // [{}] كده هيشوف الداتا ك
                  // print(responsebody); // هيطبع الداتا كلها
                  // print(responsebody[0]); // الاولي في الداتا بتاعت الموقع map هيطبع العنصر الاول اللي هو ال
                  // print(responsebody[0]['title']); // الاولي map بتاعت ال title هيعرض ال
                  // print(responsebody[0]['id']); // list الاولي اللي هي العنصر الاول بال map بتاعت ال id هيعرض ال
                  // print(responsebody[1]['id']); // list الثانية اللي هي العنصر الثاني بال map بتاعت ال id هيعرض ال

                  // ============== عرض النتائج داخل التطبيق ================ start
                  // اللي فات دا كان قهم لآلية الاتصال وطباعة النتائج بس
                  // داخل تطبيق فلاتر ؟؟ API طب ازاي نعرض النتائج الموجودة في صفحة ال
                  // responsebody عشان تحصل علي كل محتويات ال list فهنروح نعمل responsebody طالما نقدر نستقبلها عن طريق ال
                  data.addAll(responsebody);
                  loading = false; // false بعد جلب الداتا رجعنا قيمته ل
                  // بتخضع لعملية التعديل يعني سواء كتبنا الحاجات دي فيها او قبلها نفس الشيئ setState اي حاجة بتنكتب قبل ال
                  setState(() {
                    // ui لل refresh وظيفتها انها تعمل
                    // ui لان حصل تغيير في ال setState تلقائيا يعني حصل تغيير فلابد من استعمال ال ui هنستعملها عشان بعد الضغط علي الزرار هيستغرق وقت لجلب الداتا وبعد ميجيبها بيتم التعديل علي ال
                  });
                },
                child: Text('Http Request'),
              ),
            ),
            // واللي هنعبر بيه عن عملية التحميل عن طريق انشاء مؤشر loading هنا هنستخدم المتغير اللي عملناه اللي هو
            // CircularProgressIndicator ==> دا المؤشر اللي بفهم منه ان فيه عملية تحميل بتحصل
            // if(loading) Center(child: CircularProgressIndicator(),), ==> دا صح برده
            if (loading==true) Center(child: CircularProgressIndicator(),),
            ...List.generate(
              data.length,
              (index) => Card(
                child: ListTile(
                  title: Text("${data[index]['title']}"),
                  subtitle: Text("${data[index]['body']}"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
// ====================== FutureBuilder =======================
/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List> getData() async {
    var response = await get(
      Uri.parse("https://jsonplaceholder.typecode.com/posts"),
    );
    List responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('FutureBuilder')),
        body: FutureBuilder<List>(
          // <List> انا حددتله نوع الداتا اللي هيستقبلها
          // future : Future بنكتب جواها الحاجة اللي بتتطلب وقت او مدة عشان تتم بس لازم تكون من نوع
          // snapshot : لان دي القيمة اللي اتخزنت فيها responsebody اللي هي في المثال اللي عندنا بتساوي snapshot.data في future للحاجة اللي في ال return بتخزن القيمة الراجعة يعني اللي اتعملها
          future: getData(),
          builder: (context, snapshot) {
            // snapshot.connectionState ==> بمعني حالة الاتصال
            // ConnectionState.waiting ==> waiting ودي اسمها فترة ال resoponse واستقبال ال request بمعني بيتم الاتصال اللي هي فترة ارسال ال
            if (snapshot.connectionState == ConnectionState.waiting) {
              // بمعني لو حالة الاتصال هي قيد الانتظار او بمعني اخر بيتم الاتصال والاتنين واحد
              return Center(child: CircularProgressIndicator());
              // اظهرلي ايقونة جاري الاتصال
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('ERROR');
                // ممكن يكون غلط في اللينك او اي حاجة ERROR ال
              }
              // ممكن نكتب كل الاكواد اللي تحت هنا برده ودا في حالة لو تم الاتصال
              return Text("");
            }
            return ListView.builder(
              itemCount: snapshot
                  .data!
                  .length, // list بمعني انا عايز الداتا اللي بداخل هذا المتغير اللي هي ال
              itemBuilder: (context, index) => ListTile(
                title: Text("${snapshot.data![index]['title']}"),
                subtitle: Text("${snapshot.data![index]['body']}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
*/
// ====================== API Class =======================