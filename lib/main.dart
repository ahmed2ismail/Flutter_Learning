/*
import 'package:flutter/material.dart';
void main() {
  // runApp ==> widget بتاعي وبتقبل application بتقوم بتشغيل ال built-in function دي
  runApp(
    MyApp() // ==> الاسم الافتراضي للبرنامج بتاعي وانا اللي بحدده
  );
}

// capital لازم يكون widget و أول حرف في تسمية أي widget الصفحة و كل جزء من الصفحة هو عبارة عن
// stateful widget , stateless widget <== widget عندي نوعين من ال flutter في
// لما يكون فيه تفاعل بالصفحة stateful widget بنستعمل ال

// ================================ كيفية بناء الصفحة ===============================

class MyApp extends StatelessWidget {
  @override
  // build ==> widget او بترجع widget بترجعلي من نوع function عبارة عن
  Widget build(BuildContext context) {
    // StatelessWidget اٍجبارية لازم انفذها وأنشاها عند اٍنشاء اي method دي build ال
    // وغيرها title لان هي اللي بتنظم المشروع اللي عندي من حيث مثلا منين يبدأ وايه هو ال MaterialApp أول صفحة في التطبيق لازم لازم تكون
    return MaterialApp(
      // Text تانية كتير زي ال widgets و وبتظهر اول لما التطبيق يشتغل يعني هي اول صفحة و نقدر نعمل جواها widget وهي عبارة عن home هي ال MaterialApp داخل ال property أهم خاصية
      // home: Text("ahmed hani ismail") ==> هيظهر كشاشة سواء
      // جواها Text widget اللي ممكن اكتب ال body جاهزة بيساعدني علي تقسيم الصفحة وموجود جواها ال widget ودي عبارة عن scaffold والافضل هي
      home:Scaffold(
        // body: Text("ahmed hani ismail") //==> appBar ولكنه هيداري علي الساعة اللي في البار العلوية في التليفون والحل هي ال Scaffold() هيظهر جوه صفحة بيضاء لانه انكتب داخل ال
        // appBar: AppBar(title: Text("ahmed hani ismail")), // appBar ==> An app bar to display at the top of the scaffold البار العلوية في البرنامج بتاعي ==> title اسمها widget وبتاخد
        
        appBar: AppBar(title: Text("Title")),
        // ========= Text Widget =========
        // Text ألاولي واللي هي ال Widget هنتعرف علي خواص ال
        // TextStyle الخاص بيه اللي بتاخد style وال String بتقبل Text ال
        body: Text(
          "ahmed hani ismail",
          textAlign:TextAlign.center, // المحاذاة
          style: TextStyle(
          // هنديها مثلا لون و حجم خط وسُمك للخط وخلفية
          // color: Color(0xff3498db), // color: Color(0xffكود اللون) 
          // أو
          // color: Colors.green, // لاضافة لون : color: Colors.اللون
          // أو
          // color: Colors.green[700], // لتحديد درجة اللون ايضا
          color: const Color.fromARGB(255, 43, 148, 48),
          fontSize: 20.2, // حجم خط : fontsize: double size
          fontWeight: FontWeight.bold, // سُمك الخط : fontweight:FontWeight.السُمك
          backgroundColor: Colors.red // لاضافة خلفية
          // Text Widget ودول اهم الخواص ل
        )),
      ) 
    );
  }
}
*/

