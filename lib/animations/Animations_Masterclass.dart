/*
=================================================================================================
🚀 FLUTTER ANIMATIONS MASTERCLASS - الدليل الشامل لكل أنواع الأنيميشن 🚀
=================================================================================================

🎯 الفهرس (Table of Contents):
1. مقدمة: كيف تفكر فلاتر في الأنيميشن؟
2. Implicit Animations (الأنيميشن الضمني - السهل والسريع)
   - AnimatedContainer
   - AnimatedOpacity
   - AnimatedCrossFade & AnimatedSwitcher
3. Explicit Animations (الأنيميشن الصريح - التحكم الكامل)
   - AnimationController & Tween
   - Built-in Transitions (Slide, Scale, Rotation)
   - AnimatedBuilder (الأنيميشن المخصص)
4. Hero Animations (أنيميشن التنقل بين الشاشات للعناصر المشتركة)
5. Page Route Animations (أنيميشن انتقال الصفحات)
6. Advanced / Third-Party (الأنيميشن المتقدم والمكتبات الخارجية - Lottie)

=================================================================================================
1. مقدمة: كيف تفكر فلاتر في الأنيميشن؟
=================================================================================================
في فلاتر، الأنيميشن ينقسم لقسمين رئيسيين بناءً على "من يتحكم في الأنيميشن؟":

- Implicit (الضمني): إنت بتدي فلاتر القيمة القديمة والقيمة الجديدة، وتقولها "اتصرفي انتي واعملي انتقال ناعم بينهم". (مش محتاج Controller).
  متى أستخدمه؟ لما يكون عندك تغيير بسيط في الـ State (زي تغيير لون، حجم، إخفاء عنصر) ومش محتاج تعمل Play, Pause, Reverse.

- Explicit (الصريح): إنت اللي بتتحكم في كل فريم. بتقول لفلاتر "ابدأ، اقف، ارجع لورا، كرر الأنيميشن للما نهاية". (محتاج Controller).
  متى أستخدمه؟ لما تكون عايز تعمل حركة معقدة، أو أنيميشن شغال طول الوقت (زي Loading indicator بيلف)، أو أنيميشن مرتبط بحركة إصبع المستخدم (Drag).

=================================================================================================
*/

import 'package:flutter/material.dart';

// ==============================================================================================
// 2. Implicit Animations (الأنيميشن الضمني - السهل والسريع)
// ==============================================================================================
/*
💡 نصيحة الاستخدام: استخدم الـ Implicit Animations في أغلب تفاعلات المستخدم البسيطة، زي زرار بيكبر لما تضغط عليه،
أو رسالة خطأ بتظهر وتختفي، أو تغيير ثيم التطبيق (Dark/Light). دي بتوفر عليك كتابة كود كتير جداً.
*/

class ImplicitAnimationsExample extends StatefulWidget {
  const ImplicitAnimationsExample({super.key});

  @override
  State<ImplicitAnimationsExample> createState() => _ImplicitAnimationsExampleState();
}

class _ImplicitAnimationsExampleState extends State<ImplicitAnimationsExample> {
  // متغيرات للتحكم في حالة الـ UI
  bool isExpanded = false;
  bool isVisible = true;
  bool showFirstImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Implicit Animations')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ------------------------------------------------------------------
              // أ) AnimatedContainer: أقوى وأشهر ويدجت. بتعمل أنيميشن لأي خاصية بداخلها تتغير (لون، حجم، حواف، ظل).
              // ------------------------------------------------------------------
              const Text('1. AnimatedContainer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  // بمجرد ما نغير الـ State، الـ AnimatedContainer هيحسب الفرق ويعمل الأنيميشن لوحده
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: AnimatedContainer(
                  // duration: (إجباري) الميزة الأساسية هنا إننا بنحدد مدة الأنيميشن
                  duration: const Duration(seconds: 1),
                  // curve: (اختياري) طريقة حركة الأنيميشن (سريعة في الأول وبطيئة في الآخر مثلاً)
                  curve: Curves.easeInOut,
                  width: isExpanded ? 200 : 100,
                  height: isExpanded ? 200 : 100,
                  decoration: BoxDecoration(
                    color: isExpanded ? Colors.blue : Colors.red,
                    borderRadius: BorderRadius.circular(isExpanded ? 100 : 10), // تغيير من مربع لدائرة
                  ),
                  child: const Center(child: Text('Tap Me', style: TextStyle(color: Colors.white))),
                ),
              ),
              const SizedBox(height: 30),

