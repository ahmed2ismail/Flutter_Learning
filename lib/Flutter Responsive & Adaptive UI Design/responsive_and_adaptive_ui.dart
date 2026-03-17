/*
________________________________________________________________________________
_________________________________ Responsive UI ________________________________
________________________________________________________________________________

- الـ Responsive UI في Flutter تعني تصميم واجهة مستخدم قادرة على تكييف حجمها وتوزيع عناصرها بناءً على مساحة الشاشة المتاحة (Screen Size) واتجاه الجهاز (Orientation)، سواء كان موبايل، تابلت، أو حتى شاشة كمبيوتر.

الهدف الأساسي: أن يظهر التطبيق بشكل ممتاز على أي جهاز دون حدوث مشاكل مثل الـ Overflow.

_______________________________ أهم الأدوات والتقنيات _______________________________

1- MediaQuery:
تُستخدم للحصول على معلومات الشاشة الحالية (العرض، الطول، الاتجاه).
- مثال:
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  بعد كده ممكن نستخدم نسبة معينة من ال screenHeight, screenWidth زي كده : screenWidth * .2 (يعني 20% من العرض), screenHeight * .25 (يعني 25% من الطول)
  var orientation = MediaQuery.of(context).orientation;

- الـ Orientation (اتجاه الشاشة):
يُستخدم لتحديد ما إذا كان المستخدم يمسك الجهاز بشكل رأسي (Portrait) أو أفقي (Landscape).
- Portrait: الطول أكبر من العرض (الوضع الطبيعي للموبايل).
- Landscape: العرض أكبر من الطول (الوضع الطبيعي للتابلت أو عند تدوير الموبايل لمشاهدة فيديو).

- كيف نتعامل معه؟
يمكنك استخدام `MediaQuery` لمعرفة الحالة الحالية وتغيير التصميم بناءً عليها:
  if (orientation == Orientation.portrait) {
    return Column(children: [...]); // تصميم رأسي
  } else {
    return Row(children: [...]);    // تصميم أفقي
  }

- ملاحظة هامة: 
عند تغيير الـ Orientation، يقوم فلاتر بإعادة بناء (Rebuild) للـ Widget الحالي لتطبيق التصميم الجديد المناسب للوضعية الجديدة.

- final Widget mobileLayout, tabletLayout, desktopLayout; دا بيعملي مشكلتين رخمين وهما :
1- دايما بيتم انشاء ال mobile_layout, tablet_layout,desktop_layout ومش بيتم عرض غير واحدة منهم فقط علي الجهاز ودا معناه ان فيه هدر للموارد
2- مشكلة ان انا معنديش context اللي من خلالها اقدر ا access الحاجة اللي تم انشاءها فوقه في ال widget tree لان ال context مستخبي جوه عند ال LayoutBuilder يعني جوه ال AdabtiveLayout فبالتالي مقدرش اوصله من هنا
والحل هو اني مستقبلش ال Widget mobileLayout, tabletLayout, desktopLayout بالشكل دا ولكن استقبلهم من خلال ال WidgetBuilder لانه معاه ال context اللي انا عايزه وبيبنيلي ال widget اللي انا عايزها فقط WidgetBuilder = Widget Function(BuildContext)
- ال  final WidgetBuilder mobileLayout, tabletLayout, desktopLayout; بتحللي مشكلتين بيسببهم ال constructor بسبب انه بيبنيلي كل ال widgets وانا بكون عايز اعرض واحدة بس وبتديني ال context كمان
- وبكدا اصبح ال mobileLayout, tabletLayout, desktopLayout كل واحد فيهم عبارة عن Function انا هستخدمها وبتستقبل context جواه وبترجعلي widget
child: AdabtiveLayout(
        mobileLayout: (context) => const MobileLayout(),
        // دا كده اسمه lazy building لان عشان ال MobileLayout تتبني لازم يتم استدعاء ال mobileLayout Function ومش هيتم استدعائها اللي لما يتعملها return وبالفعل اتعملها return mobileLayout(context); جوه ال LayoutBuilder وبكده هيتم انشاء الحاجة اللي احنا عايزين نعرضها علي الشاشة فقط
        tabletLayout: (context) => const TabletLayout(),
        desktopLayout: (context) => const DesktopLayout(),
      ),

2- LayoutBuilder:
أداة قوية تعطيك الـ Constraints (القيود) الخاصة بالـ Parent Widget. هي أفضل من MediaQuery لأنها تعتمد على المساحة المتاحة للـ Widget نفسه وليس الشاشة كاملة.
وبقدر من خلالها اعرض ال ui المناسب للجهاز اللي هيتعرض عليه وبالتالي هيتأقلم مع ال Platforms المختلفة سواء كان تليفون او تابلت او desktop.
ملحوظة: اللي بيهمني هنا هو ال width مش ال height لان العرض هو اللي بيختلف من جهاز لاخر وهو اللي بيعمل الفرق .
كمان ال LayoutBuilder بيديني الابعاد المتاحة للاب بتاعه في الشاشة اللي انا فيها زي مثلا : log(constraints.maxWidth) هتديني مثلا 500 اما ال log(MediaQuery.sizeOf(context).width) هتديني 530 والفرق دا حصل لان ال constraints جابتلي العرض اللي باقي من الاب بتاعي وليس عرض الشاشة كلها
ال LayoutBuilder بيجيبلي ال constraints اللي هي القيود المفروضة عليه من الاب بتاعه يعني لما اقوله constraints.maxWidth هيجيبلي كل العرض المتاح من الاب بتاعه وليس عرض الشاشة كلها
- مثال:
  LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth > 600) { // ال 600 بتسمي breakPoint لانها بتحدد الفيصل بين الموبايل والتابلت وممكن يكون عندي اكتر من breakPoint علي حسب ال Layouts بتاعة المنصات المختلفة
        return _buildWideLayout(); // شاشة كبيرة (تابلت)
      } else {
        return _buildNormalLayout(); // شاشة صغيرة (موبايل)
      }
    },
  );
- مثال اخر: Responsive GridView:
Widget build(BuildContext context) {
  return Scaffold(
    body: LayoutBuilder(
      builder: (context, constraints) {
        // إذا كان العرض أكبر من 600 بكسل، سنعرض 3 أعمدة (تابلت)
        if (constraints.maxWidth > 600) {
          return GridView.count(
            crossAxisCount: 3,
            children: List.generate(6, (index) => Card(child: Center(child: Text('Item $index')))),
          );
        } else {
          // إذا كان العرض أصغر، سنعرض عمودين فقط (موبايل)
          return GridView.count(
            crossAxisCount: 2,
            children: List.generate(6, (index) => Card(child: Center(child: Text('Item $index')))),
          );
        }
      },
    ),
  );
}

3- AspectRatio:
تُستخدم لتحديد نسبة ثابتة بين العرض والطول للـ Widget مهما تغير حجم الشاشة.
- مثال: AspectRatio(aspectRatio: 16 / 9, child: Container(...))

4- Flexible & Expanded:
تُستخدم داخل الـ Row والـ Column لتوزيع المساحات المتبقية بنسب مئوية (Flex) بدلاً من قيم ثابتة مما يمنع حدوث الـ Overflow.

5- FittedBox:
تقوم بتغيير حجم الـ Child (مثل النص أو الصورة) ليتناسب مع المساحة المتاحة له دون أن يخرج عن الحدود.
return FittedBox(
      fit: BoxFit.scaleDown,
      child: ...
)

6- Intrinsic Widgets :
(IntrinsicHeight & IntrinsicWidth)
تُستخدم هذه الـ Widgets عندما تريد أن تأخذ العناصر الأبناء (Children) مساحة تعتمد على حجم أكبر عنصر موجود بينهم.
- IntrinsicHeight: تجعل جميع العناصر الأبناء في الـ Row مثلاً تأخذ نفس طول أطول عنصر فيهم. هذا مفيد جداً إذا كان لديك Vertical Divider بين نصوص مختلفة الأطوال.
- IntrinsicWidth: تجعل جميع العناصر الأبناء في الـ Column تأخذ نفس عرض أعرض عنصر فيهم.
- ملاحظة: يُفضل عدم استخدامها بكثرة لأنها مكلفة في عملية الـ Layout (Performance-wise) لأنها تقوم بعملية حسابية مرتين لتحديد الحجم.

_______________________________ مثال عملي (Responsive Layout) _______________________________

class ResponsiveExample extends StatelessWidget {
  const ResponsiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام MediaQuery للحصول على معلومات الشاشة
    var orientation = MediaQuery.of(context).orientation;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Responsive UI')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Breakpoint: إذا كان العرض أكبر من 600 نعتبره تابلت
          if (constraints.maxWidth > 600) {
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.blue, child: const Center(child: Text('Sidebar'))),
                ),
                Expanded(
                  flex: 5,
                  child: _buildMainContent(orientation, screenWidth),
                ),
              ],
            );
          } else {
            // موبايل
            return _buildMainContent(orientation, screenWidth);
          }
        },
      ),
    );
  }

  Widget _buildMainContent(Orientation orientation, double width) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: AspectRatio(
            aspectRatio: orientation == Orientation.portrait ? 16 / 9 : 3 / 1,
            child: Container(
              color: Colors.orange,
              child: Center(child: Text('Banner - Width: ${width.toInt()}')),
            ),
          ),
        ),
        const Expanded(
          child: IntrinsicHeight( // علي اساس اكبر child عندي بحدد ال height بتاع ال row
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: Card(child: Center(child: Text('Box 1')))),
                VerticalDivider(thickness: 2),
                Expanded(child: Card(child: Center(child: Text('Box 2')))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

________________________________________________________________________________
_________________________________ Adaptive UI __________________________________
________________________________________________________________________________

- الـ Adaptive UI تعني أن التطبيق يغير سلوكه وشكله بناءً على نظام التشغيل (Platform) الذي يعمل عليه (Android vs iOS).
- الهدف: أن يشعر مستخدم الـ iPhone أن التطبيق يتبع معايير Apple (Cupertino)، ومستخدم الـ Android يشعر أنه يتبع معايير Google (Material Design).

_______________________________ أهم الفروقات والأدوات _______________________________

1- التحقق من نظام التشغيل:
نستخدم مكتبة `dart:io` للتحقق من المنصة:
- if (Platform.isIOS) { // كود خاص بـ آيفون }
- if (Platform.isAndroid) { // كود خاص بـ أندرويد }

2- الـ Widgets المتكيفة (Adaptive Widgets):
فلاتر توفر بعض الـ Widgets التي تغير شكلها تلقائياً:
- Switch.adaptive()
- Slider.adaptive()
- CircularProgressIndicator.adaptive()
- IconButton.adaptive()

3- الـ Navigation والـ Dialogs:
- في Android نستخدم: `showDialog` و `AlertDialog`.
- في iOS نستخدم: `showCupertinoDialog` و `CupertinoAlertDialog`.

_______________________________ مثال عملي (Adaptive Button & Dialog) _______________________________

void _showAdaptiveDialog(BuildContext context) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
      title: const Text('Alert'),
      content: const Text('This is an iOS style dialog'),
      actions: [
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
} else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert'),
        content: const Text('This is an Android style dialog'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
customAppBar:
class CustomAdabtiveAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAdabtiveAppBar({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu),
            color: Colors.white,
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56); // default appBar height is 56 وانا اقدر اغيره لو احتجت دا
}

_______________________________ الخلاصة _______________________________

- الـ Responsive: يهتم بـ "المساحة" (Size & Orientation).
- الـ Adaptive: يهتم بـ "المنصة" (Platform & OS Look).

باستخدام التقنيتين معاً، يمكنك بناء تطبيق احترافي يعمل بكفاءة عالية على جميع الأجهزة والأنظمة (Cross-Platform).
*/