/*
// الترتيب ==> MaterialApp (home:scaffold(appBar:AppBar , body:Container(child , decoration)))
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Title')),
        body: Text(
          'ahmed hani ismail',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 20.3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
} */
// ================================ Container Widget ===============================
/*
// الحاوية Container ==> أخري وفيه مجموعة خواص مفيدة بالنسبالي Widget انه يحتوي علي Container الهدف من ال
// Container ==> Creates a widget that combines common painting, positioning, and sizing widgets.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Title')),
        body: Container(
          height: 300, // Container الطول لل
          width: 300, // Container العرض لل
          // decoration: BoxDecoration(فيه مجموعة من الخواص المفيدة)
          // color: Colors.red, // propertie of Container ==> فهنحطها جواها decoration دي موجودة برة ال color ال
          // لو كانت موجودة عندي عشان ميحصلش خطا decoration بره ال color ممنوع اضيف
          decoration: BoxDecoration(
            color: Colors.red,
            // borderRadius ==> BoxDecoration للتعامل مع الحواف الخاصة بال
            // لجعل الحواف غير حادة بدرجة 20 يعني حواف دائرية
            borderRadius: BorderRadius.circular(4000),
            // border ==> بتعمل زي برواز علي الحواف او بتحدد الحواف وبتتحكم فيها
            border: Border.all(color: Colors.black, width: 10),
            // BoxShadow ==> لعمل ظل
            // Offset(العرض horizontal  ,vertical الطول) بمعني الازاحة مع احداثيات عمودية وافقية
            // spreadRadius بمعني الانتشار او التوسع
            // blurRadius بمعني اللغوشة او البورتريه
            boxShadow: [
              BoxShadow(
                color: Colors.blue,
                offset: Offset(10, 10),
                spreadRadius: 3,
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.green,
                offset: Offset(-10, -10),
                spreadRadius: 3,
                blurRadius: 10,
              ),
            ],
          ),
          // padding : EdgeInsets ممكن نعمل تباعد داخلي او هوامش عن طريق ال
          // EdgeInsets.all(20) ==> نفسه يعني دا تباعد داخلي Container لحد حواف ال Container بيعمل تباعد من كل الجهات او الجوانب بمقدار20 ولكن دا تباعد لاي حاجة داخل ال
          padding: EdgeInsets.all(20), //==>  propertie of Container
          // Text اللي بيتباعد من الداخل هنا هو ال

          // margin تباعد خارجي من اول هوامش الكونتينر لحد بره : تباعد خارجي
          margin: EdgeInsets.all(10), // ==>  propertie of Container
          // نفسه بكل اللي فيه Container اللي بيتباعد من الخارج هنا هو ال

          // alignment ==> Container واللي بيتم محاذاته هو اللي جوه ال Container للتحكم بالمحاذاة او الاتجاه الخاصة بال
          alignment: Alignment.center, // propertie of Container
          child: const Text( // propertie of Container
            'ahmed hani ismail',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 30.5,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
*/
// ================================ image Widget ===============================
/*
// كيفية اضافة صورة للبرنامج بتاعي

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Title')),
        body: Container(
          // زي بعض network وال asset كل خواص ال
          // Image.network("the image link from internet(web)")
          // child: Image.network(name),
          // Image.asset("the image path from my device(folders)")
          child: Image.asset(
          fit: BoxFit.fill, // بيخلي الصورة تتمدد وتاخد باقي المساحة اللي فاضلة كلها ولكن الصورة بتتشوه وبتساعدني أدي للصورة اي طول او عرض من غير مشاكل
          // fit:BoxFit.cover, // بيخلي الصورة تاخد المساحة كاملة وبيقطع الاجزاء الزيادة منها في حال لو ان مساحة الصورة اكبر من المساحة الفاضلة
          // بتتقطع الاجزاء الزيادة ويحافظ علي الابعاد والصورة بتكون كويسة fit:BoxFit.cover الصورة هتنضغط وتتشوه اما في حالة fit: BoxFit.fill في حال لو ابعاد الصورة مش مناسبة لو عملنا
          "ahmed_img.jpg",
          width: 300, // العرض
          height: 300, // الطول
          
          ),
        ),
      ),
    );
  }
}
*/
// ================================ Row Widget and Column Widget ===============================
/*
// Column Widget ==> Creates a vertical array of children
// Column Widget ==> هي الاساس في تقسيم اي صفحة عندي وبترتبلي العناصر بشكل عمودي
// properties of Column,Row ==> mainAxisAlignment , crossAxisAlignment , children
// Row Widget ==> Creates a horizontal array of children
// Row Widget ==> هي الاساس في تقسيم اي صفحة عندي وبترتبلي العناصر بشكل أفقي
import 'package:flutter/material.dart';

void main() {
  runApp(RunApp());
}

class RunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Title')),
        body: Container(
          width: 500,
          height: 400,
          color: Colors.amber,
          // child: Column(
          //   // mainAxisAlignment ==> المقصود بيها هو المحور العمودي وبمعني انت عايز ترتب العناصر عمودي اٍزاي
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   // crossAxisAlignment ==> المقصود بيها هو المحور الأفقي وبمعني انت عايز ترتب العناصر أفقي اٍزاي
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   // list of widgets ودي بتقبل children هي ال Column في ال propertie أهم
          //   children: [
          //     Text('ahmed'),
          //     Container(height: 100, width: 100, color: Colors.red),
          //     // Image.asset("images/1668274839664.jpg"),
          //     Container(height: 100, width: 100, color: Colors.blue),
          //     Text('Ahmed Hani Ismail'),
          //   ],
          // ),
          child: Row(
            // mainAxisAlignment ==> المقصود بيها هو المحور الأفقي وبمعني انت عايز ترتب العناصر أفقي اٍزاي
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment ==> المقصود بيها هو المحور العمودي وبمعني انت عايز ترتب العناصر عمودي اٍزاي
            crossAxisAlignment: CrossAxisAlignment.center,
            // list of widgets ودي بتقبل children هي ال Column في ال propertie أهم
            children: [
              Text('ahmed'),
              Container(height: 50, width: 50, color: Colors.red),
              // Image.asset("1668274839664.jpg"),
              Container(height: 50, width: 50, color: Colors.blue),
              Text('Ahmed Hani'),
              Container(height: 100, width: 50, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ================================ wrap and SingleChildScrollView ===============================
/*
// Row , Column ==> لو حجم العناصر تجاوز الابعاد الخاصة بالموبايل بيطلعولي مشاكل
// Wrap ==> مع بعض الاختلافات وهي انها بتنظم العناصر عشان متتجاوزش العرض الخاص بالموبايل عشان ميحصلش مشكلةrow , column شبيهة بال
// Wrap ==> Row اٍذا ما كانت امساحة كافية هتنزلي العناصر للاسفل للصف الجديد لانها بتحل مشكلة الابعاد لل
// SingleChildScrollView ==> ليها child:Column(children) عن طريق اضافة ال Column بتحللي مشاكل الابعاد الخاصة بال
// SingleChildScrollView ==> scrollDirection: Axis.horizontal, عن طريق تغيير اعداداتها الي Row الاساس فيها عمودي بس ممكن اغيرها واخليها أفقية ايضا وتشتغل مع ال
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Title')),
        // body: Row( // لحلها wrap هيطلعلي مشكلة بسبب تجاوز حجم العناصر لحجم الجهاز فهستخدم ال
        // body: Wrap(
        // Row نظم العناصر وحلت مشكلة الابعاد لل wrap اتحلت المشكلة لان ال
        // body: SingleChildScrollView(
        // child: Column(
        // Column نظم العناصر وحلت مشكلة الابعاد لل SingleChildScrollView اتحلت المشكلة لان ال
        // wrap لحل مشاكل تجاوز الابعاد في فيها وفي ال Row مع ال SingleChildScrollView استخدام ال
        // body: SingleChildScrollView(
        //   child: Wrap(
        // Wrap نظم العناصر وحلت مشكلة الابعاد لل SingleChildScrollView اتحلت المشكلة لان ال
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // من عمودي الي افقي SingleChildScrollView لتعديل المحور الخاص بال
          child: Row(
            children: [
              Container(height: 100, width: 100, color: Colors.red),
              Container(height: 100, width: 100, color: Colors.green),
              Container(height: 100, width: 100, color: Colors.black),
              Container(height: 100, width: 100, color: Colors.yellow),
              Container(height: 100, width: 100, color: Colors.red),
              Container(height: 100, width: 100, color: Colors.green),
              Container(height: 100, width: 100, color: Colors.black),
              Container(height: 100, width: 100, color: Colors.yellow),
              Container(height: 100, width: 100, color: Colors.red),
              Container(height: 100, width: 100, color: Colors.green),
              Container(height: 100, width: 100, color: Colors.black),
              Container(height: 100, width: 100, color: Colors.yellow),
              Container(height: 100, width: 100, color: Colors.red),
              Container(height: 100, width: 100, color: Colors.green),
              Container(height: 100, width: 100, color: Colors.black),
              Container(height: 100, width: 100, color: Colors.yellow),
              Container(height: 100, width: 100, color: Colors.red),
              Container(height: 100, width: 100, color: Colors.green),
              Container(height: 100, width: 100, color: Colors.black),
              Container(height: 100, width: 100, color: Colors.yellow),
              Container(height: 100, width: 100, color: Colors.red),
              Container(height: 100, width: 100, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ================================ Listview Widget ===============================
/*
// Listview Widget ==> Creates a scrollable, linear array of widgets from an explicit [List].
// Listview Widget ==> list of widget مع اختلاف انها تقبل SingleChildScrollView شبه ال
// Listview.builder ==> loop بالاضافة اٍلي list عادة بنستعملها مع
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<dynamic> employee = [
    {'name': 'ahmed', 'age': 21},
    {'name': 'mohammed', 'age': 23},
    {'name': 'yasser', 'age': 25},
    {'name': 'anas', 'age': 25},
    {'name': 'mohammed', 'age': 23},
    {'name': 'yasser', 'age': 25},
    {'name': 'anas', 'age': 25},
    {'name': 'mohammed', 'age': 23},
    {'name': 'yasser', 'age': 25},
    {'name': 'anas', 'age': 25},
    {'name': 'osama', 'age': 25},
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Title')),
        body: ListView(
          children: [
            Container(child: Text('Hello world...'),),
            Container(
              // height: 400,
              width: 400,
              // child: ListView(
              // scrollDirection: Axis.horizontal, // عشان ميحصلش مشاكل listview او بره ال ListView لو موجود جوه ال  Container لو اضفناها لازم نضيف طول وعرض لل
              // children: [
              // Text('Course Flutter'),
              // Container(height: 100, width: 100, color: Colors.yellow),
              // Container(height: 100, width: 100, color: Colors.green),
              // Container(height: 100, width: 100, color: Colors.red),
              // Container(height: 100, width: 100, color: Colors.green),
              // Container(height: 100, width: 100, color: Colors.red),
              // Container(height: 100, width: 100, color: Colors.blue),
              // Container(child: Text(employee[0]['name']),),
              // Container(child: Text(employee[1]['name']),),
              // Container(child: Text(employee[2]['name']),),
              // ListView.builder لان الكود اتكرر فهنستخدم ال list دي تعتبر طريقة فاشلة لعرض عناصر
              // ],
              // child: ListView.builder(
              //   // ListView.builder ==> Creates a scrollable, linear array of widgets that are created on demand
              //   // ListView.builder ==> listview اضافة اللي التكرار وبتحل مشاكل ال list بتساعدني علي التعامل مع عناصر ال
              //   // itemBuilder ==> Function(BuildContext, int) وهي عبارة عن ListView.builder أهم عنصر لل
              //   // itemCount: شرط التكرار ==> loops عاملة زي الشرط اللي في ال
              //   itemCount: employee.length,
              //   itemBuilder: (context, index) {
              //   return Container(
              //     height: 100,
              //     color: index.isEven? Colors.amber:Colors.red ,
              //     child: Text(
              //       employee[index]['name'],
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontSize: 30,
              //         color: Colors.white,
              //     ),
              //     ),
              //     );
              //   },
              // ),
              // ListView.separated ==> separatorBuilder بالاضافة الي ListView.builder هي عبارة عن
              // ListView.separated ==> بتديني ميزة الفصل بين كل عنصر وعنصر
              // separatorBuilder ==> return بيفصلي بين كل عنصر وعنصر بالحاجة اللي هعملها
              child: ListView.separated(
                shrinkWrap: true, // للقوائم scroll اخري عشان تظبط الlistview داخل listview بنستخدمها في حالة لما تكون ال
                physics: NeverScrollableScrollPhysics(), // اخري listview داخل listview وبستفيد بيها لما تكون ال scroll بتقوم بالغاء وظيفة ال
                separatorBuilder: (context, index) {
                  // return Container(color: Colors.green,height: 100,); // container بنفصل هنا ب
                  // Divider() ==> // Creates a Material Design divider ==> هو عبارة عن خط
                  return Divider(color: Colors.blue,thickness: 2.0,); // بنفصل هنا بخط
                  // thickness => ارتفاع الخط
                },
                itemCount: employee.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    color: index.isEven ? Colors.amber : Colors.red,
                    child: Text(
                      employee[index]['name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
// ================================ Gridview Widget ===============================
/*
// Gridview ==> ولها نفس الخواص Listview تستعمل زي ال
// Gridview ==> Creates a scrollable, 2D array of widgets that are created on demand

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<dynamic> employee = [
    {'name': 'ahmed', 'age': 21},
    {'name': 'mohammed', 'age': 23},
    {'name': 'yasser', 'age': 25},
    {'name': 'anas', 'age': 25},
    {'name': 'mohammed', 'age': 23},
    {'name': 'yasser', 'age': 25},
    {'name': 'anas', 'age': 25},
    {'name': 'mohammed', 'age': 23},
    {'name': 'yasser', 'age': 25},
    {'name': 'anas', 'age': 25},
    {'name': 'osama', 'age': 25},
  ];
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('GridView')),
        body: Container(
          // ====================== GridView ====================
          // build لانها مش loop ومفيهاش Listview العادية اللي شبه ال GridView ال
          // child: GridView(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 4,
          //     mainAxisSpacing: 10.0,
          //     crossAxisSpacing: 10.0,
          //     childAspectRatio: 1.0, // بتساعدني احدد عرض وارتفاع كل عنصر كنسبة وتناسب 
          //     mainAxisExtent: 100.0,
          //   ),
          // ====================== GridView.count(العناصر) ====================
          // count وبنحط العناصر جوه ال gridDelegate: SliverGridDelegateWithFixedCrossAxisCount العادية بس مفيهاش GridView زي ال
          child: GridView.count(
            reverse:
                true, // false بتقوم بعكس العناصر من اعلي لاسفل وقيمتها الافتراضية هي
            scrollDirection: Axis.horizontal,
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 2.0,
            // mainAxisExtent: 100.0, ==> GridView.count غير موجودة في
            // ====================== GridView.count(العناصر) ====================
            children: [
              Container(child: Text('ahmed 1'), color: Colors.red),
              Container(child: Text('wael 2'), color: Colors.yellow),
              Container(child: Text('basel 3'), color: Colors.greenAccent),
              Container(child: Text('ahmed 4'), color: Colors.red),
              Container(child: Text('wael 5'), color: Colors.yellow),
              Container(child: Text('basel 6'), color: Colors.greenAccent),
              Container(child: Text('ahmed 7'), color: Colors.red),
              Container(child: Text('wael 8'), color: Colors.yellow),
              Container(child: Text('basel 9'), color: Colors.greenAccent),
            ],
          ),
          // ====================== GridView.builder ====================
          // child: GridView.builder( // builder من ال loop بالاضافة الي GridView عبارة عن
          //   // SliverGridDelegateWithFixedCrossAxisCount ==> الواحد Row عشان نقدر نحدد كام عنصر هينعرض بال
          //   // crossAxisCount ==> The number of children in the cross axis
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 4, // عدد العناصر اللي هتتعرض في الصف الواحد
          //     mainAxisSpacing: 10.0, // لاٍنشاء خط فاصل او مسافة افقيا
          //     crossAxisSpacing: 10.0, // // لاٍنشاء خط فاصل او مسافة راسيا
          //     childAspectRatio:
          //         1.0, // نسبة التباعد الطولي بالنسبة للعرضي والقيمة الافتراضية 0 وهي نسبة الطول علي العرض
          //     mainAxisExtent: 100.0, // childAspectRatio بتدي طول ثابت احنا بنحدده بدل حساب نسبة الطول علي العرض في

          //   ),
          //   itemCount: employee.length,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       height: 100,
          //       color: Colors.red,
          //       child: Text(
          //         employee[index]['name'],
          //         textAlign: TextAlign.center,
          //         style: TextStyle(fontSize: 16, color: Colors.white),
          //       ),
          //     );
          //   },
          // ),
          // ====================== GridView.builder ====================
        ),
      ),
    );
  }
}
*/
// ================================ ListTile and Card ===============================
/*
// Card ==> Widget اللي هو ممكن يكون child بحيث انها بتحتوي علي Container بتشتغل بنفس مبدأ ال
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListTile and Card')),
        body: Container(
          child: ListView(
            children: [
              Card(
                // elevation: 0.0, // Card بتشيل التحديد او الظل اللي حولين ال
                // margin: EdgeInsets.only(
                // top: 20,
                // ), // عملنا مسافة من الاعلي بمقدار 20
                // shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(50),
                // ),
                // بتعمل زي نظام بطاقة او حاوية مستطيلة
                // ======== Card شرح بسيط لل ==========
                // child: Container(
                //   padding: EdgeInsets.all(20),
                //   child: Text('ahmed'),
                // ),
                // ======== Card اللي فوق شرح بسيط لل ==========
                // ======== ListTile شرح بسيط لل ===============
                // ListTile ==> title بتساعدني علي التقسيم واهم خاصية فيها هي ال
                child: ListTile(
                  isThreeLine:
                      true, // للاعلي بدل مهما في النص trailing و leading بترفع ال
                  // enabled: false, // disabled بتوقفها عن العمل يعني
                  tileColor: Colors.amber,
                  onLongPress: () {
                    print('onLongPress');
                  },
                  onTap: () {
                    // clickable بتخليها قابلة للضغط
                    print('on Tap');
                  },
                  leading: Text(
                    'leading 1',
                  ), // title الحاجة الي بتيجي بالبداية علي اقصي اليسار قبل ال
                  title: Text('Title Ahmed'), // leading تاني حاجة بتيجي بعد ال
                  subtitle: Text(
                    'subtitle Age:21',
                  ), // title الحاجة الي بتيجي بالبداية تحت ال
                  trailing: Text(
                    'trailing 2025',
                  ), // title الحاجة الي بتيجي بالنهاية علي اقصي اليمين ال
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ================================ Icon and IconButton ===============================
/*
// Icon Widget ==> Creates an icon
// Icons.type of icon اهم خاصية فيها هي ال
// IconButton ==> الموجودة عندي مع امكانية الضغط عليها Icon هي هي ال

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Icon and IconButton')),
        body: Container(
          // child: Icon(Icons.person, color: Colors.amber, size: 100),
          child: IconButton(
            // onPressed: () {} ==> دي دالة هتشتغل وقت الضغط علي الايقونة
            onPressed: () {
              print('onPressed');
            },
            // مش موجودة نعدل الحجم من جوه الايقونة عادي IconButton لو موجود عشان ميحصلش مشاكل وكان ايقونة جوه ايقونة اما لو ال IconButton لما نيجي نعدل الحجم نعدلة جوه ال
            iconSize:
                100,
            icon: Icon(Icons.star),
          ),
        ),
      ),
    );
  }
}
*/
// ================================ Resposive And Expanded Widget ===============================
/*
// Responsive وكيفية بناء تصاميم Expanded هنتعرف علي ال
// Expanded Widget ==> والتصاميم دي متجاوبة مع جميع احجام الشاشات Responsive في بناء تصاميم Widget من اهم ال
// هي جعل الشاشة تتمدد في المساحة المتاحة ليها Expanded فكرة ال

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Expanded Widget')),
        body: Container(
          child: Row(
            children: [
              // Expanded Widget لو احنا عايزين نعمل اكتر من حاوية ونخليهم ياخدوا مساحة او عرض متساوي من غير منعرف حجم الشاشة فلازم نستخدم ال
              // Expanded Widget(child: الحاوية من غير width لانها هتتمدد فملوش لازمة) ==> Row , Column وبنستخدمها مع ال
              // Expanded(child: Container(color: Colors.red, height: 100)),
              // Expanded(child: Container(color: Colors.amber, height: 100)),
              // Expanded(child: Container(color: Colors.green, height: 100)),
              // في الحالة دي انا عندي 3 حاوية اذا كل حاوية هتاخد تلت المساحة
              // flex طب لو انا عايز اخلي حاوية منهم تاخد مساحة اكتر من الباقي فوقتها هستخدم
              // flex ==> Expanded الافتراضي بتاعها 1 لو زاد عن كده يعني هياخد عدد معين ضعف الحاويات التانية مع شرط كتابته قبل الحاوية وجوه ال
              // flex ==> بتقسم المساحة الكلية كاجزاء انا بحددها لكل حاوية
              Expanded(
                flex: 2, // الحاوية الاولي هتاخد ضعف مساحة اي حاوية تانية
                child: Container(color: Colors.red, height: 100),
              ),
              Expanded(child: Container(color: Colors.amber, height: 100)),
              Expanded(child: Container(color: Colors.green, height: 100)),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ================================ Example 1 ===============================
/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Example 1')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  // للتحكم في الحواف والتحديد علي الحاوية
                  color: Colors.grey[300],
                  border: Border.all(color: Colors.black, width: 2),
                ),
                padding: EdgeInsets.all(10),
                width: 1000,
                child: Text(
                  'Ahmed Hani Ismail',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  // للتحكم في الحواف والتحديد علي الحاوية
                  color: Colors.grey[300],
                  border: Border.all(color: Colors.black, width: 2),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ), // عملنا تباعد داخلي افقي للنص اللي موجود يعني يمين وشمال بمقدرا 30 وتباعد راسي يعني فوق وتحت بمقدار 20
                width: 1000,
                child: Text(
                  'I am a new flutter developer and this is my first App it is very simple :\n it contains more than one container have text inside and colored',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  // للتحكم في الحواف والتحديد علي الحاوية
                  color: Colors.grey[300],
                  border: Border.all(color: Colors.black, width: 2),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 40,
                ), // عملنا تباعد راسي يعني فوق وتحت بمقدار 10 وافقي يعني يمين وشمال بمقدار 40
                width: 1000,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceAround, // بتدي مسافة بين العناصر ومسافة من اليمين واليسار والمسافة اللي بين العناصر بتكون الضعف
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween, // بتدي مسافة بين العناصر فقط يعني مفيش يمين او شمال
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // بتدي مسافات متساوية بين العناصر و يمين و شمال
                  children: [
                    Container(
                      // العنصر الاول
                      child: Row(
                        children: [
                          Icon(Icons.star, size: 20),
                          Icon(Icons.star, size: 20),
                          Icon(Icons.star, size: 20),
                          Icon(Icons.star, size: 20),
                          Icon(Icons.star, size: 20),
                        ],
                      ),
                    ),
                    Text("170 Reviews"), // العنصر الثاني
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  // للتحكم في الحواف والتحديد علي الحاوية
                  color: Colors.grey[300],
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // بدالها spacer() ممكن استعمل
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        Icon(Icons.person, color: Colors.green[400], size: 22),
                        Text(
                          'PREP:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(0, 4),
                        ), // لانشاء مسافة فارغة بين النصين
                        Text('25 min'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Icon(
                          Icons.timelapse,
                          color: Colors.green[400],
                          size: 22,
                        ),
                        Text(
                          'COOK:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox.fromSize(size: Size(0, 4)),
                        Text('1 hr'),
                      ],
                    ),
                    Spacer(), // spacer(flex:المسافة اللي انا عايزها) بمعني مسافة وممكن احددله المسافة عن طريق ال
                    Column(
                      children: [
                        Icon(
                          Icons.restaurant,
                          color: Colors.green[400],
                          size: 22,
                        ),
                        Text(
                          'FEEDS:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox.fromSize(size: Size(0, 4)),
                        Text('4-6'),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ================================ Buttons ===============================
/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // ==================== floatingActionButton وهو ال Buttons النوع الثالث من ال =====================
        // موجودة عندنا listview ل scroll وبيكون موجود ومبيتغيرش موقعه لو عملنا FloatingActionButton من نوع widget ودا بيقبل
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // floatingActionButton للتحكم في مكان ال
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('FloatingActionButton');
          },
        ),
        appBar: AppBar(title: Text('Buttons')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              /*
              //================= MaterialButton(onPressed: () {code},child: any widget) أهمها هو buttonالنوع الاول: يوجد عدة اشكال لل =============
              MaterialButton(
                color: Colors.amber,
                textColor: Colors.white,
                // minWidth ==> The smallest horizontal extent that the button will occupy
                // minWidth:
                // 200, // هياخد عرض مش اقل من ال200 ولكن ممكن ياخد اكتر لو اٍحتاج
                // height: 100,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                onLongPress: () {
                  print('Long Press');
                },
                onPressed: () {
                  print('ahmed ismail');
                },
                child: Text('ahmed'),
              ),
              */
              // =========== IconButton هو ال Buttons النوع التاني لل ============
              // ودا من اسمه بيقبل ايقونة كزرار
              IconButton(
                onPressed: () {
                  print('ahmed');
                },
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ================================ StatefulWidget & SetState() ===============================
/*
// StatelessWidget ==> صفحة غير تفاعلية لا يمكن التعديل عليها
// StatefulWidget ==> يعني صفحة تفاعلية بنستخدمها عندما يكون عندنا تفاعل بالصفحة ويمكن التعديل عليها
// StatefulWidget في التعامل مع التغييرات في الصفحة وبالتالي هنلغيه ونعمل مثال جديد بال StatelessWidget المثال اللي تحت دا بيوضح مشكلة ال
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // int counter = 0; // StatelessWidget لان انا بستعمل ال error ==> Can't define a const constructor for a class with non-final fields.Try making all of the fields final, or removing the keyword 'const' from the constructor
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('StatefulWidget & SetState()')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  counter++;
                  print(counter);
                },
                icon: Icon(Icons.add),
              ),
              Text('Counter $counter'),
              IconButton(
                onPressed: () {
                  counter--;
                  print(counter);
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  // createState() ==> StatefulWidget لازم ننشأه جوه ال
  // createState() => اللي هنشأه انا فيما بعد class هترجع ال
  // createState() ==> State<the name of the app> من نوع
  // State ==> The logic and internal state for a [StatefulWidget].
  @override
  State<MyApp> createState() => _MyAppState(); // _MyAppState(); يعني خاص بهذه الصفحة فقط اسمه private class هنرجع هنا
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('StatefulWidget & SetState()')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  // setState(() {}); ==> فقط StatefulWidget والخاصية دي موجودة جوه ال rebuild فلازم نعمل Widget build يعني اعادة بناء للصفحة وتتحدث بياناتها لان كل دا جوه rebuild عشان تعمل
                  // setState(() {}); ==> واعادة البناء بتكون للقيمة الجديدة Widget اللي من نوع build اللي اسمها function لل rebuild بتعمل  
                  setState(() {
                    counter++;
                  });
                },
                icon: Icon(Icons.add),
              ),
              Text('Counter $counter'),
              IconButton(
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ====================== SwitchListTile & switch =======================
/*
// Widget Switch هنتعرف علي ==> Creates a Material Design switch دي ذي زرار تفعيل او اغلاق ميزة ما
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
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SwitchListTile & switch')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // value : inactive تبقي غير مفعلة false اما لو ب active تبقي متفعلة true لو ب
              // عشان تتغير حالتها لما نيجي نغيرها bool متغير من نوع value يعني احنا بندي ال
              // onChanged لو جينا نغير حالتها يعني من ترو لفولس او العكس يدويا من الصفحة هتتفعل الدالة اللي جوه ال
              //setState((){newValue of boolvariable}) عشان تتغير حالتها لما نيجي نغيرها وهنغير قيمته جوه ال onChanged ايا كان هو واخد ترو ولا فولس فلازم نغير قيمته مرة تانية جوه ال value لل bool لما نضيف متغير من نوع
              // Switch ==> بتاخد عرض علي قدها يعني لازم اسحب او اضغط علي الزرار نفسه عشان تستجيب معايا وتتغير
              // SwitchListTile ==> بتاخد عرض الشاشة كامل يعني عرض المنطقة او المساحة اللي هي فيه كامل وبالتالي لو انا ضفطت في اي منطقة في المساحة اللي هي واخداه هتستجيب معايا وتتغير يعني مش لازم اضغط علي الزرار نفسه
              SwitchListTile(
                // title هي ال SwitchListTile من مزايا ال
                title: Text('Click here'), // بتاخد العرض المتاح كامل
                tileColor:
                    Colors.grey, // بتلون المساحة او العرض اللي الزرار واخده
                // Switch(g
                // track والمساحة اللي الدايرة بتتحرك فيها واسمها Thumb عبارة عن دائرة واسمها Switch زرار ال
                activeColor: Colors.red, // لون الدائرة في حالة لو مفعلة
                inactiveThumbColor:
                    Colors.green, // لون الدائرة في حالة لو غير مفعلة
                activeTrackColor: Colors.amber, // في حالة لو مفعل track لون ال
                inactiveTrackColor:
                    Colors.white, // في حالة لو غير مفعل track لون ال
                value: status, // 1: bool variable
                onChanged: (bool myChangedValue) {
                  // 2: bool myChangedValue
                  print(
                    'onChanged: $myChangedValue',
                  ); // 3: print message if need
                  setState(() {
                    // 4: setState for interact with interface
                    status =
                        myChangedValue; // 5: change the value of bool variable by bool myChangedValue in setState because it will change in the interface
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ====================== RadioListTile & Radio =======================
/*
// Radio Widget ==> Creates a Material Design radio button
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
  String? country; // الاولي groupValue ال
  int? age; // الثانية groupValue ال
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('RadioListTile & Radio')),
        body: Column(
          children: [
            // value ==> dynamic بتقبل قيمة
            // onChanged ==> value لما بنضغط علي الزرار بيخزن قيمة ال
            // groupValue ==> value هو الاساس في التغيير لانه بياخد قيمة ال
            // [value] and [groupValue] together determine whether the radio button is selected
            // [onChanged] is called when the user selects this radio button
            // RadioL(value: 'syria', groupValue: country, onChanged: (myChangedValue) {}),
            // RadioListTile( // SwitchListTile زي ال
            // title: Text('syria'), // title يعني بتقبل
            // value: 'syria',
            // groupValue: country,
            // onChanged: (myValue) {},
            // ),
            // مثال عملي اختر الدولة الخاصة بك
            Text('Choose Your Country:', style: TextStyle(fontSize: 20)),
            RadioListTile(
              title: Text('syria'),
              value: 'syria', // الاول RadioListTile دي قيمة ال
              groupValue: country, // قيمة الاختيار النهائي بعد الضغط
              onChanged: (myChangedValue) {
                // myChangedValue ==> groupValue القيمة اللي بتتاخد عند الضغط او الاختيار وبنخزن القيمة دي في المتغير اللي في
                setState(() {
                  country = myChangedValue;
                });
              },
            ),
            RadioListTile(
              title: Text('EGYPT'),
              value: 'EGYPT', // الثاني RadioListTile دي قيمة ال
              groupValue:
                  country, // value عند التساوي مع ال active بتتخزن فيها القيمة وبيتعملها
              onChanged: (myChangedValue) {
                setState(() {
                  country = myChangedValue;
                });
              },
            ),
            RadioListTile(
              // activeColor: Colors.amber,
              // contentPadding: EdgeInsets.all(30),
              // tileColor: Colors.red,
              title: Text('Jordan'),
              value: 'Jordan', // الثالث RadioListTile دي قيمة ال
              groupValue: country,
              onChanged: (myChangedValue) {
                setState(() {
                  country = myChangedValue;
                });
              },
            ),
            // مثال عملي آخر اختر العمر الخاصة بك
            Text('Choose Your Age:', style: TextStyle(fontSize: 20)),
            RadioListTile(
              title: Text('1-10'),
              value: 10,
              groupValue: age,
              onChanged: (myChangedValue) {
                setState(() {
                  age = myChangedValue;
                });
              },
            ),
            RadioListTile(
              title: Text('11-20'),
              value: 21,
              groupValue: age,
              onChanged: (myChangedValue) {
                setState(() {
                  age = myChangedValue;
                });
              },
            ),
            RadioListTile(
              // activeColor: Colors.amber,
              // contentPadding: EdgeInsets.all(30),
              // tileColor: Colors.red,
              title: Text('21-30'),
              value: 30,
              groupValue: age,
              onChanged: (myChangedValue) {
                setState(() {
                  age = myChangedValue;
                });
              },
            ),
            Text(
              'Your Country is $country and Your Age is $age',
              style: TextStyle(fontSize: 30, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
*/
// ====================== CheckboxListTile & Checkbox =======================
/*
// Checkbox Widget ==> Creates a Material Design checkbox / ولاختيار اكتر من اختيار
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
  bool status = false;
  bool status2 = false;
  bool status3 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('CheckboxListTile & Checkbox')),
        body: Column(
          children: [
            // value ==> Whether this checkbox is checked / accept bool variable
            // onChanged ==> Called when the value of the checkbox should change
            // Checkbox(
            //   value: status,
            //   onChanged: (myChangedValue) {
            //     setState(() {
            //       status = myChangedValue!;
            //     });
            //   },
            // ),
            // مثال اختيار هواياتك المفضلة
            Text(
              'Choose Your Favorite Hobbies',
              style: TextStyle(fontSize: 20),
            ),
            CheckboxListTile(
              title: Text('Basketball'),
              value: status,
              onChanged: (myChangedValue) {
                setState(() {
                  status = myChangedValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Football'),
              value: status2,
              onChanged: (myChangedValue) {
                setState(() {
                  status2 = myChangedValue!;
                });
              },
            ),
            CheckboxListTile(
              activeColor: Colors.amber,
              checkColor: Colors.blue,
              title: Text('Tennis'),
              value: status3,
              onChanged: (myChangedValue) {
                setState(() {
                  status3 = myChangedValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/
// ====================== Stack =======================
/*
// Column , Row مشابهة لطريقة عمل ال Stack طريقة عمل ال
// Stack ==> بيرتبلي العناصر بشكل طبقات يعني طبقة جوه طبقة جوه طبقة
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stack')),
        body: Container(
          child: Stack(
            // clipBehavior ==> يعني اللي تم اقتطاعها او اخراجها
            // عشان يظهرلي الحاوية اللي خرجت بره الطبقة الرئيسية لما عملت اتجاها بالسالب
            clipBehavior: Clip.none,
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 300,
                height: 300,
                color: Colors.red,
              ), // الطبقة الاولي واللي تحت
              Container(
                width: 200,
                height: 200,
                color: Colors.green,
              ), // الطبقة الثانية واللي هتظهر فوق الاولي
              // Positioned ==> Creates a widget that controls where a child of a [Stack] is positioned
              // Positioned ==> Stack للتحكم في اتجاهات العناصر الخاصة بال
              Positioned(
                top: 0, // يعني التباعد عن الاعلي 0
                right: 0, // يعني التباعد عن اليمين 0
                // topright يعني هيبقي اقصي اليمين من فوق
                child: Container(width: 100, height: 100, color: Colors.blue),
              ),
              Positioned(
                left: 0, // يعني التباعد عن اليسار 0
                top: 0, // يعني التباعد عن الاعلي 0
                // topleft وبما ان التبعاد عن اليسار والاعلي 0 اذا فهي هتاخد اقصي يسار الاعلي يعني شمال من فوق
                child: Text('myStack'),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  color: Colors.amber,
                  width: 60,
                  height: 60,
                  child: Text(
                    'الحاوية اتمددت واخدت عرض اكتر من اللي انا ادتهولها عشان انا عملت تباعد يمين وشمال 0 فبالتالي اتمددت',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom:
                    -120, // لو عملنا اتجاه بالسالب فهو كده هيخرج بره الحاوية ومش هيظهر
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  color: Colors.brown,
                  width: 80,
                  height: 80,
                  child: Text(
                    'الحاوية اللي خرجت بره عشان اتجاها بالسالب',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ====================== TextField & TextFormField =======================
/*
// TextField ==> Creates a Material Design text field
// هنتعرف علي حقول الٍادخال اللي بنسجل بيها الداتا وكل معلوماتنا والمعلومات دي بتتحفظ في قاعدة بيانات ذي داتا تسجيل الدخول لحساب جيميل

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
  // TextEditingController username =
  // TextEditingController(); // controller دا انشاء المتغير الخاص بال
  String changedValue='';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TextField & TextFormField')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  // TextField اهم الخواص لل
                  // prefix ==> Optional widget to place on the line before the input \ بتتحط قبل الداتا اللي هتنكتب او في بداية الحقل من اليسار  widget بمعني
                  // suffix ==> Optional widget to place on the line after the input  \ بتتحط بعد الداتا اللي هتنكتب او في نهاية الحقل من اليمن  widget بمعني
                  // prefix: Icon(Icons.person), // TextField بتظهر داخل ال
                  // suffix: Icon(Icons.person_3_rounded), // TextField بتظهر داخل ال
                  // TextField وبتظهر داخل ال Icon من نوع Widget ودول بيقبلو prefixIcon , suffixIcon والافضل من دول هما ال
                  // prefixIcon: Icon(Icons.person),
                  // prefixIconColor: Colors.amber, // لتغيير اللون
                  // suffixIcon: Icon(Icons.done),
                  // suffixIconColor: Colors.amber, // لتغيير اللون
                  // TextField مباشرة ودي بتظهر خارج ال icon Widget نقدر ندخل
                  icon: Icon(Icons.person),
                  iconColor: Colors.amber,
                  // hintText ==> String ودي هي الملاحظة النصية اللي بكتبها عشان اعرف المستخدم ايه هي المعلومات المطلوب ادخالها للحقل دا وبتقبل قيمة من نوع decoration أهم خاصية لل
                  // hintText ==> بتختفي لما المستخدم يدخل بيانات
                  hintText: 'username',
                  // ونفس خواصه Text لانها تعامل معاملة ال hintText ونقدر نتحكم بخصائص ال
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 182, 179, 168),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors
                      .grey[210], // filled ولكن ليعمل هذا الامر فهو بحاجة امر آخر وهو الTextField لتغيير لون ال
                  filled: true,
                  // لادخال نص كبداية ونهاية prefixText , suffixText عندنا برده ال
                  prefixText: 'email : ',
                  prefixStyle: TextStyle(color: Colors.blue),
                  suffixText: 'done',
                  suffixStyle: TextStyle(color: Colors.green),
                  // labelText ==> AppBar يعني عبارة عن ملاحظة بردة ولكن مش بتختفي أثناء ادخال البيانات واٍنما بتطلع لفوق شوية ذي فكرة ال hintText ذي ال
                  labelText: "email",
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 182, 179, 168),
                  ),
                  // TextStyle() بالخواص بتاعتها Text() عادي ذي ال Widget اللي بتقبل Widget lablel اختصار ل labelText , labelStyle طبعا ال
                  // label ==> Optional widget that describes the input field
                  // label: Text('secondemail',
                  // style: TextStyle(
                  // fontSize: 15,
                  // fontStyle: FontStyle.italic,
                  // fontWeight: FontWeight.bold,
                  // color: const Color.fromARGB(255, 182, 179, 168),
                  // ),
                  // ),
                ),
              ),
              TextField(
                // enabled: true, // قابل للكتابة يعني مفعل و دا الٍافتراضي
                // enabled: false, // غير قابل للكتابة يعني غير مفعل
                decoration: InputDecoration(
                  // border لو احنا عايزين نتحكم بال
                  // ودا بيكون من جميع الاطراف كانه مستطيل OutlineInputBorder ودا الافتراضي والثاني هو underlineborder فيه نوعين border ال
                  border: OutlineInputBorder(),
                  // : بعض الخواص اللي هنستخدمها والباقي لما يجي وقتها بعدين border هنتعرف علي باقي خواص ال
                  // focusedBorder ==> يعني عند الضغط عليه بياخد لون معين وانا بقدر اتحكم بالامور دي
                  // focusedBorder: بتاعه focus اللي انا بستخدمه واللي هعدل علي ال border نوع ال
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      // هيظهر الحقل باللون الاحمر focus عند الضغط علي الحقل للادخال او عمل
                      // width: 3, // هيظهر الحقل بعرض 3  focus عند الضغط علي الحقل للادخال او عمل
                    ),
                    borderRadius: BorderRadius.circular(
                      15, // لجعل الحواف دائرية بدرجة 15
                    ),
                  ),
                  // enabledBorder: اللي انا بستخدمه واللي هعدل علي تفعيله او الغاء تفعيله border نوع ال
                  // enabledBorder ==> يعني بقدر اكتب فيه بيانات عادي يعني قابل للكتابة
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green, // هيظهر الحقل باللون الاخضر
                      width: 3, // هيظهر الحقل بعرض 3
                    ),
                  ),
                  // disabledBorder: في حالة لو الحقل غير مفعل او غير قابل للكتابة
                  disabledBorder: OutlineInputBorder(
                    // عند اٍلغاء تفعيله هيظهر باللون الازرق الفاتح وسمكُه 2
                    borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                  ),
                ),
              ),
              TextField(
                // بعض الخواص المهمة :
                maxLength: 10, // اقصي عدد من الحروف او الرموز المسموح كتابتها
                keyboardType:
                    TextInputType // بيظهرلي الكيبورد جاهز علي اساس الحاجة المطلوب ادخالها
                        // يعني الكيبورد هيظهر علي الحروف لو انا طالب حروف او هيظهر علي الارقام لو انا طالب ارقام وهكذا
                        .number, // البيانات المسموح ادخالها من الكيبورد يعني حروف بس او ارقام بس او لينك بس وهكذا
                minLines: 1, // اقل عدد اسطر مسموح بيها
                maxLines: 3, // scroll اكبر عدد اسطر مسموح بيها وبتسمح بعمل
              ),
              TextField(
                //  TextField هنتعرف علي خواص مهمة تساعدنا في التحكم في الداتا اللي بيتم كتابتها داخل ال
                // controller: TextEditingController اقدر احصل الداتا اللي داخلاله وبيقبل متغير من نوع TextField من أهم الخواص وبيساعدني اتحكم في
                // controller:
                // username, // username : TextField بيخزن الداتا اللي بتنكتب داخل ال
                // onChanged عن طريق ال controller نقدر نعرض النص اللي هيتم كتابته بطريقة غير ال
                // onChanged: (String parameter){print(parameter);},
                // onChanged: بتشتغل عند كتابة او حذف اي حرف
                onChanged: (val) {
                  setState(() {
                    changedValue=val;
                  });
                },
              ),
              Text(changedValue), // لطباعة القيمة المدخلة علي الشاشة
              // controller اللي بطريقة ال username هنعمل زرار لعرض النص المخزن في ال
              // MaterialButton(
              //   color: Colors.red,
              //   textColor: Colors.white,
              //   onPressed: () {
              //     print(username.text);
              //   },
              //   child: Text('print'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ====================== TextFormField validator =======================
/*
// TextFormField ==> Form Widget ونفس الخواص مع فرق انها تحتوي علي مزايا اضافية ولكن عشان نستعملها فلازم انها تكون ابن او من ابناء ال TextField ذي ال

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
  // GlobalKey : A key that is unique across the entire app يعني مفتاح فريد ومميز للابليكيشن كله
  // <FormState> formstate : Form() لانه خاص بال FormState ومن نوع formstate مفتاح اسمه
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TextFormField validator')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            // Creates a [FormField] that contains a [TextField]
            // key: Creates a container for form fields
            key: formstate, // valid المفتاح اللي عملناه واللي هيعملي
            child: Column(
              children: [
                TextFormField(
                  // Form من أبناء ال
                  // مثال اظهار رسالة الحقل فارغ عند حفظ البيانات اذا لم يكتب المستخدم اي شيئ
                  // validator ==> myFormvalue داخل متغير وليكن اسمه TextForm هيخزن القيمة اللي داخل ال
                  validator: (myFormvalue) {
                    if (myFormvalue!.isEmpty) {
                      return 'الحقل فارغ';
                    }
                    if (myFormvalue.length > 10) {
                      return 'لا يمكن أن يكون الحقل أكبر من 10';
                    }
                    return null;
                  },
                ),
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () {
                    // currentState : The [State] for the widget in the tree that currently has this global key
                    // validate : Validates every [FormField] that is a descendant of this [Form], and returns true if there are no errors
                    if (formstate.currentState!.validate()) {
                      // اللي موجودة في الحقول عندي validator هي اللي هتشغل كل ال validate ال
                      print('Valid');
                    } else {
                      print('Un Valid');
                    }
                  },
                  child: Text('valid'),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
// ====================== TextFormField onSaved =======================
/*
// onSaved function ==> keyname.currentstate.save() ولكن عشان تشتغل لازم نعمل مفتاح ليها واللي هو TextFormField لحفظ قيمة النص اللي هينكتب جوه ال
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
  String? username = '';
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TextFormField onSaved')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            // موجود عندنا من غير منقعد نضيفها لكل واحد علي حدي TextFormField مباشرة فكده هتشتغل لكل Form لما بنضيف ميزة التحقق التلقائي لل
            key: formstate,
            child: Column(
              children: [
                TextFormField(
                  // : TextField و TextFormField هناك بعض الخواص المشتركة بين ال
                  // obscureText: true, // بنستخدمها مع حقل يعبر عن الباسوورد لانها بتحول البيانات الدخلة الي شكل نجوم**** كنوع من الامن
                  // textAlign: TextAlign.center, // لمحاذاة النص
                  // readOnly: true, // بمعني هذا الحقل للقراءة فقط وبالتالي لا يمكن التعديل عليه
                  // onTap: () {
                  //   print('press');
                  //   // press اطبع TextFormField عند الضغط علي اي مكان في ال
                  // },
                  onSaved: (newValue) {
                    // newValue بتخزن قيمة الحاجة اللي انكتبت في الحقل ل onSaved ال
                    username = newValue;
                  },
                  decoration: InputDecoration(labelText: 'username'),
                  autovalidateMode: AutovalidateMode
                      .always, // هتتعمل بشكل تلقائي validate عملية ال
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الحقل فارغ';
                    }
                    return null;
                  },
                ),
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () {
                    if (formstate.currentState!.validate()) {
                      formstate.currentState!
                          .save(); // onSaved شرط اساسي عشان تشتغل ال
                      print('Valid');
                      print(username);
                    } else {
                      print('NotValid');
                    }
                  },
                  child: Text("valid"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
// ====================== AppBar & Drawer =======================
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
  // scaffoldkey واسمه ScaffoldState هنعمل مفتاح عام من نوع
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldkey, // appbar بره ال drawer المفتاح اللي هيوصلنا لل
        drawer: Drawer( // Scaffold بنكتبه جوه ال
          // appbar دي مثال اخر وهنرجع معاها ال
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              // drawer داخل ال scroll عملناها عشان نقدر نعمل
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.red,
                      width: 100,
                      height: 100,
                      // child: Image.asset("lib/images/1668274839664.jpg"),
                      // ClipRRect() ==> Creates a rounded-rectangular clip
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "lib/images/1668274839664.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('ahmed'),
                        subtitle: Text("ahmedismail@gmail.com"),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: Text('homepage'),
                  // leading: A widget to display before the title
                  leading: Icon(Icons.home),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Account'),
                  // leading: A widget to display before the title
                  leading: Icon(Icons.account_balance_rounded),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Order'),
                  // leading: A widget to display before the title
                  leading: Icon(Icons.check_box),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('About Us'),
                  // leading: A widget to display before the title
                  leading: Icon(Icons.help),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Contact US'),
                  // leading: A widget to display before the title
                  leading: Icon(Icons.phone_android_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('SignOut'),
                  // leading: A widget to display before the title
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        // ==================== AppBar ======================= البداية
        appBar: AppBar(
          // AppBar هنتعرف علي اهم خواص ال
          // leading: A widget to display before the toolbar's [title] / widget وبتقبل
          // leading: Text(
          // 'leading',
          // ), // title في اعلي يساره وقبل ال appbar بتظهر في بداية ال
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.percent)),
          // elevation: 110.0, // كله appbar نسبة الظل اللي بيظهر تحت ال
          // shadowColor: Colors.red, // لون الظل
          // backgroundColor: Colors.amber, // AppBar لون
          // // centerTitle: true, // false بتخلي العنوان في النص والافتراضي ليها هو
          title: Text('AppBar & Drawer'), // أهم خاصية
          // titleTextStyle: TextStyle(
          //   // للتعديل علي النص
          //   fontSize: 20,
          //   fontWeight: FontWeight.bold,
          //   color: Colors.blue,
          // ),
          // actions: [
          //   // وبتشيل جواها مجموعة من الاحداث لو احنا عايزين ListWidget عبارة عن
          //   // مجموعة من الاحداث اللي ممكن تحصل واكتر حاجة بتستخدم جواها هي الايقون
          //   // الهدف منها ان احنا نضيف عدة زراير تنقلني لصفحات اخري
          //   // ترتيب العناصر من اليسار لليمين
          //   IconButton(onPressed: () {}, icon: Icon(Icons.list)),
          //   IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          // ],
        ),
        // ==================== AppBar ======================= النهاية
        // ==================== Drawer =======================
        // Drawer Widget يعني بتنكتب جواه وبتقبل Scaffold خاصية من خواص ال
        // drawer: A panel displayed to the side of the [body], often hidden on mobile devices. Swipes in from either left-to-right ([TextDirection.ltr]) or right-to-left ([TextDirection.rtl])
        // drawer: Drawer() ==> drawer اللي هي 3 شرط فوق بعض وعند الضغط عليها بيظهر ال navigation menu بتكون عبارة عن قائمة تسمي
        // drawer:Drawer(), // في بدايته علي اليسار قبل العنوان appbar اول لما نضيفها بتظهر داخل ال
        // endDrawer:Drawer(), // يعني اقصي اليمين appbar نفس القائمة ولكن بتظهر في نهاية ال
        // يمين والعكس لو اللغة عربي endDrawer يسار و drawer بيكون بناءً علي لغة التطبيق يعني لو انجليزي هيبقي ال drawer اتجاه ال
        // appbar بره ال drawer عشان يوصلنا لل scaffoldkey او مش موجود عندي بار اصلا وقتها لازم نعمل appbar في حالة انه يكون بره ال drawer طب لو احنا عايزين نعمل
        // drawer: Drawer(), // دي اللي هتشتغل مع الزرار اللي عملناه تحت
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // عن طريق المفتاح اللي عملناه drawer هنعمل زرار يقدر يوصل لل
              // عشان الزرار يوصلها scaffold جوه ال drawer:Drawer(), وعشان الزرار يشتغل لازم نضيف
              Center(
                // Center : Creates a widget that centers its child / بتخلي عناصرها في النص
                child: MaterialButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    // drawer هنستخدم المفتاح اللي عملناه عشان نفعل ال
                    scaffoldkey.currentState!.openDrawer();
                    // scaffoldkey.currentState!.openEndDrawer();
                  },
                  child: Text("Open Drawer"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ====================== tabbar =======================
/*
// TabBar Widget ==> AppBar هي الجزء السفلي من ال
// DefaultTabController(length: length, child: Scaffold ..code..   تسمي Widget يكون داخل Scaffold عشان نقدر نستخدمها فلازم ال
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
  // ============== DefaultTabController طريقة بديلة ل ==================== start
  /*
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController? tabController; // عملنا المتحكم الخاص بالتاب بار
  @override
  void initState() {
    // دي دالة بتشتغل مع الصفحة مباشرة ويفضل اٍعطاء قيمة ابتدائية للمتغيرات بداخلها
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  // bottom: TabBar , TabBarView جوه ال controller:tabController كده اللي فاضل اننا نعمل
  */
  // ============== DefaultTabController طريقة بديلة ل ==================== end

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // =========== DefaultTabController طريقة ال ============== start

      // Widget DefaultTabController(length: number of elements, child: Scaffold()) ==> tabbar المتحكم بال
      home: DefaultTabController(
        // عادي scaffold في حالة الطريقة البديلة هنشيلها ونحط مكانها
        // فيها 3 مزايا وهم : length , child , initialIndex: وبتبدا من 0 وبتعني مين التاب اللي هتشتغل اول لما التطبيق يفتح
        initialIndex: 2, // pc التطبيق هيفتح علي تاب 3 اللي هي ال
        // length : The total number of tabs / tabbar عدد العناصر في ال
        length: 3,
        child: Scaffold(
          // =========== DefaultTabController طريقة ال ============== end
          // ============== الطريقة البديلة ============== start
          // home: Scaffold(
          // ============== الطريقة البديلة ============== end
          appBar: AppBar(
            title: Text('tabbar'),
            // bottom في خاصية اسمها appbar جوه ال tabbar بنضيف ال
            // bottom : This widget appears across the bottom of the app bar / appbar محتواها بيظهر اسفل ال
            bottom: TabBar(
              // ============ الطريقة البديلة ========== start
              // controller: tabController, // DefaultTabController دا المتحكم بتاع الطريقة البديلة لل
              // ============ الطريقة البديلة ========== end              // ==================== خواص التاب بار =============== start
              // TabBar(tabs: [widgets]) ==> Typically a list of two or more [Tab] widgets / Tab() widgets قائمة من 2 او اكتر من ال
              // اللي هو الخط اللي بيظهر تحت التاب اللي اخترناها وواقفين عندها indecator هتعرف علي الخواص وهنبدا بال
              indicatorColor: Colors.amber, // لون الخط
              indicatorWeight: 10, // سُمك الخط
              // labelColor: The color of selected tab labels.
              labelColor: Colors
                  .blue, // مكانتش موجودة unselectedLabelColor لو selected , unselected هتاخد اللون الازرق في حالة ال
              // labelStyle: The text style of the selected tab labels.
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ), // النص هياخد حجم 15 وهيكون عريض selected في حالة ال
              // unselectedLabelColor: The color of unselected tab labels.
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(
                fontSize: 10,
              ), // النص هياخد حجم 10 unselected في حالة ال
              // ==================== خواص التاب بار =============== end
              tabs: [
                // Tab() Widgets : Creates a Material Design [TabBar] tab / اللي بنستعملها هنا standard دي هي ال
                // length: 3, لان انا محدده في ال TabBar جوه ال Tab() لازم يبقي عندي 3
                // Tab(child: Text('laptop')), // اسم التاب الاولي
                // Tab(child: Text('mobile')), // اسم التاب الثانية
                // Tab(child: Text('pc')), // اسم التاب الثالثة
                // ممكن نخلي التابات عبارة عن ايقونة ونص مع بعض
                Tab(
                  // =========== خواص التاب ========== start
                  // iconMargin: EdgeInsets.all(10), // الازاحة او التباعد بين عناصر التاب
                  // =========== خواص التاب ========== end
                  icon: Icon(Icons.laptop),
                  text: 'laptop',
                ), // التاب الاولي
                Tab(
                  icon: Icon(Icons.mobile_friendly),
                  text: 'mobile',
                ), // التاب الثانية
                Tab(
                  icon: Icon(Icons.desktop_mac_outlined),
                  text: 'Pc',
                ), // التاب الثالثة
                // TabBarView كل اللي عملناه دا مش بنستفاد منه من غير ال
              ],
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: TabBarView(
              // ============ الطريقة البديلة ========== start
              // controller: tabController, // DefaultTabController دا المتحكم بتاع الطريقة البديلة لل
              // ============ الطريقة البديلة ========== end
              // عشان تعرضلنا محتوي التابات اللي عملناها column ,row زي ال
              children: [
                // TabBarView : Creates a page view with one child per tab / widget فيها مجموعة من ال list هي عبارة عن
                // عشان ميحصلش خطأ length: 3, لازم نلتزم بعدد التابات اللي حددناها اللي هي
                // هنا الترتيب مهم بمعني ان العنصر الاول في التاب بار مرتبط بالعنصر الاول بالتاب بار فيو وهكذا
                Text('laptop page'), // محتوي التاب الاولي
                Column(
                  // محتوي التاب الثانية
                  children: [
                    Text('mobile page'),
                    Padding(padding: EdgeInsets.all(10)),
                    MaterialButton(
                      onPressed: () {
                        // tabController!.animateTo(2); // للانتقال بين الصفحات
                      },
                      child: Text('Go To Pc'),
                    ),
                  ],
                ),
                Column(
                  // محتوي التاب الثالثة
                  children: [
                    Text('pc page'),
                    Padding(padding: EdgeInsets.all(10)),
                    Text('the image below is an example of tabbar'),
                    Padding(padding: EdgeInsets.all(20)),
                    Image.asset('lib/images/tabbar.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
// ====================== BottomNavigationBar =======================
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
  int selectedIndex = 0;
  List<Widget> listwidget = [
    Text('This Is Home Page', style: TextStyle(fontSize: 30)),
    Text('This Is Settings Page', style: TextStyle(fontSize: 30)),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // BottomNavigationBar ==> A bottom navigation bar to display at the bottom of the scaffold / وبيظهر اسفل الصفحة في اخرها من تحت scaffold بنضيفه جوه ال
        // List<BottomNavigationBarItem> items ==> BottomNavigationBarItem(icon: icon,label:text) من list بتاخد
        bottomNavigationBar: BottomNavigationBar(
          // ============= الخواص ================ start
          // currentIndex: 0, // active هو اللي Home يعني العنصر الاول اللي هو
          // currentIndex: 1, // active هو اللي Settings يعني العنصر الثاني اللي هو
          onTap: (value) {
            setState(() {
              print(value);
              // index 1 وهي بتاخد settings وال index 0 وهي بتاخد Home عشان نشوف ال
              selectedIndex = value;
              // عند الضغط Home , Settings عشان ينقلنا بين ال
            });
          },
          currentIndex: selectedIndex,
          // backgroundColor: Colors.amber,
          // selectedItemColor: Colors.red,
          // unselectedItemColor: Colors.blueGrey,
          // selectedFontSize: 20,
          // unselectedFontSize: 14,
          // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          // ============= الخواص ================ end
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        appBar: AppBar(title: Text('BottomNavigationBar')),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          child: listwidget.elementAt(selectedIndex),
        ),
        // BottomNavigationBar بتاع عناصر ال index من خلال listwidget عشان يعرض عناصر ال
      ),
    );
  }
}
*/

// ====================== SnackBar ==========================
/*
  // ScaffoldMessenger,SnackBar ==> it used to show a beautiful message for user from button
  void showSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
*/
// ====================== PageView & PageViewBuilder =======================

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
  List imagesname = [
    'lib/images/1668274839664.jpg',
    'lib/images/ahmed_img.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('PageView & PageViewBuilder')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // PageView() : Creates a scrollable list that works page by page from an explicit [List] of widgets
              // عند عملها يفضل ان تكون داخل حاوية بطول محدد عشان ميحصلش اخطاء زي انها تاخد طول لا نهائي
              SizedBox(
                height: 300,
                // ================ PageView ================= start
                /*
                child: PageView(
                  // ========== الخواص ========== start
                  onPageChanged: (value) {
                    print(value);
                    // PageView بين عناصر ال scroll عند عمل index بترجعلي ال
                  },
                  reverse: true, // من اليمين لليسار او العكس scroll بتعكس اتجاه ال
                  // physics: NeverScrollableScrollPhysics(), // scroll بتعطل ال
                  // ========== الخواص ========== end
                  children: [
                    // Text('Page View 1'),
                    // Text('Page View 2'),
                    Image.asset(
                      'lib/images/1668274839664.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset('lib/images/ahmed_img.jpg', fit: BoxFit.cover),
                  ],
                ),
                */
                // ================ PageView ================= end
                // ================ PageView.builder ================= start
                // PageView.builder ==> loop + PageView عبارة عن
                child: PageView.builder(
                  // itemCount: 2, // PageView عدد عناصر ال
                  itemCount: imagesname.length, // PageView عدد عناصر ال
                  itemBuilder: (context, index) {
                    return Image.asset(imagesname[index],fit: BoxFit.cover,);
                    // PageView.builder عن طريق ال index من خلال ال imagesname بتظهر لنا كل عناصر ال loop كده احنا عملنا
                  },
                ),
                // ================ PageView.builder ================= end
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
// ====================== custom widget Shortcut =======================
/*
import 'package:flutter/material.dart';
// import 'package:flutter_learning/customcard.dart'; // lib folder دي صيغة استدعاء الملفات من
import 'customcard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('custom widget Shortcut')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // هنتعرف علي مبدأ الاختصار بمعني لو انا عندي خانات تعريفية لعدة مستخدمين زي كده ف دا تكرار كتير لنفس الكود
              // Card(
              //   child: ListTile(
              //     title: Text('ahmed'),
              //     subtitle: Text('ahmed@gmail.com'),
              //     // trailing: A widget to display after the title
              //     trailing: Text('2025-7-6'),
              //   ),
              // ),
              // Card(
              //   child: ListTile(
              //     title: Text('youssef'),
              //     subtitle: Text('youssef@gmail.com'),
              //     // trailing: A widget to display after the title
              //     trailing: Text('2025-7-6'),
              //   ),
              // ),
              // Card(
              //   child: ListTile(
              //     title: Text('ali'),
              //     subtitle: Text('ali@gmail.com'),
              //     // trailing: A widget to display after the title
              //     trailing: Text('2025-7-6'),
              //   ),
              // ),
              // وفيها كود ثابت عشان نستخدمها عدد المرات اللي احنا عايزينه statelesswidget بترث Widget CustomListtile والتكرار دا مش احسن حاجة في البرمجة ف احنا هنعمل تحت
              CustomListtile(
                // دي اللي انشاناها تحت اختصرت عليا وقت وجهد وعدم تكرار الكود Widget ال
                name: "ahmed",
                email: 'ahmed@gmail.com',
                date: '2025-7-6',
                imagename: 'ahmed_img',
              ),
              CustomListtile(
                name: "youssef",
                email: 'youssef@gmail.com',
                date: '2025-7-6',
                imagename: '1668274839664',
              ),
              CustomListtile(
                name: "ali",
                email: 'ali@gmail.com',
                date: '2025-7-6',
                imagename: 'ahmed_img',
              ),
              CustomListtile(
                name: "wael",
                email: 'ali@gmail.com',
                date: '2023-1-1',
                imagename: '1668274839664',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import اللي هيبقي فيها الكود اللي هيتكرر سواء عملناها هنا او في ملف لوحدها ونعمله Widget CustomListtile هنا هنعمل ال
// فهنستدعيها كدا بس هعلق دي الاول folder lib لو كنا عاملينها في
// import 'package:flutter_learning/customcard.dart';

// class CustomListtile extends StatelessWidget {
//   final String name;
//   final String email;
//   final String date;
//   final String imagename;
//   const CustomListtile({
//     super.key,
//     required this.name,
//     required this.email,
//     required this.date,
//     required this.imagename,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.amber,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             SizedBox(
//               height: 70, // طول الصورة
//               width: 70, // عرض الصورة
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(70),
//                 child: Image.asset(
//                   'lib/images/$imagename.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Expanded(
//               // عشان تاخد الابعاد المناسبة ليها وميحصلش مشكلة Expanded حطينا الصورة جوه ال
//               child: ListTile(
//                 title: Text(name),
//                 subtitle: Text(email),
//                 trailing: Text(date),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
*/
// ====================== Navigator =======================
/*
// هنتعرف علي كيفية الانتقال بين الصفحات
// Widget لان في فلاتر كل حاجة عبارة عن custom Widget او shortcut الصفحة عبارة عن
import 'package:flutter/material.dart';
import 'package:flutter_learning/about_us.dart';
import 'package:flutter_learning/contact.dart';
import 'package:flutter_learning/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(
      // appBar: AppBar(title: Text('Navigator'),),
      // ),
      home: Homepage(), // يعني هي الصفحة اللي هيبدأ منها التطبيق home: ال
      // AboutUs وظيفته انه ينقلني لصفحة ال Homepage فهعمل زرار في اخر صفحة ال AboutUs لصفحة ال Homepage لو انا عايز انتقل من صفحة ال
      // Navigator عشان ننتقل من صفحة لصفحة هنستعمل ال
      // Navigator push ==> أول نوع
      // context ==> tree بال Widget تشير الي السياق اللي هو مكان ال
      // وتتفرع هذه الشجرة بناءً علي عدد الصفحات الموجودة عندك materialapp وتحديدا من ال main تبدا من ال Widgets فلاتر بشكل عام عبارة عن شجرة من ال
      // .push ==> جوه الصندوق بتاع الصفحات بتاعي Widget وظيفتها انها تضيف
      // .push(MaterialPageRoute ==> back فبالتالي بقدر اشوفها لان هي اللي فوق وبقدر احذفها او اشيلها تاني لما ارجع لوره عن طريق زرار ال Homepage عشان انتقل لصفحة ما عن طريق اضافتها فوق الصفحة الرئيسية اللي عندي اللي هي ال
      // MaterialPageRoute ==> اللي هنتقلها widget عشان احدد من خلالها ال
      // Navigator.of(context,).push(MaterialPageRoute(builder: (context) => AboutUs()));
      // Navigator pushReplacement ==> ثاني نوع
      // اٍلا لو فيه اكتر من صفحة عندي فوق الصفحة الرئيسية وانا استبدلت صفحة بصفحة تانية فوق الرئيسية back ودي مش بتضيف صفحة فوق الصفحة الرئيسية بل بتستبدل الصفحة الرئيسية بالصفحة اللي انا عايز اعرضها واللي بعد استبدالها بقت هي الصفحة الرئيسية يعني مفيش زرار ال
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AboutUs(),));
      // Navigator pop ==> ثالث نوع
      // about_us هننشأه جوه ال
      // Navigator push اللي موجود في ال back مبدأ عملها بيعتمد علي الحذف بمعني انها بتحذف الصفحة اللي فوق الصفحة الرئيسية وبالتالي بترجعني تاني للصفحة الرئيسية عاملة زي زرار الايقونة بتاع ال
      // Navigator.of(context).pop();
      // Navigator pushAndRemoveUntil ==> رابع نوع
      // فكرتها انها بتنقلني علي صفحة مقابل انها تحذف جميع الصفحات الموجودة قبلها
      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AboutUs(),),(route) => false,);
      // ========= المقارنة ========== ###
      // push ==> اضافة صفحة فوف صفحة اخري add بمعني
      // pushReplacement ==> استبدال صفحة بصفحة اخري replace بمعني
      // push pop ==> وبعد الحذف طبعا بيرجع للصفحة السابقة remove , delete بمعني
      // pushAndRemoveUntil ==> بتنقلني علي صفحة مقابل حذف جميع الصفحات الموجودة قبلها
      // ========= المقارنة ========== ###
      // ################# push & pushReplacement طريقة اختصار الكود داخل ال #####################
      
      // طريقة هتخلي الكود منظم اكتر واوضح
      // routes: {}, خاصية اسمها ال MaterialApp هنضيف داخل ال
      // MaterialApp اللي جوه ال routes ولكن بتتناسب مع الصفحات المعرفة في ال push , pushReplacement وهي هي ال pushNamed("String Key(routeName)") , pushReplacementNamed("String Key(routeName)") وبستعمل معاها ال
      routes: {
        // Map {string key : Widget Function(BuildContext) value} بتقبل routes:
        'home': (context)=> Homepage(),
        'about us': (context)=> AboutUs(),
        'contact' :(context)=> Contact(),
      },
      // Navigator.of(context,).pushNamed('about us');
      // pushNamed(String routeName, {Object? arguments})
      // pushNamed ==> Push a named route onto the navigator.
      // pushReplacement ولكن بدل ال pushNamed زي pushReplacementNamed طريقة ال
      // Navigator.of(context).pushReplacementNamed('contact');

      // ################# push & pushReplacement طريقة اختصار الكود داخل ال #####################
    );
  }
}
*/
// ====================== showDialog =======================
/*
// بشكل عام dialog او alert هنتعرف علي كيفية انشاء
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('showDialog')),
        body: ListView(
          children: [
            // بشكل عام dialog او alert هعمل زرار عند الضفط عليه هيظهرلي
            Center(
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  // عند الضغط عليه Alert عشان يظهرلي showDialog هنستعمل دالة اسمها
                  // context ==> Widget build(BuildContext context) اللي بناخدها من ال
                  // builder ==> AlertDialog() اللي هي Widget وبترجع context عبارة عن دالة من نوع
                  showDialog(
                    barrierDismissible:
                        false, // فمش بتشيله false شيله اما اذا كان dialog وتعني عند الضغط علي اي مكان خارج ال true الافتراضي لها
                    context: context,
                    builder: (context) => AlertDialog(
                      // مش بتظهر من غير ما احنا بنضيفلها خواص لان هي فارغة حاليا فلازم نضيفلها خواص AlertDialog() ال
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(50),
                      ),
                      // icon: ,
                      title: Text('warning'),
                      // titlePadding: ,
                      // titleTextStyle: TextStyle(fontSize: 20,color: Colors.black),
                      content: Text('Are You Sure ?'),
                      contentPadding: EdgeInsets.only(top: 10),
                      actions: [
                        // أهم خاصية
                        TextButton(
                          onPressed: () {
                            print('OK');
                          },
                          child: Text('OK'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Navigator.of(context).pop(); ==> تعتبر صفحة فهيتم اٍلغائها وترجعني للصفحة السابقة alert بمعني اٍلغاء لان ال
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('show Alert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
// ====================== SnackBar & showBottomSheet =======================
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
  // showBottomSheet اللي هيوصلنا ل scaffold key هنعمل
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: Text('SnackBar & showBottomSheet')),
        body: ListView(
          children: [
            // $$$$$$$$$$$$$$$$$$$$ showBottomSheet $$$$$$$$$$$$$$$$$$$$$$$ start
            Center(
              child: MaterialButton(
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  // showBottomSheet ==> ولكن بيظهر من الاسفل الي الاعلي Drawer عبارة عن
                  // showBottomSheet((context) => انا عايزها Widget بترجعلي اي ,);
                  // بتاعنا Drawer اللي هو ال showBottomSheet عشان نستعمله في اظهار ال scaffold key لازم نعمل
                  // scaffoldKey.currentState!.showBottomSheet(
                  //   (context) => Container(
                  //     height: 100,
                  //     width: 1000,
                  //     color: Colors.amber,
                  //   ),
                  // =============== هنعمل مثال بيحاكي الواقع =================
                  // المثال هو انت عايز تختار الصورة منين ؟ من الكاميرا ولا من المعرض
                  scaffoldKey.currentState!.showBottomSheet(
                    (context) => Container(
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 1000,
                      color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Choose image :',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'From Gallery',
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                          Text(
                            'From Camera',
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    // =============== عملنا المثال اللي بيحاكي الواقع =================
                  );
                },
                child: Text('show'),
              ),
            ),
            // $$$$$$$$$$$$$$$$$$$$ showBottomSheet $$$$$$$$$$$$$$$$$$$$$$$ end
            SizedBox(width: 10, height: 10), // المساحة بين الزرارين
            // $$$$$$$$$$$$$$$$$$$$ SnackBar $$$$$$$$$$$$$$$$$$$$$$$ start
            Center(
              child: MaterialButton(
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  // SnackBar لو احنا عايزين نظهر ال
                  // SnackBar ==> عبارة عن رسالة بتظهر لمدة قصيرة زي 2 ثانية وبتختفي لوحدها وبتاخد اللون الاسود كلون افتراضي
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content)) ==> طريقة استخدامها
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      // action : An action that the user can take based on the snack bar
                      // SnackBarAction ==> معين action بيعمل SnackBar بيظهر كزرار في ال
                      // label:String title ==> The button label اللي هو العنوان
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                          print('action');
                        },
                      ),
                      duration: Duration(
                        seconds: 3,
                      ), // للتحكم بمدة ظهورها اٍلي 3 ثوان
                      // content : widget أهم خاصية <== بتقبل
                      content: Text('تم النسخ بنجاح'),
                    ),
                  );
                },
                child: Text('copy'),
              ),
            ),
            // $$$$$$$$$$$$$$$$$$$$ SnackBar $$$$$$$$$$$$$$$$$$$$$$$ end
          ],
        ),
      ),
    );
  }
}
*/
// ====================== Example : Ecommerce ui =======================
/*
import 'package:flutter/material.dart';
import 'package:flutter_learning/Ecommerce%20ui%20Example/homepage%20Ecommerce.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomepageEcommerce(),
    );
  }
}
*/
// ====================== List generate =======================
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
  List username = [
    {'name': 'Ahmed', 'age': 21},
    {'name': 'Ali', 'age': 15},
    {'name': 'Taha', 'age': 26},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('List generate')),
        body: ListView(
          children: [
            // List generate فهنستعمل ال ListView.builder من غير منكرر الكود ومن غير منستعمل ال List username عايزين نطبع عناصر ال
            // هنا احنا كررنا الكود ومش دا اللي احنا عايزينه
            // Card(child: ListTile(title: Text(username[0]["name"]))),
            // Card(child: ListTile(title: Text(username[1]['name']))),
            // Card(child: ListTile(title: Text(username[2]['name']))),
            // ... وعشان نحل المشكلة دي هنضيف قبلها list جوه list وانا مينفعش اضيف list عبارة عن list genetate تعتبر
            // List.generate(length عدد مرات التكرار,(index){}) ==> for loop بتعملنا تكرار وترجع قيمة ما زي ال
            ...List.generate(username.length, (index) {
              return Card(
                child: ListTile(title: Text(username[index]["name"])),
              );
            }),
            // هنعمل واحدة كمان تطبع لنا السنين من 1900 لحد 2025
            ...List.generate(126, (i) => Text("${i + 1900}")),
          ],
        ),
      ),
    );
  }
}
*/
// ====================== initState & dispose =======================
/*
import 'package:flutter/material.dart';
import 'package:flutter_learning/initState%20&%20Dispose/homepage.dart';
import 'package:flutter_learning/initState%20&%20Dispose/pageOne.dart';
import 'package:flutter_learning/initState%20&%20Dispose/pageTwo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // اللي هي جاية منها او مكتوبة فيها تشتغل StatefulWidget في حال وجودها يعني بتتنفذ مباشرة أول لما ال StatefulWidget عند الدخول علي initial state بيتم استدعاء ال
  // void هي عبارة عن دالة مبترجعش قيمة يعني من نوع initState ال
  @override
  void initState() {
    print('InitState in main');
    super.initState();
  }

  // stack لاٍنها بتتنفذ مباشرة عند حذف صفحة من ال Dispose هي ال InitState عكس ال
  @override
  void dispose() {
    print("the main can't deleted from the stack");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeinitState(),
      routes: {
        'home': (context) => HomeinitState(),
        'pageone': (context) => Pageone(),
        'pagetwo': (context) => Pagetwo(),
      },
    );
  }
}
*/
// ====================== Widget Popup Menu Button =======================
/*
// عبارة عن زرار ال 3 نقط فوق بعض
// PopupMenuButton ==> أو اي مكان AppBar أو ListView نقدر نستعملها في اي مكان سواء جوه ال
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PopupMenuButton'),
          // actions: [] ==> A list of Widgets to display in a row after the [title] widget.
          actions: [
            PopupMenuButton(
              //دا الزرار
              // color: ,
              // icon: ,==> لو احنا عايزين نغير الايقونة من 3 نقط الي اي حاجة تانية
              // iconSize: ,
              onOpened: () {
                // دي دالة بتشتغل عند الضغط علي الزرار نفسه اللي هو ال3 نقط فوق بعض
                print('button is open');
              },
              onCanceled: () {
                // دي دالة بتشتغل عند اغلاق الزرار زي الخروج منه او الضغط علي اي مكان بعيد عن الزرار عشان نخرج منه
                print('button is canceled');
              },
              onSelected: (value) {
                // دي دالة بتشتغل عند اختيار عنصر
                // بتعرفني ايه هو العنصر اللي انا اخترته عن طريق انها بترجعلي قيمته
                print(value);
              },
              // itemBuilder(context)=>[العناصر] ==> المنشئ للعناصر بتاعت الزرار
              itemBuilder: (context) => [
                // PopupMenuItem وظيفتها ==> Creates an item for a popup menu.
                // PopupMenuItem(child:any Widget , value: onSelected وبنستخدمها مع ال child قيمة العنصر اللي في ال)
                PopupMenuItem(
                  onTap: () {
                    // عشان اعرف اي العنصر اللي انا اخترته onSelected  دي طريقة تانية بدل ال
                    print('one');
                  },
                  value: 'one is selected',
                  child: Text('One'),
                  // textStyle: ,
                ),
                PopupMenuItem(
                  onTap: () {
                    print('two');
                  },
                  value: 'two is selected', child: Text('Two')),
              ],
            ),
          ],
        ),
        body: ListView(children: []),
      ),
    );
  }
}
*/
// ====================== SearchDelegate =======================
/*
// SearchDelegate ==> مجموعة ادوات جاهزة من فلاتر بتساعدنا علي عمل بحث بطريقة احترافية
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SearchDelegate'),
          actions: [
            IconButton(
              onPressed: () {
                // showSearch اسمها built-in function هنستعمل SearchDelegate عشان نقدر نشغل ال
                // showSearch ==> مخصص للبحث TextFormField عبارة عن
                // context ==> (widget tree) باي مكان بالشجرة widget بتحددلي موقع ال
                // delegate ==> خاصة بيا SearchDelegate فلازم ابني SearchDelegate بتكون من نوع
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: ListView(children: []),
      ),
    );
  }
}

// showSearch بتاعتي اللي هستعملها في دالة ال SearchDelegate هنا هبني ال
class CustomSearch extends SearchDelegate {
  // SearchDelegate في ال built-in والمتغير دا query بتتخزن ضمن متغير اسمه SearchField اي حاجة احنا بنكتبها جوه خانة ابحث او

  List username = [
    'ahmed',
    'wael',
    'basel',
    'mohammed',
    'yaser',
    'shady',
    'mohand',
    'majed',
  ];
  List? filterlist = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // List<Widget>? وبترجع buttons يعني هي عبارة عن مكان اقدر اضيف فيه مجموعة من ال appbar اللي موجودة بال actions زي ال
    // بيظهر يمين خانة البحث
    return [
      IconButton(
        onPressed: () {
          query = "";
          // اللي هو خانة البحث نفسها TextFormField الخاصة بهذا ال TextEditingController هي ال query نقدر نعتبر ال
          // ويمسح المعلومات اللي فيها وبالتالي خانة البحث هترجع فاضية تاني query هيفرغ ال close بمعني عند الضغط علي الايقونة
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // علي اليسار title اللي هو كان حاجة بتظهر قبل ال appbar الموجودة بال leading هي نفسها ال
    // بيظهر يسار خانة البحث
    return IconButton(
      onPressed: () {
        close(context, null);
        // SearchDelegate عند الضغط علي الايقونة هتقفلي ال
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // هي نتيجة البحث
    // الكود اللي جواها بيتنفذ عند اختيار الحاجة اللي انا بحثت عليها
    return Text("Your Choice is: $query"); // هيطبع نتيجة البحث
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // SearchDelegate الخاص ب body هي ال
    // واللي هيظهر فيها اقتراحات البحث SearchDelegate هي المحتوي الخاص بصفحة ال
    if (query == "") {
      // كانت فاضية نفذ الكود دا اللي هو هيظهر جميع الاسماء query لو ال
      return ListView.builder(
        itemCount: username.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showResults(context); // query النتيجة بتتخزن جوه ال
              // query عند البحث عن شيئ واختيار عنصر هتتنفذ الدالة دي ووظيفتها انها تعرضلي النتيجة عن طريق تخزينها جوه ال
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(username[index], style: TextStyle(fontSize: 20)),
              ),
            ),
          );
        },
      );
    } else {
      // عشان تتم عملية البحث باي حاجة المستخدم بيكتبها query والقيمة دي اللي هي اي حاجة بتنكتب في خانة البحث واللي بتتحقظ في ال filerlist مش فارغة اول حاجة اٍسند قيمة لل query لو ال
      // filterlist اللي اتخزنت في query لانها اتخزنت في ال ah فهو هيرجعلي اي حاجة بتحتوي علي ah بمعني لو انا كتبت في خانة البحث
      // contains ==> بمعني بيحتوي
      filterlist = username.where((element) => element.contains(query)).toList();
      // filterlist = username.where((element) => element.startsWith(query)).toList();
      // startsWith ==> بمعني تبدأ ب
      // اللي هي الحاجة اللي هتنكتب في خانة البحث query بمعني اي عنصر بيبدا بال contains بدل ال startsWith ممكن نستعمل
      return ListView.builder(
        itemCount: filterlist!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showResults(context);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(filterlist![index], style: TextStyle(fontSize: 20)),
              ),
            ),
          );
        },
      );
    }
  }
}
*/
// ====================== scroll =======================
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
  // initState وهنسندله قيمة في ال ListView الخاص بال controller هنا هنعمل ال
  late ScrollController scrollController;
  // اللي انا عامله scroll دا في اني اعرف عدد ال controller ممكن نستفيد من ال
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      print(
        scrollController.offset,
      ); // offset ==> بالصفحة وبيتأثر بعدد العناصر و اٍرتفاعها scroll بمعني مقدار ال
    });
    super.initState();
  }

  @override
  void dispose() {
    // memory عشان نخفف الضغط من علي الجهاز وميحصلش مشاكل بال dispose بننشأه ايا كان نوعه او لايه لازم نعمله controller اي
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('scroll'), actions: []),
        body: ListView(
          // scroll هي اللي بتولد او بتنشئ ال ListView لان في هذا المثال ال controller for listview الخاص باصفحة فلازم اعمل scroll عشان اقدر اتحكم بال
          controller: scrollController,
          children: [
            // بالصفحة ممكن يفيدني في اني اروح لنقطة معينة في الصفحة عن طريق مقداره زي كده scroll معرفة مقدار ال
            Container(
              margin: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  // scrollController.jumpTo(9496.0);
                  // jumpTo ==> بتنقلني بشكل آني او لحظي يعني مفيش اي رسوم متحركة بتفهمني اٍني بنتقل
                  // animateTo ==> animation بتنقلني مع
                  // animateTo(offset: scroll مقدار ال , duration: الوقت المستغرق للانتقال , curve: طريقة الانتقال )
                  scrollController.animateTo(
                    9496.0,
                    duration: Duration(seconds: 2),
                    curve: Curves.ease,
                  );
                },
                child: Text('Jump To Bottom'),
              ),
            ),
            // هنعمل المثال اللي هنشتغل بيه اللي هو عملية تكرار للارقام من 0 : 99
            ...List.generate(
              100,
              (index) => Container(
                alignment: Alignment.center,
                height: 100,
                color: index.isEven ? Colors.amber : Colors.blueGrey,
                child: Text("$index", style: TextStyle(fontSize: 25)),
              ),
            ),
            // scroll هنعمل زرار كمان عشان ينقلني لاعلي الصفحة عن طريق المقدار بتاع ال
            Container(
              margin: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  // scrollController.jumpTo(0);
                  scrollController.animateTo(
                    0,
                    duration: Duration(seconds: 2),
                    curve: Curves.ease,
                  );
                },
                child: Text('Jump To Top'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
// ====================== package =======================
/*
// وكيفية استخدامها package هنتعرف علي ال
// ل 3 أنواع رئيسية package هنقسم ال
// package عشان نستعمل كل الخدمات دي ف احنا محتاجين ال local data base وقاعدة بيانات محلية sqlite النوع الاول هو النوع اللي بيتعلق بالخدمات زي خرائط جوجل و
// الجهاز اللي بنستعمله زي الوايفاي والبلوتوث hardware النوع الثاني اللي بيتعامل مع
// مع انيميشن معين مع لون مع شوية اضافات ثابتة ليه botton navigation bar النوع الثالث عبارة عن اختصار بنعني ان انا بعمل اختار لشوية اضافات لحاجة انا عملتها عشان استعملها بعدين في اي مشروع زي مثلا
// flutter pub add awesome_dialog ==> command line من ال package طريقة اضافة ال
// وعلي نفس المحاذاة زي كدا cupertino_icons: ^1.0.8 بعد خانة ال pubspec.yaml في ملف ال package تتم اضافة ال
// cupertino_icons: ^1.0.8
// awesome_dialog: ^3.2.1
// awesome_dialog: ^3.2.1 مباشرة اللي هو السطر دا cupertino_icons: ^1.0.8 برقم الاصدار بتاعها تحت ال package عن طريق اضافة اسم ال command line وطبعا نقدر نضيفها من غير ال
// لمشروعنا package ويعيد انشائه بعد اضافة ال build عشان يحذف مجلد ال flutter pub get والثاني flutter clean هننفذ الامرين دول اللي هما : الاول package بعد اضافة اي
// عادي زي كده package ثم يتم استدعاء ال
import 'package:awesome_dialog/awesome_dialog.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("package"), actions: []),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60),
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    animType: AnimType.rightSlide,
                    title: 'Dialog Title',
                    desc: 'Dialog description here.............',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                },
                child: Text('show dialoge'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
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
// ====================== drop_down_list Search =======================
/*
// بتظهر من اسفل لاعلي وبتحتوي علي حقل بقدر من خلاله اعمل بحث dropdown هي عبارة عن
// flutter pub add drop_down_list ===> cupertino_icons: ^1.0.8 تحت ال drop_down_list: ^2.0.0 لاضافتها او اضافة
import 'package:flutter/material.dart';
import 'package:flutter_learning/dropdownlist/homepagedropdown.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Homepagedropdown();
  }
}
*/
// ====================== package SharedPreferences =======================
/*
// package SharedPreferences ==> (cash memory) وظيفتها انها طريقة لحفظ الداتا في ذاكرة الجهاز عندي والداتا دي مش بتتشال غير لما يتم تنظيف الذاكرة المؤقتة عندي
// كل مرة login بدل ميفتح صفحة ال home page عشان البيانات تفضل محفوظة عندي حتي لو قفلت التطبيق فبالتالي لما افتح التطبيق ياخدني مباشرة علي صفحة ال login بنستخدمها في حال ال

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("SharedPreferences")),
        body: ListView(
          children: [
            MaterialButton(
              onPressed: () async {
                // Future بتروح تتصل بذاكرة الجهاز وبالتالي تستغرق وقت يعني من نوعSharedPreferences عشان ال async,await عملنا
                // SharedPreferences.getInstance() وبياخد قيمة اسمها SharedPreferences ومن نوع sharedPreferences عملنا متغير اسمه
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                // sharedPreferences.setString(key,value);==> لتثبيت وتعيين قيمة ما لمتغير عندي عشان ميتغيرش لما التطبيق يتفتح تاني
                // null القيمة الابتدائية للمتغير بتساوي
                sharedPreferences.setString("name", "ahmed");
              },
              child: Text("Set Name"),
            ),
            MaterialButton(
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                // sharedPreferences.getString(key) ==> عشان استقبل قيمة المتغير اللي انا ثبتت قيمته
                String name = sharedPreferences.getString("name")!;
                print(name);
              },
              child: Text("Print Name"),
            ),
          ],
        ),
      ),
    );
  }
}
*/
// ====================== Custom Font =======================
/*
// للتطبيق عندنا في حال لو انا عايز استعمل نوع من الخطوط الخارجية Font هنتعرف علي كيفية اضافة
//  .ttf والخط بينتهي ب fonts ثم اضافته لمجلد احنا عاملينه وليكن اسمه download family عن طريق اختيار نوع الخط ثم تحميل من google fonts بنحمل نوع الخط اللي احنا عايزينه من
// Fonts تحت خانة ال pubspec.yaml وبعد كده بنضيفه لملف ال
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // لو احنا عايزين نستعمل نوع الخط دا علي مستوي التطبيق كله فهنعمل الاتي
      theme: ThemeData(
        fontFamily: "Manufacturing"
        // بكده التطبيق كله هياخد الخط دا
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Font")),
        body: ListView(
          children: [
            // مع اي نص احنا بنكتبه ودا بيكون استعمال علي مستوي نص معين وليس التطبيق ككل fontFamily بنضيفه في خانة ال pubspec.yaml في ملف ال Fonts اللي تحت ال family ثم بنضيف اسم الخط اللي ضفناه في ال
            // Text("How Are You",style: TextStyle(fontSize: 30,fontFamily: "Manufacturing"),), ==> في حالة لو نوع الخط علي مستوي نص معين فقط وليس التطبيق ككل
            Text("How Are You",style: TextStyle(fontSize: 30,),)
          ],
        ),
      ),
    );
  }
}
*/
// ====================== Theme =======================
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // من خلاله نقدر نتحكم بالخواص بتاعت التطبيق بشكل كامل زي اختيار نوع الخط او لو انا عندي 50 آب بار وعايز اديهم لون احمر فهل هروح لكل واحد واديله لون احمر ف اكيد لا
        // يعني اي تعديل هنا بيكون علي مستوي التطبيق كله
        textTheme: TextTheme(
          // علي سبيل المثال هنعمل شوية خطوط فيها خواص معينة بحيث اقدر استخدمها في اي مكان مباشرة
          bodyLarge: TextStyle(fontSize: 40,color: Colors.blue),
          bodyMedium: TextStyle(fontSize: 30,color: Colors.green,fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 20,color: Colors.amber),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
          // هنعمله في اي صفحة هياخد بشكل تلقائي اللون الاحمر appbar كده اي
        )
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Theme")),
        body: ListView(
          children: [
            Text("How Are You",style: Theme.of(context).textTheme.bodySmall,),
            Text("How Are You",style: Theme.of(context).textTheme.bodyMedium,),
            Text("How Are You",style: Theme.of(context).textTheme.bodyLarge,),
          ],
        ),
      ),
    );
  }
}
*/
// ====================== flutter launcher icon =======================
/*
// package flutter_launcher_icon ==> هنتعرف علي تغيير ايقونة التطبيق
// ليه؟ لأنك بتستخدمها وقت التطوير فقط عشان تولّد أيقونات التطبيق، ومش بتكون جزء من التطبيق نفسه لما بيتبني أو يتنشر dev بتنضاف تحت ال
// flutter pub add flutter_launcher_icons ==> زي كده dev_dependencies ودا غلط فلازم ننقلها تحت ال dependencies طريقة اضافتها ولكن الامر دا بيضيفها تحت ال
// dev_dependencies:
//   flutter_launcher_icons: "^0.14.4" ==> package دي ال
// package بنسيب سطر مسافة وبعد كده بنضيف اعدادات ال
// flutter_launcher_icons: ==> من اول هنا دي اعداداتها
//   android: "launcher_icon" ==>  android الاسم اللي الصورة هتتحفظ بيه في ال
//   ios: true
//   image_path: "assets/icon/icon.png" ==> مسار الصورة اللي هنضيفها كايقونة للتطبيق
//   min_sdk_android: 21 # android min sdk min:16, default 21

// وتتم التعديلات ويحط الصورة Run the package وبعد الانتهاء من عملية التعديل واضافة الصورة هنعمل الاتي عشان ي
// flutter pub get
// flutter pub run flutter_launcher_icons

// هيكون التطبيق بالايقونة الجديدة run وكده لما نعمل
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("flutter launcher icon")),
        body: ListView(children: [],
        ),
      ),
    );
  }
}
*/
// ====================== package geolocator =======================
/*
// package geolocator ==> بتمكنا من الحصول علي الموقع الحالي للشخص وحساب المسافة بالمتر بين نقطتين
// Features #
// 1- Get the last known location;
// 2- Get the current location of the device;
// 3- Get continuous location updates;
// 4- Check if location services are enabled on the device;
// 5- Calculate the distance (in meters) between two geocoordinates; عن طريق احداثياتها ==> by its longitude الطول , latitude العرض
// 6- Calculate the bearing between two geocoordinates;
// ممكن نستفيد بيه مثلا في تطبيق توصيل لحساب المسافة بين المطعم وبين العميل عشان يقدر يحسب الوقت المستغرق للوصول
// flutter pub add geolocator ==> طريقة اضافتها
// : من المستخدم اللي هيستخدم التطبيق لان هو اللي هيتم تحديد موقعه من خلال التطبيق permissions الخاصية دي بتحتاج
// 1- من الجهاز اللي عليه التطبيق Location Service تفعيل خدمة الموقع
// 2- location ويكون المستخدم مدي اذن للتطبيق بالوصول لل
import 'package:geolocator/geolocator.dart';
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
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    if (permission == LocationPermission.whileInUse) {
      // بمعني اثناء استخدام التطبيق
      // للحصول علي الموقع الحالي
      Position position = await Geolocator.getCurrentPosition();
      print("====================");
      print(position.latitude);
      print(position.longitude);
      print("====================");
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("package geolocator")),
        body: ListView(children: []),
      ),
    );
  }
}
*/
// ====================== package GoogleMaps =======================
/*
// package GoogleMaps ==> package لا يوجد تطبيق يخلو من هذه ال
// 🗺️ أولًا: ما هي google_maps_flutter؟
// هي مكتبة من Google بتسمحلك تضيف خرائط تفاعلية داخل تطبيق Flutter، تقدر تعرض فيها:
// موقع المستخدم
// مواقع ثابتة (مثل المطاعم – المحلات – إلخ)
// اتجاهات (Directions)
// أو نقاط اهتمام (Markers)

// google_maps_flutter: ^2.6.1 ==> 1- إضافة المكتبة إلى pubspec.yaml
// 2. حفظ الملف وتشغيل التثبيت
// بعد إضافة المكتبة:
// ✅ شغّل في التيرمنال:
// flutter pub get
// أو احفظ الملف وVS Code هيعملها تلقائيًا.
// 3. إعداد Android لعرض الخريطة
// ✅ افتح الملف:
// android/app/src/main/AndroidManifest.xml
// ✏️ وأضف التصريحات (permissions) داخل <manifest> وتحديدًا داخل <application>:
// <manifest>
//   <!-- داخل الوسم الرئيسي -->
//   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
//   <uses-permission android:name="android.permission.INTERNET"/>

//   <application>
//     <!-- مفتاح API الخاص بخرائط Google -->
//     <meta-data
//       android:name="com.google.android.geo.API_KEY"
//       android:value="ضع_مفتاح_API_هنا" />
//   </application>
// </manifest>
// 4. الحصول على مفتاح Google Maps API Key
// اذهب إلى:
// https://console.cloud.google.com/
// ثم:
// أنشئ مشروع جديد (أو استخدم واحد موجود)
// فعل خدمة Maps SDK for Android
// احصل على مفتاح (API Key)
// انسخه وضعه في مكان android:value كما وضحت في الخطوة السابقة


// 5. كود بسيط لتجربة الخريطة
// افتح lib/main.dart وضع هذا الكود:
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(30.0444, 31.2357); // مثال: القاهرة

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Example'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
*/
// ====================== Tracking GoogleMaps =======================
/*
// بمعني التتبع يعني انا عندي تطبيق توصيل وبوصل طلبية للزبون وعايز اشوف موقعي وانا بتحرك وعشان نعمل دا فاحنا محتاجين عدة اشياء
// 1- marker ==> لتحديد مكاني علي الخريطة
// 2- update marker ==> stream gro locator بمعني كل لما اتحرك لازم مؤشر التحديد يتحرك معايا من خلال
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tracking GoogleMaps"),),
      ),
    );
  }
}
*/
// ====================== Todo-app =======================
/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<String> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _tasks.add(text);
        _controller.clear();
      });
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة المهام'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'اكتب المهمة',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTask,
                  child: Text('إضافة'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(_tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeTask(index),
                    ),
                  ),
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
// ====================== State Management =======================
// 1- Bloc => 
// يُطلق على الكتلة اسم نمط لأنها عبارة عن حل متكرر لمشكلة شائعة في تصميم البرمجيات.
// the Bloc is called pattern because it is a recurring solution to a common problem in software design.
// إنه يوفر طريقة لإدارة الحالة وفصل منطق الأعمال عن واجهة المستخدم بطريقة يمكن التنبؤ بها.
// It provides a way to manage state and separate business logic from the user interface in a predictable manner.
// يتم استخدامه على نطاق واسع في تطبيقات Flutter للتعامل مع سيناريوهات إدارة الحالة المعقدة.
// It is widely used in Flutter applications to handle complex state management scenarios.
// بيتقال علي ال Bloc انه business logic componenet عشان بحط فيه ال logic بتاعنا وبفصله عن ال ui وبيبقي كل جزء لوحده
// عندنا جزء في ال ui ودا بيتغير بناءً علي حدث معين زي مثلا لما اضغط علي زرار يحصل تغيير في جزء معين من الشاشة فانا عايز اعمل فصل بين ال ui وال business logic عشان لو حصل تعديل في ال business logic ميبقاش ليه تأثير علي ال ui والعكس صحيح
// بيتحط فيه ال logic المسؤول عن تغير ال state بتاعت التطبيق
// البلوك بيتكون من 3 حاجات سهم داخل ليه وسهم طالع منه : events => Bloc(Logic) => States
// بيستخدم حاجة اسمها ال states عشان يكلم الطبيق وبتقوله فيه تغير حصل فالتطبيق يسمع الكلام ده ويطبق الكلام اللي هو سمعه
// events ==> هي اللي بتقول ان فيه حاجة هتبتدي تحصل دلوقتي لانها بتمثل اي حدث المستخدم بياخده واللي بيخلي منطق معين يحصل
// ال cubit وال bloc هما الاتنين بيستخدموا نفس الفكرة بالظبط بس ال bloc بيستخدم حاجات اكتر شوية زي ال events اما ال cubit فهو ابسط شوية ومفيهوش ال events
// Bloc pattern ==> بيستخدم خطوات ثابته :
// 1- create state : نحدد ال states اللي هنتعامل معاها وكل state بنمثلها باستخدام ال oop علي هيئة class
// 2- create cubit :
// 2- create function :
// 3- provide cubit :
// 4- integrate cubit :
// 5- trigger cubit :