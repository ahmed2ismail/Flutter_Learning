/*
================================================================================
==================== Masterclass: التخزين المحلي في Flutter ====================
================================================================================

أهلاً بك في الدليل الشامل لكل ما يخص التخزين المحلي في تطبيقات فلاتر.
سواء كنت تريد حفظ إعدادات بسيطة للمستخدم، أو بناء قاعدة بيانات معقدة، ستجد هنا كل ما تحتاجه.

----------------------------------
-------- لماذا نحتاج للتخزين المحلي؟ --------
----------------------------------

1.  **تجربة بدون انترنت (Offline Experience):** تمكين المستخدم من تصفح المحتوى حتى لو انقطع الاتصال بالإنترنت.
2.  **تحسين الأداء (Performance Boost):** تحميل البيانات من ذاكرة الجهاز أسرع بآلاف المرات من تحميلها من الإنترنت (API)، مما يجعل التطبيق أسرع استجابة.
3.  **حفظ تفضيلات المستخدم (User Preferences):** حفظ إعدادات مثل (الوضع الليلي/النهاري، اللغة، حجم الخط).
4.  **تقليل استهلاك البيانات (Reduce Data Consumption):** تخزين البيانات التي لا تتغير كثيراً (Caching) يقلل من عدد طلبات الشبكة.

================================================================================
========== 1. تخزين المفتاح-القيمة (Key-Value): للإعدادات البسيطة ==========
================================================================================

هذه هي أبسط طريقة للتخزين، تشبه دفتر ملاحظات صغير تسجل فيه معلومة (قيمة) تحت عنوان معين (مفتاح).

----------------------------------
-------- `shared_preferences` --------
----------------------------------

### ما هي؟ ومتى نستخدمها؟
هي أشهر مكتبة لهذا الغرض. مثالية لحفظ كميات صغيرة من البيانات البسيطة (Primitive Types) مثل `String`, `int`, `double`, `bool`, `List<String>`.

**استخدمها عندما تريد حفظ:**
- حالة تسجيل الدخول (هل المستخدم مسجل دخوله أم لا؟).
- اختيار المستخدم للوضع الليلي.
- آخر درجة وصل إليها اللاعب في لعبة بسيطة.
- توكن المصادقة (Authentication Token).

**لا تستخدمها لحفظ:**
- بيانات معقدة أو متشعبة (مثل قائمة منتجات بجميع تفاصيلها).
- كميات كبيرة من البيانات (أداءها يقل).

### كيف نضيفها ونستخدمها؟

1.  **إضافة المكتبة:**
    في ملف `pubspec.yaml`، أضف السطر التالي:
    ```yaml
    dependencies:
      shared_preferences: ^2.2.2
    ```
    ثم قم بتشغيل `flutter pub get` في الـ terminal.

2.  **مثال عملي (حفظ واسترجاع الوضع الليلي):**

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  // دالة لحفظ قيمة الوضع الليلي
  static Future<void> saveThemeMode(bool isDarkMode) async {
    // 1. نحصل على instance من SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    
    // 2. نستخدم setBool لحفظ القيمة. المفتاح هو 'isDarkMode' والقيمة هي المتغير isDarkMode
    await prefs.setBool('isDarkMode', isDarkMode);
    print('Theme mode saved: $isDarkMode');
  }

  // دالة لاسترجاع قيمة الوضع الليلي
  static Future<bool> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    
    // 3. نستخدم getBool لاسترجاع القيمة. إذا لم يجد المفتاح، يرجع القيمة الافتراضية (false)
    // نستخدم '??' للتأكد من أن القيمة ليست null
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    print('Theme mode loaded: $isDarkMode');
    return isDarkMode;
  }

  // دالة لحذف القيمة
  static Future<void> removeThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isDarkMode');
    print('Theme mode removed.');
  }
}

// --- في واجهة المستخدم ---
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    // عند فتح الصفحة، نقوم بتحميل الإعداد المحفوظ
    _loadTheme();
  }

  void _loadTheme() async {
    _isDarkMode = await ThemeManager.getThemeMode();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text('Dark Mode'),
      value: _isDarkMode,
      onChanged: (newValue) {
        setState(() {
          _isDarkMode = newValue;
          // عند تغيير المفتاح، نقوم بحفظ الإعداد الجديد
          ThemeManager.saveThemeMode(newValue);
        });
      },
    );
  }
}
```

================================================================================
==================== 2. قواعد البيانات (Databases) ====================
================================================================================

عندما تتعقد البيانات وتصبح مترابطة، نحتاج إلى نظام أكثر قوة من مجرد مفتاح وقيمة.

----------------------------------
-------- النوع الأول: SQL (Relational) مع `sqflite` --------
----------------------------------

### ما هي؟ ومتى نستخدمها؟
`sqflite` هي مكتبة تتيح لك استخدام قاعدة بيانات `SQLite` (وهي قاعدة بيانات علائقية خفيفة ومدمجة في معظم الأجهزة المحمولة).

**استخدمها عندما:**
- لديك بيانات منظمة في جداول وأعمدة (مثل `Users`, `Products`, `Orders`).
- تحتاج إلى عمل استعلامات (Queries) معقدة (مثل `JOIN`, `GROUP BY`).
- تحتاج إلى ضمانات قوية لسلامة البيانات (ACID Transactions).
- أنت معتاد على لغة SQL.

### كيف نضيفها ونستخدمها؟

1.  **إضافة المكتبات:**
    ```yaml
    dependencies:
      sqflite: ^2.3.0
      path: ^1.8.3 # للمساعدة في تحديد مسار قاعدة البيانات
    ```

2.  **مثال عملي (قاعدة بيانات للملاحظات `Notes`):**

```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Note {
  final int? id;
  final String title;
  final String content;

  Note({this.id, required this.title, required this.content});

  // لتحويل الكائن إلى Map لحفظه في قاعدة البيانات
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}

class DatabaseHelper {
  static Database? _database;
  static const String _tableName = 'notes';

  // دالة للحصول على قاعدة البيانات (إنشائها إذا لم تكن موجودة)
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  // دالة لتهيئة قاعدة البيانات
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'notes_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // عند إنشاء قاعدة البيانات لأول مرة، قم بإنشاء جدول الملاحظات
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT)',
        );
      },
    );
  }

  // --- عمليات CRUD ---

  // Create (إضافة ملاحظة جديدة)
  Future<void> insertNote(Note note) async {
    final db = await database;
    await db.insert(
      _tableName,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // إذا كان الـ id موجود، استبدله
    );
  }

  // Read (قراءة كل الملاحظات)
  Future<List<Note>> getNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
      );
    });
  }

  // Update (تحديث ملاحظة)
  Future<void> updateNote(Note note) async {
    final db = await database;
    await db.update(
      _tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Delete (حذف ملاحظة)
  Future<void> deleteNote(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
```

----------------------------------
-------- النوع الثاني: NoSQL (Object-based) --------
----------------------------------

هذه قواعد بيانات لا تتبع هيكل الجداول والأعمدة الصارم، بل تخزن البيانات ككائنات (Objects)، مما يجعلها أسرع وأكثر مرونة في كثير من الحالات.

### أ. `hive`: السرعة والبساطة

#### ما هي؟ ومتى نستخدمها؟
`Hive` هي قاعدة بيانات NoSQL سريعة جداً، مكتوبة بلغة Dart النقية، مما يجعلها متوافقة تماماً مع Flutter وتعمل على جميع المنصات (Mobile, Desktop, Web).

**استخدمها عندما:**
- تحتاج إلى سرعة فائقة في القراءة والكتابة.
- تريد تخزين كائنات Dart مباشرة بدون تحويلها يدوياً (بعد إعداد بسيط).
- تريد عمل Caching لبيانات الـ API لتحسين الأداء.
- لا تحتاج إلى استعلامات معقدة مثل `sqflite`.

#### كيف نضيفها ونستخدمها؟

1.  **إضافة المكتبات:**
    ```yaml
    dependencies:
      hive: ^2.2.3
      hive_flutter: ^1.1.0 # للتكامل مع فلاتر

    dev_dependencies:
      hive_generator: ^2.0.1 # لتوليد الكود تلقائياً
      build_runner: ^2.4.13 # لتشغيل الأوامر الخاصة بتوليد الكود تلقائياً
يمكن الاضافة عن طريق ال command line:
flutter pub add hive hive_flutter
flutter pub add dev:build_runner:^2.4.13
flutter pub add dev:hive_generator:^2.0.1
    ```

2.  **مثال عملي (قائمة مهام `Todo`):**

    **الخطوة 1: إنشاء الموديل مع `TypeAdapter`**
    ```dart
    // lib/models/todo.dart
    import 'package:hive/hive.dart';

    part 'todo.g.dart'; // سيتم توليد هذا الملف

    @HiveType(typeId: 0) // كل موديل له typeId فريد
    class Todo {
      @HiveField(0) // كل حقل له رقم فريد داخل الموديل
      String title;

      @HiveField(1)
      bool isCompleted;

      Todo({required this.title, this.isCompleted = false});
    }
    ```

    **الخطوة 2: توليد ملف الـ Adapter**
    قم بتشغيل الأمر التالي في الـ terminal:
    `flutter packages pub run build_runner build`
    سيقوم هذا الأمر بإنشاء ملف `todo.g.dart` الذي يحتوي على الكود اللازم لتحويل كائن `Todo` من وإلى صيغة يمكن لـ `Hive` فهمها.

    **الخطوة 3: تهيئة `Hive` واستخدامه**
    ```dart
    // في ملف main.dart
    import 'package:hive_flutter/hive_flutter.dart';
    import 'models/todo.dart';

    void main() async {
      // 1. تهيئة Hive
      await Hive.initFlutter();

      // 2. تسجيل الـ Adapter الذي تم توليده
      Hive.registerAdapter(TodoAdapter());

      // 3. فتح "صندوق" لتخزين المهام. الصندوق يشبه الجدول في SQL.
      await Hive.openBox<Todo>('todos');

      runApp(MyApp());
    }

    // --- في أي مكان آخر في التطبيق ---

    // إضافة مهمة جديدة
    void addTodo(String title) {
      final todoBox = Hive.box<Todo>('todos');
      todoBox.add(Todo(title: title));
    }

    // قراءة المهام (باستخدام ValueListenableBuilder للتحديث التلقائي)
    Widget buildTodoList() {
      final todoBox = Hive.box<Todo>('todos');
      return ValueListenableBuilder(
        valueListenable: todoBox.listenable(),
        builder: (context, Box<Todo> box, _) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final todo = box.getAt(index)!;
              return ListTile(
                title: Text(todo.title),
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (val) {
                    // تحديث المهمة
                    todo.isCompleted = val!;
                    todo.save(); // Hive يقوم بحفظ التغييرات تلقائياً
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // حذف المهمة
                    box.deleteAt(index);
                  },
                ),
              );
            },
          );
        },
      );
    }
    ```

    ``` مثال من ال clean_arch_bookly_app:
    import 'package:hive/hive.dart';

// هنا انا عملت ال BookEntity كلاس بسيط جدا فيه الحقول اللي انا محتاجها في التطبيق بتاعي زي ال bookId و imageUrl و title و authorName و price و rating وكل حقل منهم معمول له HiveField عشان اقدر اخزنه في ال hive box بسهولة وبعدين عملت ال part 'book_entity.g.dart' عشان اقدر استخدم ال code generation اللي بيقدمه ال hive عشان يكتبلي الكود اللي بيحول ال BookEntity ل json والعكس بسهولة وبكده اقدر اخزن البيانات اللي جايالي من ال api محليا في الجهاز باستخدام ال hive واقدر اجيبها تاني لما احتاجها بدون ما احتاج اتصل بال api مرة تانية
// هنعمل ال typeAdapter:

part 'book_entity.g.dart';

@HiveType(typeId: 0) // ال typeId ده رقم مميز لكل كلاس انت بتعمله عشان ال hive يقدر يفرق بين الكلاسات المختلفة اللي انت بتسجلها في ال hive
class BookEntity {
  @HiveField(0) // ال HiveField ده بيحدد رقم الحقل في ال hive box عشان يقدر يخزنه ويجيبه بسهولة من ال hive box لما يحتاجه
  final String bookId;
  @HiveField(1)
  final String? imageUrl;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;

  BookEntity({
    required this.imageUrl,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.bookId,
  });
}
- بعد كده هتحتاج تشغل ال command ده في ال terminal عشان يكتبلك الكود اللي بيحول ال BookEntity ل json والعكس:
flutter packages pub run build_runner build
- بعد ما تشغل ال command ده هيتم توليد ملف اسمه book_entity.g.dart فيه الكود اللي بيحول ال BookEntity ل json والعكس وده بيسهل عليك تخزين البيانات في ال hive box واسترجاعها بسهولة بدون ما تحتاج تكتب الكود ده بنفسك
- بعد كده في ملف ال main.dart هتحتاج تهيئ ال hive وتسجل ال adapter اللي تم توليده عشان تقدر تستخدم ال BookEntity في ال hive box بسهولة
void main() async {
  // 1. تهيئة Hive
  await Hive.initFlutter();

  // 2. تسجيل ال TypeAdapter الخاص ب BookEntity
  Hive.registerAdapter(BookEntityAdapter());

  // 3. فتح "صندوق" لتخزين المهام. الصندوق يشبه الجدول في SQL.
  // هنا بنفتح صندوق باسم kFeaturedBox لتخزين الكتب المميزة وصندوق تاني باسم kNewestBox لتخزين الكتب الجديدة
  await Hive.openBox<BookEntity>('featured_box');
  await Hive.openBox<BookEntity>('newest_box');

  runApp(const CleanArchBooklyApp());
}
- دلوقت بق المفروض بعد م fetchFeaturedBooks و fetchNewestBooks من ال api(HomeRemoteDataSource) فهخزن البيانات اللي جايالي في ال hive box عندي علي الجهاز بق
import 'package:clean_arch_bookly_app/Core/utils/api_service.dart';
import 'package:clean_arch_bookly_app/Features/home/data/models/books_model/books_model.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  // النوع هنا هو Future<List<BookEntity>> من غير Either عشان احنا بنرجع List of BookEntity يعني قائمة من الكتب وكل كتاب هو عبارة عن BookEntity فقط ومش بنتعامل مع الاخطاء هنا عشان دي لجلب البيانات فقط اما التعامل مع الاخطاء فدي في ال impl بتاع ال homeRepo لان ال homeRepo هو اللي بيتعامل مع ال data sources كلها سواء كانت remote او local وبيتعامل مع الاخطاء اللي ممكن تحصل في اي منهم وبيرجع النتيجة اللي جايه من ال data source سواء كانت بيانات او خطأ للي فوق اللي هو ال use case
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final data = await apiService.getRequest(
      endpoint: 'volumes?Filtering=free-ebooks&q=programming',
    );
    // هنا انا جبت البيانات من ال api وبعدين حولتها لقائمة من ال BookEntity باستخدام ال getBooksList اللي بتحول ال json اللي جايلي من ال api لقائمة من ال BookEntity وبعدين خزنتها في ال hive box اللي اسمه kFeaturedBox عشان اقدر اجيبها تاني لما احتاجها بدون ما احتاج اتصل بال api مرة تانية 
    var box = Hive.box<BookEntity>(kFeaturedBox);
    box.addAll(getBooksList(data));
    return getBooksList(data);
  }


  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    final data = await apiService.getRequest(
      endpoint: 'volumes?Filtering=free-ebooks&q=programming&Sorting=newest',
    );
    var box = Hive.box<BookEntity>(kNewestBox);
    box.addAll(getBooksList(data));
    return getBooksList(data);
  }

    List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BooksModel.fromJson(item));
    }
    return books;
  }
}

- بعد كده هنجيب البيانات بتاعة ال api ونحطها في ال local data source بتاعنا:
import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  // ال type هنا هيكون list<BookEntity> من غير Future عشان دي بيانات محليه يعني مش بتاخد وقت في جلبها زي ال remote data source اللي بتاخد وقت في جلب البيانات من الانترنت فبنستخدم Future عشان نقدر نتعامل مع الوقت ده اما هنا فبنرجع البيانات مباشره من غير ما نحتاج نتعامل مع الوقت لانها متكيشة عندي في الجهاز
  // انا سميت هنا getLastFeaturedBooks و getLastNewestBooks عشان دي بتجيب اخر بيانات جتلي من ال api يعني اخر قائمة كتب جتلي من ال api سواء كانت featured او newest ودي بتكون مخزنة عندي في الجهاز فلو حصل اي مشكلة في الانترنت او اي حاجة تانية اقدر اجيب البيانات اللي عندي في الجهاز بدل ما اجيبها من ال api مرة تانية ودي بتكون مفيدة جدا في حالة ان المستخدم مش متصل بالانترنت او حصل اي مشكلة في الاتصال بالانترنت فبيقدر يشوف البيانات اللي عنده في الجهاز بدل ما يشوف رسالة خطأ او حاجة زي كده
  List<BookEntity> getLastFeaturedBooks();
  List<BookEntity> getLastNewestBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> getLastFeaturedBooks() {
    // هنا ممكن نستخدم اي طريقة لتخزين البيانات محليا زي shared preferences او hive او sqflite او اي طريقة تانية حسب ما يناسب التطبيق بتاعك
    // في المثال ده انا هستخدم hive لتخزين البيانات اللي جايالي من ال api محليا
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> getLastNewestBooks() {
    // هنا انا بجيب البيانات اللي مخزنة عندي في ال hive box اللي اسمه kNewestBox وبحولها لقائمة من ال BookEntity وبيرجعها لي ال homeRepo اللي بيستخدمها في ال use case بتاعه عشان يقدر يعرضها في ال ui بتاعه
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}

    ```
### `shared preferences`: للحالات البسيطة جداً

#### ما هي؟ ومتى نستخدمها؟
`Shared Preferences` هي مكتبة لتخزين البيانات البسيطة في شكل مفتاح-قيمة (Key-Value)، وهي مثالية لحفظ إعدادات المستخدم أو بيانات صغيرة لا تحتاج إلى هيكل معقد.

**استخدمها عندما:**
- تريد حفظ إعدادات بسيطة مثل (الوضع الليلي، اللغة، حجم الخط).
- تريد تخزين بيانات صغيرة مثل (توكن المصادقة، حالة تسجيل الدخول).

#### كيف نضيفها ونستخدمها؟

1.  **إضافة المكتبة:**
    ```yaml
    dependencies:
      shared_preferences: ^2.2.2

2.  **مثال عملي (حفظ استجابة API كبيرة كملف JSON مؤقت):**
// 2. مثال عملي 
    import 'dart:convert';
    import 'package:shared_preferences/shared_preferences.dart';

    class CacheManager {
      // دالة لحفظ استجابة API كاملة (JSON)
      static Future<void> cacheApiResponse(String key, Map<String, dynamic> jsonResponse) async {
        final prefs = await SharedPreferences.getInstance();
        // نحول الـ Map إلى String باستخدام json.encode لأن المكتبة لا تخزن Maps
        String jsonString = json.encode(jsonResponse);
        await prefs.setString(key, jsonString);
        print('Data cached successfully under key: $key');
      }

      // دالة لاسترجاع الاستجابة وتحويلها مرة أخرى لـ Map
      static Future<Map<String, dynamic>?> getCachedResponse(String key) async {
        final prefs = await SharedPreferences.getInstance();
        String? jsonString = prefs.getString(key);
        
        if (jsonString != null) {
          // نحول الـ String مرة أخرى إلى Map باستخدام json.decode
          return json.decode(jsonString) as Map<String, dynamic>;
        }
        return null; // إذا لم تكن البيانات موجودة
      }

      // دالة للتحقق من وجود بيانات معينة
      static Future<bool> hasCache(String key) async {
        final prefs = await SharedPreferences.getInstance();
        return prefs.containsKey(key);
      }
    }
  ~~~

    // --- في أي مكان آخر في التطبيق ---
      // 3. مثال عملي (تخزين حالة شاشات الـ Onboarding):
      // نستخدم هذا المثال لمنع ظهور شاشات الترحيب للمستخدم أكثر من مرة واحدة.

      static Future<void> setOnboardingVisited() async {
        final prefs = await SharedPreferences.getInstance();
        // نحفظ قيمة true للمفتاح 'onboarding_visited'
        await prefs.setBool('onboarding_visited', true); // بنعمل كده في الاماكن اللي بنضغط فيها واللي فيها منطق ال navigation
      }

      static Future<bool> isOnboardingVisited() async {
        final prefs = await SharedPreferences.getInstance();
        // نرجع القيمة وإذا كانت null (أول مرة يفتح التطبيق) نرجع false
        return prefs.getBool('onboarding_visited') ?? false; // بنعمل كده في ال main.dart عشان نحدد شاشة البداية بناءً على هل المستخدم فتح التطبيق قبل كده ولا لأ او في الشاشة اللي بتظهر بعد ال onboarding زي ال SplashView في المكان اللي فيه منطق التنقل برده عشان نحدد هل نرجع المستخدم لل onboarding تاني ولا نرجعه لل home page
      }

      /*
      // هنكتب دا في الشاشة اللي فيها منطق التنقل:
        final visited = Prefs.getBool(AppConstants.kOnboardingVisitedKey);
        if (visited) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginView.routeName,
            (route) => false,
          );
        } else {
          Navigator.pushReplacement(
            context,
            OnBoardingView.routeName as Route<Object?>,
          );
        }

      كيفية الاستخدام في ملف main.dart لتحديد شاشة البداية:
      
      void main() async {
        WidgetsFlutterBinding.ensureInitialized(); // تأكد من تهيئة Flutter قبل استخدام SharedPreferences
        bool visited = await CacheManager.isOnboardingVisited();
        
        runApp(MaterialApp(
          home: visited ? const HomePage() : const OnBoardingPage(),
        ));
      }
      */

    ```

### ب. `isar`: الجيل الجديد من قواعد البيانات

#### ما هي؟ ومتى نستخدمها؟
`Isar` هي قاعدة بيانات NoSQL حديثة وسريعة جداً، تعتبر خليفة `Hive` وتتفوق عليها في عدة نقاط. تم بناؤها خصيصاً لـ Flutter.

**مميزاتها عن Hive:**
- **استعلامات متقدمة:** تدعم استعلامات أكثر تعقيداً (filtering, sorting, distinct).
- **بحث نصي كامل (Full-text search):** يمكنك البحث عن كلمات داخل النصوص بكفاءة.
- **دعم للـ Transactions:** تضمن سلامة البيانات بشكل أفضل.
- **واجهة مستخدم للمطورين (Isar Inspector):** تتيح لك تصفح بياناتك مباشرة أثناء تشغيل التطبيق.

**استخدمها عندما:**
- تحتاج إلى كل مميزات `Hive` بالإضافة إلى استعلامات أقوى وبحث نصي.
- تبدأ مشروعاً جديداً وتريد استخدام أحدث التقنيات وأكثرها قوة.

#### كيف نضيفها ونستخدمها؟

1.  **إضافة المكتبات:**
    ```yaml
    dependencies:
      isar: ^3.1.0+1
      isar_flutter_libs: ^3.1.0+1 # للتكامل مع فلاتر

    dev_dependencies:
      isar_generator: ^3.1.0+1
      build_runner: ^2.4.7
    ```

2.  **مثال عملي (نفس مثال `Todo`):**

    **الخطوة 1: إنشاء الموديل (يسمى `Collection`)**
    ```dart
    // lib/models/todo_isar.dart
    import 'package:isar/isar.dart';

    part 'todo_isar.g.dart'; // سيتم توليد هذا الملف

    @collection
    class TodoIsar {
      Id id = Isar.autoIncrement; // Isar يدير الـ ID تلقائياً

      late String title;

      bool isCompleted = false;
    }
    ```

    **الخطوة 2: توليد الكود**
    `flutter packages pub run build_runner build`

    **الخطوة 3: تهيئة `Isar` واستخدامه**
    ```dart
    // في ملف main.dart
    import 'package:isar/isar.dart';
    import 'package:path_provider/path_provider.dart';
    import 'models/todo_isar.dart';

    late Isar isar; // instance عام للوصول إليه من أي مكان

    void main() async {
      WidgetsFlutterBinding.ensureInitialized();

      // 1. تهيئة Isar
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [TodoIsarSchema], // نمرر الـ Schema الذي تم توليده
        directory: dir.path,
      );

      runApp(MyApp());
    }

    // --- في أي مكان آخر في التطبيق ---

    // إضافة مهمة
    void addTodoIsar(String title) async {
      final newTodo = TodoIsar()..title = title;
      
      // Isar يتطلب كتابة العمليات داخل transaction
      await isar.writeTxn(() async {
        await isar.todoIsars.put(newTodo);
      });
    }

    // قراءة كل المهام
    Future<List<TodoIsar>> getAllTodos() async {
      return await isar.todoIsars.where().findAll();
    }

    // قراءة المهام غير المكتملة فقط (مثال على الاستعلام)
    Future<List<TodoIsar>> getIncompleteTodos() async {
      return await isar.todoIsars.filter().isCompletedEqualTo(false).findAll();
    }
    ```

================================================================================
========== 4. تخزين الملفات مباشرة (File Storage) ==========
================================================================================

### `path_provider` و `dart:io`

#### ما هي؟ ومتى نستخدمها؟
أحياناً كل ما تحتاجه هو حفظ ملف كما هو (صورة، ملف PDF، نص JSON كبير). هنا نستخدم مكتبات Dart الأساسية للتعامل مع نظام الملفات.

**استخدمها عندما:**
- تريد حفظ استجابة API كبيرة كملف JSON مؤقت (Caching).

#### كيف نضيفها ونستخدمها؟

1.  **إضافة المكتبة:**
    (مكتبة `dart:io` مدمجة في Dart، لا تحتاج لإضافتها).
    ```yaml
    dependencies:
      path_provider: ^2.1.1
    ```

2.  **مثال عملي (حفظ وقراءة ملف نصي):**
    ```dart
    import 'dart:io';
    import 'package:path_provider/path_provider.dart';

    class FileStorageHelper {
      // دالة للحصول على مسار الملف
      static Future<String> get _localPath async {
        final directory = await getApplicationDocumentsDirectory();
        return directory.path;
      }

      // دالة للحصول على الملف نفسه
      static Future<File> get _localFile async {
        final path = await _localPath;
        return File('$path/my_data.txt');
      }

      // دالة لكتابة نص في الملف
      static Future<File> writeData(String data) async {
        final file = await _localFile;
        return file.writeAsString(data);
      }

      // دالة لقراءة النص من الملف
      static Future<String> readData() async {
        try {
          final file = await _localFile;
          String contents = await file.readAsString();
          return contents;
        } catch (e) {
          // إذا لم يتم العثور على الملف أو حدث خطأ
          return 'No data found!';
        }
      }
    }
    ```

================================================================================
==================== مقارنة سريعة: متى تختار ماذا؟ ====================
================================================================================

| الميزة                       | `shared_preferences`          | `sqflite`                           | `hive` / `isar`                     | `File Storage`                |
| --------------------------- | ----------------------------- | ---------------------------------- | ----------------------------------- | ----------------------------- |
| **نوع التخزين** |                 مفتاح-قيمة (Key-Value)     | SQL (علائقي)                         | NoSQL (كائني)                       | ملفات خام (Raw Files)          |
| **أفضل استخدام** | إعدادات بسيطة، توكن، حالة UI             | بيانات معقدة ومترابطة               | Caching، تخزين كائنات Dart          | صور، مستندات، JSON            |
| **البيانات المناسبة**        | `bool`, `int`, `String`...    | جداول، أعمدة، علاقات |                               كائنات Dart (Objects)  | أي نوع من الملفات              |
| **الأداء** |         جيد للبيانات الصغيرة  |           جيد، لكن أبطأ من NoSQL                       | سريع جداً (Hive/Isar الأسرع)           | يعتمد على حجم الملف            |
| **سهولة الإعداد** |                        سهل جداً |                       متوسط (يتطلب معرفة بـ SQL) | سهل (يتطلب توليد كود) |   متوسط (يتطلب التعامل مع المسارات)          |
| **الاستعلامات** |     لا يوجد (جلب بالمفتاح فقط) |                    قوية جداً (SQL)                    | بسيطة (Hive) إلى متقدمة (Isar)       | لا يوجد                          |

================================================================================
================================ الخلاصة ================================
================================================================================

لا يوجد "أفضل" حل دائمًا، بل "أنسب" حل للمشكلة التي تواجهها.

-   **لحفظ إعدادات بسيطة؟** استخدم `shared_preferences`.
-   **لديك بيانات معقدة ومنظمة وتحب SQL؟** استخدم `sqflite`.
-   **تريد السرعة والسهولة وتخزين كائنات Dart مباشرة (Caching)؟** `hive` خيار ممتاز ومستقر.
-   **تريد كل قوة Hive مع مميزات إضافية مثل البحث النصي والاستعلامات المتقدمة؟** `isar` هو المستقبل وهو الخيار الأقوى حالياً للمشاريع الجديدة.
-   **تريد فقط حفظ ملف كما هو؟** استخدم `path_provider` مع `dart:io`.

أتمنى أن يكون هذا الدليل قد أوضح لك الصورة الكاملة. بالتوفيق في رحلتك مع Flutter!

*/