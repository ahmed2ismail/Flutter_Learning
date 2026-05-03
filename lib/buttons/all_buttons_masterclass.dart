/*
================================================================================
==================== Masterclass: كل أنواع الأزرار في Flutter ====================
================================================================================

أهلاً بك في الدليل الشامل لكل أنواع الأزرار (Buttons) في فلاتر.
سواء كنت مبتدئاً أو لديك خبرة، هذا الدليل سيشرح لك كل زرار بالتفصيل، متى تستخدمه، أهم خواصه، مع أمثلة عملية متنوعة.

----------------------------------
-------- لماذا يوجد أنواع كثيرة من الأزرار؟ --------
----------------------------------

كل نوع من الأزرار له "غرض" و"أهمية" بصرية مختلفة حسب معايير الـ Material Design.

1.  **ElevatedButton (الزر المرتفع):** للأفعال الأكثر أهمية في الصفحة (Primary Actions).
2.  **TextButton (الزر النصي):** للأفعال الثانوية التي لا تريد جذب الانتباه إليها (مثل "إلغاء").
3.  **OutlinedButton (الزر المحدد):** أهم من الزر النصي، لكن أقل أهمية من الزر المرتفع.
4.  **IconButton (زر الأيقونة):** للأفعال التي يمكن تمثيلها بأيقونة (مثل البحث، الحذف).
5.  **FloatingActionButton (زر الإجراء العائم):** للفعل الرئيسي في الشاشة (مثل إضافة عنصر جديد).

================================================================================
========== 1. ElevatedButton (الزر المرتفع/البارز) ==========
================================================================================

هذا هو الزر الأساسي والأكثر استخداماً في تطبيقات Material Design. يتميز بوجود ظل (elevation) يجعله يبدو بارزاً عن الخلفية، مما يجذب انتباه المستخدم.

### متى نستخدمه؟
للإجراءات الرئيسية في الشاشة، مثل "تسجيل الدخول"، "إرسال"، "حفظ".

### أهم الخواص:
- `onPressed`: الدالة التي يتم تنفيذها عند الضغط على الزر. إذا كانت `null`، سيكون الزر معطلاً (disabled).
- `child`: الـ Widget الذي يظهر داخل الزر، وغالباً ما يكون `Text` أو `Row` يحتوي على `Icon` و `Text`.
- `style`: الخاصية الأهم للتحكم في شكل الزر بالكامل. نستخدم معها `ElevatedButton.styleFrom()` لتسهيل التخصيص.

---
### مثال 1: زر بسيط
هذا هو أبسط شكل للـ `ElevatedButton`.

```dart
ElevatedButton(
  onPressed: () {
    print('ElevatedButton Pressed');
  },
  child: const Text('اضغط هنا'),
),
```

---
### مثال 2: زر مخصص بالألوان والأيقونة
هنا سنقوم بتغيير لون الخلفية، لون النص، وإضافة أيقونة بجانب النص.

```dart
ElevatedButton.icon(
  // ElevatedButton.icon هو اختصار لعمل زر يحتوي على أيقونة ونص
  onPressed: () {
    // منطق الحفظ
  },
  icon: const Icon(Icons.save), // الأيقونة
  label: const Text('حفظ التغييرات'), // النص
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green, // لون خلفية الزر
    foregroundColor: Colors.white, // لون النص والأيقونة
    elevation: 5, // درجة الظل
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
),
```

---
### مثال 3: زر بحواف دائرية بالكامل
يمكن التحكم في شكل الحواف باستخدام خاصية `shape`.

```dart
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    shape: const StadiumBorder(), // تجعل الزر بيضاوي الشكل (حوافه دائرية بالكامل)
    // أو يمكن استخدام RoundedRectangleBorder لتحديد درجة الدوران
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(30.0),
    // ),
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
  ),
  child: const Text('متابعة'),
),
```

================================================================================
========== 2. TextButton (الزر النصي) ==========
================================================================================

زر بسيط بدون خلفية أو ظل. يُستخدم للإجراءات الثانوية التي لا نريد أن تكون بارزة.

### متى نستخدمه؟
في مربعات الحوار (Dialogs) لخيارات مثل "إلغاء" أو "لاحقاً"، أو لوضع رابط نصي قابل للضغط.

### أهم الخواص:
- `onPressed`: دالة الضغط.
- `child`: النص أو الـ Widget الداخلي.
- `style`: للتحكم في الألوان والتأثيرات. نستخدم `TextButton.styleFrom()`.

---
### مثال 1: زر "إلغاء" في مربع حوار

```dart
TextButton(
  onPressed: () {
    Navigator.of(context).pop(); // إغلاق مربع الحوار
  },
  child: const Text('إلغاء'),
),
```

---
### مثال 2: زر نصي مخصص اللون مع أيقونة

```dart
TextButton.icon(
  onPressed: () {
    // منطق الرد
  },
  icon: const Icon(Icons.reply),
  label: const Text('رد'),
  style: TextButton.styleFrom(
    foregroundColor: Colors.deepPurple, // لون النص والأيقونة
    textStyle: const TextStyle(
      fontSize: 18,
    ),
  ),
),
```

================================================================================
========== 3. OutlinedButton (الزر المحدد بإطار) ==========
================================================================================

زر له إطار خارجي ولكن بدون لون خلفية. يعتبر حلاً وسطاً بين `ElevatedButton` و `TextButton`.

### متى نستخدمه؟
للإجراءات التي تحتاج بروزاً أكثر من الزر النصي، ولكنها ليست الإجراء الرئيسي في الشاشة. مثال: "إنشاء حساب جديد" في صفحة تسجيل الدخول.

### أهم الخواص:
- `onPressed`: دالة الضغط.
- `child`: الـ Widget الداخلي.
- `style`: للتحكم في شكل الإطار والألوان. نستخدم `OutlinedButton.styleFrom()`.

---
### مثال 1: زر بسيط

```dart
OutlinedButton(
  onPressed: () {
    // منطق الانتقال لصفحة إنشاء حساب
  },
  child: const Text('ليس لديك حساب؟ سجل الآن'),
),
```

---
### مثال 2: زر مخصص بسمك ولون الإطار

```dart
OutlinedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.add_shopping_cart),
  label: const Text('أضف إلى السلة'),
  style: OutlinedButton.styleFrom(
    foregroundColor: Colors.orange, // لون النص والأيقونة والإطار
    side: const BorderSide(
      color: Colors.orange, // يمكن تحديد لون الإطار بشكل منفصل هنا
      width: 2, // سمك الإطار
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),
```

================================================================================
========== 4. IconButton (زر الأيقونة) ==========
================================================================================

زر يحتوي على أيقونة فقط بدون نص. مثالي للاستخدام في الـ `AppBar` أو بجانب العناصر في قائمة.

### أهم الخواص:
- `onPressed`: دالة الضغط.
- `icon`: الـ Widget الخاص بالأيقونة، وغالباً ما يكون `Icon`.
- `iconSize`: حجم الأيقونة.
- `color`: لون الأيقونة.
- `tooltip`: نص صغير يظهر عند الضغط المطول على الزر، مفيد جداً لشرح وظيفة الزر.
- `padding`: لضبط الهوامش حول الأيقونة.
- `constraints`: لتحديد أقل وأكبر حجم للزر.

---
### مثال 1: زر بحث في الـ AppBar

```dart
AppBar(
  title: const Text('الصفحة الرئيسية'),
  actions: [
    IconButton(
      icon: const Icon(Icons.search),
      tooltip: 'بحث',
      onPressed: () {
        // فتح صفحة البحث
      },
    ),
  ],
)
```

---
### مثال 2: زر حذف مخصص الحجم واللون

```dart
IconButton(
  icon: const Icon(Icons.delete_forever),
  iconSize: 30,
  color: Colors.red[700],
  tooltip: 'حذف نهائي',
  // لإزالة الهامش الافتراضي حول الأيقونة
  padding: EdgeInsets.zero,
  constraints: const BoxConstraints(),
  onPressed: () {
    // منطق الحذف
  },
)
```

================================================================================
========== 5. FloatingActionButton (FAB) ==========
================================================================================

زر دائري "عائم" يظهر فوق محتوى الشاشة، ويُستخدم للإجراء الأكثر شيوعاً وأهمية في الصفحة.

### متى نستخدمه؟
لإضافة عنصر جديد (مثل كتابة بريد جديد، إضافة ملاحظة، بدء محادثة).

### أهم الخواص:
- `onPressed`: دالة الضغط.
- `child`: الأيقونة التي تظهر داخل الزر.
- `backgroundColor`: لون خلفية الزر.
- `tooltip`: نص يظهر عند الضغط المطول.
- `heroTag`: معرف فريد للزر. **مهم جداً** إذا كان لديك أكثر من شاشة تحتوي على FAB لمنع حدوث خطأ في الـ Animation أثناء التنقل. أعطِ كل FAB `heroTag` مختلف.
- `shape`: لتغيير شكل الزر من دائري إلى شكل آخر.

---
### مثال 1: FAB بسيط في Scaffold

```dart
Scaffold(
  appBar: AppBar(title: const Text('ملاحظاتي')),
  body: const Center(child: Text('لا يوجد ملاحظات بعد')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      // فتح صفحة إضافة ملاحظة جديدة
    },
    tooltip: 'إضافة ملاحظة',
    child: const Icon(Icons.add),
    heroTag: 'addNoteFab', // heroTag فريد
  ),
)
```

---
### مثال 2: FAB ممتد (Extended)
هذا النوع من الـ FAB يحتوي على أيقونة ونص معاً.

```dart
FloatingActionButton.extended(
  onPressed: () {
    // بدء محادثة جديدة
  },
  label: const Text('محادثة جديدة'),
  icon: const Icon(Icons.edit),
  backgroundColor: Colors.blue,
  heroTag: 'newChatFab',
)
```

---
### مثال 3: FAB بشكل مربع
يمكن تغيير شكل الزر باستخدام خاصية `shape`.

```dart
FloatingActionButton(
  onPressed: () {},
  child: const Icon(Icons.camera_alt),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15), // حواف مربعة مدورة
  ),
  heroTag: 'cameraFab',
)
```

================================================================================
========== 6. DropdownButton & DropdownButtonFormField ==========
================================================================================

`DropdownButton` هو زر يعرض قائمة منسدلة للمستخدم ليختار منها خياراً واحداً. `DropdownButtonFormField` هو نسخة منه تعمل داخل `Form` وتدعم التحقق (Validation).

### أهم الخواص:
- `value`: القيمة المختارة حالياً. يجب أن تكون إحدى القيم الموجودة في `items`.
- `items`: قائمة من `DropdownMenuItem`، كل عنصر يمثل خياراً في القائمة.
- `onChanged`: دالة تُستدعى عند اختيار المستخدم لقيمة جديدة.
- `hint`: نص يظهر عندما تكون القيمة `null`.
- `isExpanded`: إذا كانت `true`، تجعل الزر يأخذ العرض الكامل المتاح له.
- `decoration` (في `DropdownButtonFormField` فقط): تسمح بتخصيص شكل الحقل مثل `TextField`.

---
### مثال 1: قائمة منسدلة بسيطة لاختيار مدينة

```dart
String? selectedCity; // القيمة الحالية المختارة
final List<String> cities = ['الرياض', 'جدة', 'الدمام'];

// ... في الـ build method
DropdownButton<String>(
  hint: const Text('اختر مدينة'),
  value: selectedCity,
  isExpanded: true,
  items: cities.map((String city) {
    return DropdownMenuItem<String>(
      value: city,
      child: Text(city),
    );
  }).toList(),
  onChanged: (String? newValue) {
    setState(() {
      selectedCity = newValue;
    });
  },
),
```

---
### مثال 2: `DropdownButtonFormField` داخل `Form`

```dart
DropdownButtonFormField<String>(
  decoration: InputDecoration(
    labelText: 'الفئة',
    border: OutlineInputBorder(),
  ),
  value: 'عام',
  items: ['عام', 'رياضة', 'تقنية'].map((String category) {
    return DropdownMenuItem<String>(
      value: category,
      child: Text(category),
    );
  }).toList(),
  onChanged: (value) {
    // تحديث الحالة
  },
  validator: (value) {
    if (value == null) {
      return 'الرجاء اختيار فئة';
    }
    return null;
  },
)
```

================================================================================
========== 7. PopupMenuButton ==========
================================================================================

زر يعرض قائمة منبثقة (غالباً ما يكون على شكل ثلاث نقاط رأسية)، ويُستخدم لعرض خيارات إضافية لا تتسع في الواجهة.

### متى نستخدمه؟
في `AppBar` لعرض خيارات مثل "الإعدادات"، "حول التطبيق"، أو بجانب عنصر في قائمة لعرض خيارات مثل "تعديل"، "حذف".

### أهم الخواص:
- `itemBuilder`: دالة تبني عناصر القائمة. يجب أن ترجع قائمة من `PopupMenuItem`.
- `onSelected`: دالة تُستدعى عند اختيار عنصر من القائمة، وتمرر `value` الخاص بالعنصر المختار.
- `icon`: لتغيير أيقونة الثلاث نقاط الافتراضية.

---
### مثال: قائمة خيارات في الـ AppBar

```dart
enum MenuOption { settings, logout }

AppBar(
  title: const Text('Dashboard'),
  actions: [
    PopupMenuButton<MenuOption>(
      onSelected: (MenuOption result) {
        if (result == MenuOption.settings) {
          print('Go to settings');
        } else if (result == MenuOption.logout) {
          print('Logging out...');
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuOption>>[
        const PopupMenuItem<MenuOption>(
          value: MenuOption.settings,
          child: Text('الإعدادات'),
        ),
        const PopupMenuItem<MenuOption>(
          value: MenuOption.logout,
          child: Text('تسجيل الخروج'),
        ),
      ],
    ),
  ],
)
```

================================================================================
========== 8. GestureDetector و InkWell (لجعل أي شيء زراً) ==========
================================================================================

هذه ليست أزراراً بالمعنى الحرفي، بل هي `Widgets` تغلف أي `Widget` آخر (مثل `Container`, `Image`, `Card`) وتجعله قابلاً للضغط.

### الفرق بينهما:
- `GestureDetector`: يكتشف مجموعة واسعة من الإيماءات (`onTap`, `onDoubleTap`, `onLongPress`, `onPanUpdate`...) ولكنه **لا يعطي أي تأثير بصري** عند الضغط.
- `InkWell`: يجب أن يكون داخل `Widget` من نوع `Material`. يعطي تأثير التموج (ripple effect) الجميل عند الضغط، وهو المفضل في تطبيقات Material Design.

---
### مثال 1: جعل صورة قابلة للضغط باستخدام `GestureDetector`

```dart
GestureDetector(
  onTap: () {
    print('Image tapped!');
    // فتح الصورة في وضع ملء الشاشة
  },
  child: Image.asset('assets/profile.png', width: 100, height: 100),
)
```

---
### مثال 2: إضافة تأثير الضغط على `Card` باستخدام `InkWell`

```dart
Card(
  clipBehavior: Clip.antiAlias, // مهم لكي يظهر التأثير داخل حواف الـ Card
  child: InkWell(
    onTap: () {
      print('Card tapped!');
    },
    child: Container(
      padding: const EdgeInsets.all(16.0),
      child: const Text('اضغط على هذه البطاقة لترى التأثير'),
    ),
  ),
)
```

أتمنى أن يكون هذا الدليل قد أوضح لك كل ما يتعلق بالأزرار في Flutter. بالتوفيق!
*/