              // ------------------------------------------------------------------
              // ب) AnimatedOpacity: للتحكم في شفافية العنصر (ظهور وإخفاء بنعومة)
              // ------------------------------------------------------------------
              const Text('2. AnimatedOpacity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: isVisible ? 1.0 : 0.0, // 1 يعني ظاهر بالكامل، 0 يعني مخفي تماماً
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  child: const Center(child: Text('Fade', style: TextStyle(color: Colors.white))),
                ),
              ),
              ElevatedButton(
                onPressed: () => setState(() => isVisible = !isVisible),
                child: const Text('Toggle Visibility'),
              ),
              const SizedBox(height: 30),

              // مثال اخر:
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: isVisible ? 1.0 : 0.0,
                child: const Text('This text will fade in and out'),
              ),
               // مثال اخر:
              // return AnimatedOpacity(
              //   opacity: currentPageIndex == 0 ? 1.0 : 0.0,
              //   duration: const Duration(milliseconds: 300),
              //   child: IgnorePointer( // لو مش عايز المستخدم يقدر يتفاعل مع العنصر لما يكون مخفي (opacity = 0)، بتستخدم IgnorePointer
              //     ignoring: currentPageIndex != 0,
              //     child: PageOne(),
              //   ),
              // );

              // ------------------------------------------------------------------
              // ج) AnimatedCrossFade: ممتازة جداً لو عايز تبدل بين 2 ويدجت مختلفين تماماً بشكل ناعم
              // ------------------------------------------------------------------
              const Text('3. AnimatedCrossFade', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              AnimatedCrossFade(
                duration: const Duration(seconds: 1),
                firstChild: const FlutterLogo(size: 100, style: FlutterLogoStyle.horizontal),
                secondChild: const FlutterLogo(size: 100, style: FlutterLogoStyle.stacked),
                // crossFadeState: هي اللي بتحدد مين فيهم اللي يظهر دلوقتي
                crossFadeState: showFirstImage ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              ),
              ElevatedButton(
                onPressed: () => setState(() => showFirstImage = !showFirstImage),
                child: const Text('Switch Image'),
              ),
              
              // هناك أيضاً AnimatedSwitcher (مفيدة لو بتبدل بين أكثر من عنصر أو عايز تغير شكل الانتقال من Fade لـ Scale مثلاً).
              const SizedBox(height: 30),
              const Text('4. AnimatedSwitcher', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (child, animation) {
                  // هنا بنحدد شكل الانتقال بين العناصر (مثلاً Fade + Scale)
                  return ScaleTransition(scale: animation, child: FadeTransition(opacity: animation, child: child));
                },
                child: showFirstImage
                    ? const FlutterLogo(key: ValueKey(1), size: 100, style: FlutterLogoStyle.horizontal)
                    : const FlutterLogo(key: ValueKey(2), size: 100, style: FlutterLogoStyle.stacked),
              ),
              ElevatedButton(
                  onPressed: () => setState(() => showFirstImage = !showFirstImage),
                  child: const Text('Switch with AnimatedSwitcher'),
                ),

                // مثال اخر علي AnimatedSwitcher:
                // return AnimatedSwitcher(
                //   duration: const Duration(milliseconds: 500),
                //   transitionBuilder: (child, animation) {
                //     return FadeTransition(
                //       opacity: animation,
                //       child: SlideTransition(
                //         position: Tween<Offset>(
                //           begin: const Offset(0, 0.5),
                //           end: Offset.zero,
                //         ).animate(animation),
                //         child: child,
                //       ),
                //     );
                //   },
                //   child: currentPageIndex == 1
                //       ? Column(
                //           key: const ValueKey('GetStarted'),
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.symmetric(horizontal: 16),
                //               child: MaterialButton(
                //                 onPressed: () {
                //                   // TOdO: Navigate to Login/Home screen
                //                 },
                //                 minWidth: double.infinity,
                //                 height: 54,
                //                 color: AppColors.green1_500,
                //                 shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(16),
                //                 ),
                //                 child: Text(
                //                   S.of(context).OnBoardingWelcomePrefixButton,
                //                   textAlign: TextAlign.center,
                //                   style: TextStyles.bold16.copyWith(color: Colors.white),
                //                 ),
                //               ),
                //             ),
                //             const SizedBox(height: 43),
                //           ],
                //         )
                //       // Use a SizedBox with the same total height to prevent layout jumps during animation.
                //       : const SizedBox(key: ValueKey('Empty'), height: 54 + 43),
                // );


                // مثال اخر علي AnimatedSwitcher:
                // return AnimatedSwitcher(
                //   duration: const Duration(milliseconds: 500),
                //   transitionBuilder: (child, animation) {
                //     return SlideTransition(
                //       position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation),
                //       child: child,
                //     );
                //   },
                //   child: currentPageIndex == 0
                //       ? const PageOne(key: ValueKey(1))
                //       : const PageTwo(key: ValueKey(2)),
                // );
              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}

