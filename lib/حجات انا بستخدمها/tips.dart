/*
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
              // SliverFillRemaining : بتستخدم عشان تخلي ال ListView اللي جواها تاخد المساحة المتبقية من ال screen وتتعامل معاها كأنها جزء واحد من ال scroll، وبكده حلينا مشكلة ال scrolling جوا ال ListView اللي كانت بتعارض ال CustomScrollView.
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