// ==============================================================================================
// 3. Explicit Animations (الأنيميشن الصريح - التحكم الكامل)
// ==============================================================================================
/*
💡 نصيحة الاستخدام: استخدم الـ Explicit لما تحتاج أنيميشن شغال في الخلفية باستمرار (Loop)،
أو لو عايز تربط الأنيميشن بحركة الـ Scroll الخاصة بالمستخدم، أو لو محتاج توقفه وتشغله بناءً على Logic معين.
*/

class ExplicitAnimationsExample extends StatefulWidget {
  const ExplicitAnimationsExample({super.key});

  @override
  // with SingleTickerProviderStateMixin: 
  // دي ضرورية جداً! دي اللي بتدي الـ Controller "نبضات" (Ticks) مع كل فريم في الشاشة (عادة 60 أو 120 مرة في الثانية).
  // بتضمن إن الأنيميشن يشتغل بس والشاشة شغالة عشان مايستهلكش بطارية (Performance optimization).
  State<ExplicitAnimationsExample> createState() => _ExplicitAnimationsExampleState();
}

class _ExplicitAnimationsExampleState extends State<ExplicitAnimationsExample> with SingleTickerProviderStateMixin {
  
  // 1. Controller: هو المايسترو. هو اللي بيقول إمتى نـ Play وإمتى نـ Stop. بيدي قيم من 0.0 إلى 1.0.
  late AnimationController _controller;
  
  // 2. Animation (Tween): هو اللي بيترجم أرقام الـ Controller (من 0 لـ 1) للقيم اللي انت عايزها (مثلاً من 0 لـ 360 درجة، أو من لون أحمر لأزرق).
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    
    // تعريف المايسترو وتحديد مدته
    _controller = AnimationController(
      vsync: this, // this تعود على الـ SingleTickerProviderStateMixin
      duration: const Duration(seconds: 2),
    );

    // ربط الـ Tween بالـ Controller مع إضافة Curve لشكل الحركة
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 2.0).animate( // 2.0 تعني لفتين (لأن الـ RotationTransition بيتعامل بالدورات Turns)
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    // لو عايز الأنيميشن يفضل شغال على طول رايح جاي
    // _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    // ⚠️ مهم جداً جداً: لازم تدمر الـ Controller لما تقفل الصفحة عشان تتجنب الـ Memory Leaks!
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explicit Animations')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ------------------------------------------------------------------
            // أ) Built-in Transitions: ويدجتس جاهزة بتستقبل الـ Animation اللي إنت عملته فوق
            // ------------------------------------------------------------------
            RotationTransition(
              turns: _rotationAnimation, // بتاخد قيمة الأنيميشن للالتفاف
              child: ScaleTransition(
                scale: _scaleAnimation, // بتاخد قيمة الأنيميشن للتكبير والتصغير
                child: const Icon(Icons.star, size: 100, color: Colors.amber),
              ),
            ),
            const SizedBox(height: 50),
            
            // أزرار للتحكم اليدوي في الأنيميشن (هذه هي ميزة الـ Explicit)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.forward(), // تشغيل للأمام
                  child: const Text('Play'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _controller.reverse(), // تشغيل للخلف
                  child: const Text('Reverse'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _controller.stop(), // إيقاف
                  child: const Text('Stop'),
                ),
              ],
            ),
            
            const SizedBox(height: 50),
            // ------------------------------------------------------------------
            // ب) AnimatedBuilder: لو عايز تعمل أنيميشن مخصص جداً لخصائص مش موجود ليها Transition جاهز
            // ------------------------------------------------------------------
            const Text('AnimatedBuilder (Custom)', style: TextStyle(fontWeight: FontWeight.bold)),
            AnimatedBuilder(
              animation: _controller,
              // الـ builder بيتم استدعاؤه مع كل فريم بيتغير فيه الـ controller
              builder: (context, child) {
                return Transform.translate(
                  // نحرك العنصر في محور X بناءً على قيمة الـ controller
                  offset: Offset(_controller.value * 100, 0),
                  child: child, // بنستخدم الـ child هنا عشان فلاتر متبنيش الأيقونة من الصفر كل فريم (Performance Trick)
                );
              },
              child: const Icon(Icons.directions_car, size: 50, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

// ==============================================================================================
// 4. Hero Animations (أنيميشن التنقل - البطل)
// ==============================================================================================
/*
💡 نصيحة الاستخدام: ممتاز لتطبيقات الـ E-commerce أو معرض الصور. لما تضغط على صورة منتج صغير،
تطير الصورة وتكبر في الصفحة التانية. بيعطي إحساس بالاستمرارية والاحترافية.
الشرط الوحيد: لازم الويدجت في الصفحة الأولى والصفحة التانية يكون ليهم نفس الـ tag بالظبط.
*/

class HeroAnimationExample extends StatelessWidget {
  const HeroAnimationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HeroDetailsPage()),
            );
          },
          child: Hero(
            // الـ tag هو الرابط السحري بين الشاشتين (ممكن يكون ID المنتج، أو رابط الصورة)
            tag: 'my-avatar-tag',
            child: ClipOval(
              child: Image.network(
                'https://picsum.photos/200',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDetailsPage extends StatelessWidget {
  const HeroDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: const Text('Hero Details')),
      body: Center(
        child: Hero(
          // نفس الـ tag المستخدم في الصفحة السابقة
          tag: 'my-avatar-tag',
          child: Image.network(
            'https://picsum.photos/200',
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// ==============================================================================================
// 5. Page Route Animations (أنيميشن انتقال الصفحات)
// ==============================================================================================
/*
💡 نصيحة الاستخدام: الديفولت في أندرويد هو الانتقال من أسفل لأعلى، وفي iOS من اليمين لليسار.
لو عايز تعمل انتقال مخصص (مثلاً الصفحة تظهر كـ Fade أو Slide من اتجاه معين)، بنستخدم PageRouteBuilder.
*/

class CustomPageRouteExample extends StatelessWidget {
  const CustomPageRouteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Route Animation')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, _createRoute());
          },
          child: const Text('Go to Page 2 with Slide'),
        ),
      ),
    );
  }

  // دالة تصنع مسار مخصص
  Route _createRoute() {
    return PageRouteBuilder(
      // الصفحة اللي هنروحلها
      pageBuilder: (context, animation, secondaryAnimation) => const PageTwo(),
      // تصميم الأنيميشن للانتقال
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // تحديد نقطة البداية والنهاية للـ Slide
        const begin = Offset(1.0, 0.0); // 1.0 في الـ X تعني خارج الشاشة من اليمين
        const end = Offset.zero; // 0.0 تعني مكانها الطبيعي في الشاشة
        const curve = Curves.easeInOutCubic;

        // دمجهم في Tween
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        // نُرجع SlideTransition
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500), // مدة الانتقال
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(title: const Text('Page 2')),
      body: const Center(child: Text('Arrived Customly!', style: TextStyle(fontSize: 24, color: Colors.white))),
    );
  }
}

// ==============================================================================================
// 6. Advanced / Third-Party (Lottie - الأنيميشن الجاهز)
// ==============================================================================================
/*
💡 نصيحة الاستخدام: إياك تضيع وقتك في برمجة أنيميشن معقد جداً (زي شخص بيمشي، أو علامة صح بتترسم بشكل مزخرف).
استخدم مكتبة Lottie. المصمم بيعمل الأنيميشن على After Effects ويطلعه كملف JSON، وإنت بتعرضه في فلاتر في سطر واحد!

خطوات الاستخدام:
1. ضيف المكتبة في pubspec.yaml: lottie: ^2.0.0 (أو أحدث إصدار)
2. حمل الأنيميشن من lottiefiles.com كـ JSON وحطه في مجلد الـ assets.
3. استخدم الكود التالي.
*/

/* 
// ⚠️ هذا الكود معلق (Commented) لأنه يحتاج لتثبيت حزمة lottie لتشغيله فعلياً.
// لكنه مكتوب بطريقة صحيحة 100% كمرجع لك.

import 'package:lottie/lottie.dart';

class LottieExample extends StatefulWidget {
  const LottieExample({super.key});

  @override
  State<LottieExample> createState() => _LottieExampleState();
}

class _LottieExampleState extends State<LottieExample> with SingleTickerProviderStateMixin {
  late AnimationController _lottieController;

  @override
  void initState() {
    super.initState();
    // لو عايز تتحكم في اللوتي (متى يبدأ ومتى يقف) بتعمله Controller زيه زي الـ Explicit Animation بالظبط
    _lottieController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lottie Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الاستخدام الأبسط: هيشتغل لوحده ويتكرر (Loop)
            Lottie.network(
              'https://assets8.lottiefiles.com/packages/lf20_touohxv0.json', // مسار الأنيميشن من الإنترنت
              // أو Lottie.asset('assets/animations/success.json'), // من الجهاز
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            
            // الاستخدام المتقدم: مع Controller للتحكم فيه
            Lottie.asset(
              'assets/animations/custom.json',
              controller: _lottieController,
              onLoaded: (composition) {
                // أول ما ملف اللوتي يحمل، بنقول للكونترولر مدتك هي نفس مدة ملف اللوتي
                _lottieController.duration = composition.duration;
              },
            ),
            ElevatedButton(
              onPressed: () {
                // تشغيل اللوتي لمرة واحدة
                _lottieController.forward(from: 0); 
              },
              child: const Text('Play Custom Lottie'),
            )
          ],
        ),
      ),
    );
  }
}
*/

/*
=================================================================================================
🌟 الخلاصة الذهبية (Summary) 🌟
=================================================================================================
- عايز تغير لون أو حجم أو تخفي حاجة بسهولة؟ -> Implicit (AnimatedContainer, AnimatedOpacity).
- عايز أنيميشن شغال طول الوقت، أو تقدر تعمل ليه Play/Stop؟ -> Explicit (AnimationController).
- عايز صورة تكبر وتنتقل لشاشة تانية؟ -> Hero.
- عايز تغير شكل انتقال الصفحات (من تحت، من اليمين)؟ -> PageRouteBuilder.
- عايز أنيميشن معقد جداً ورسوميات (نجاح، تحميل، شخص بيجري)؟ -> Lottie JSON.

* تذكر دائماً:
لا تبالغ في استخدام الأنيميشن لدرجة تشتت المستخدم، الأنيميشن الجيد هو الذي يبدو طبيعياً ويخدم غرضاً معيناً (توجيه عين المستخدم أو إعطائه Feedback).
ولا تنسَ أبداً الـ dispose() لأي Controller لضمان أداء التطبيق!
=================================================================================================
*/