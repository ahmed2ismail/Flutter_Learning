/*
==================================================================================================
============================= الدليل الشامل لـ Cloud Firestore في فلاتر =============================
==================================================================================================

أهلاً بك يا صديقي في رحلة احتراف Cloud Firestore، قاعدة بيانات NoSQL القوية من Firebase.
في هذا الملف، سنغوص في كل تفاصيل Firestore، من الإعداد الأساسي وحتى العمليات المتقدمة مثل الـ Transactions والـ Batched Writes.
سنتعلم كيف نقرأ ونكتب البيانات بطرق مختلفة، وكيف نكتب كوداً نظيفاً وآمناً وقابلاً للتطوير.

--------------------------------------------------------------------------------------------------
أولاً: ما هو Cloud Firestore؟
--------------------------------------------------------------------------------------------------

Firestore هي قاعدة بيانات NoSQL سحابية مرنة وقابلة للتطوير، مصممة لتخزين ومزامنة البيانات بين تطبيقاتك في الوقت الفعلي (Real-time).
- **NoSQL**: لا تتبع هيكل الجداول والأعمدة الصارم مثل SQL. بدلاً من ذلك، تخزن البيانات في "مستندات" (Documents) تشبه ملفات JSON، وهذه المستندات يتم تنظيمها داخل "مجموعات" (Collections).
- **Real-time**: أي تغيير يحدث في قاعدة البيانات يتم إرساله فوراً إلى كل الأجهزة المتصلة التي تستمع لهذه البيانات. هذا يجعلها مثالية لتطبيقات الدردشة، الألعاب، والتطبيقات التي تتطلب تحديثات حية.
- **Offline Support**: تدعم العمل دون اتصال بالإنترنت. أي تغييرات يجريها المستخدم وهو غير متصل يتم حفظها محلياً، وعندما يعود الاتصال، تتم مزامنتها تلقائياً مع السيرفر.

--------------------------------------------------------------------------------------------------
ثانياً: الإعداد والتهيئة (خطوة بخطوة)
--------------------------------------------------------------------------------------------------

قبل أن نبدأ، تأكد من أنك قمت بإعداد Firebase في مشروعك. إذا لم تفعل، ارجع إلى ملف `firebase_learning.dart`.

1. **إضافة الحزمة (Dependency):**
   افتح الـ terminal في مشروعك واكتب الأمر التالي:
   ```bash
   flutter pub add cloud_firestore
   ```
   سيقوم هذا الأمر بإضافة `cloud_firestore` إلى ملف `pubspec.yaml` الخاص بك.

2. **الحصول على Instance من Firestore:**
   في أي ملف Dart تريد استخدام Firestore فيه، يجب أن تقوم باستيراد الحزمة وإنشاء instance.

   **أين أضع هذا الكود؟**
   - **للتجارب السريعة:** يمكنك وضعه مباشرة في أي Widget.
   - **في المشاريع الحقيقية (Clean Architecture):** يجب أن يكون هذا الكود داخل كلاسات الـ Repository في طبقة الـ Data. (راجع ملف `database_structure_masterclass.dart` لفهم الـ Repository Pattern).

   ```dart
   // في أعلى الملف
   import 'package:cloud_firestore/cloud_firestore.dart';

   // داخل الكلاس أو الدالة
   final FirebaseFirestore firestore = FirebaseFirestore.instance;
   ```
   هذا الـ `firestore` هو بوابتك لكل عمليات قاعدة البيانات.

--------------------------------------------------------------------------------------------------
ثالثاً: كتابة البيانات (Create, Update, Delete)
--------------------------------------------------------------------------------------------------

هناك عدة طرق لإضافة وتعديل البيانات في Firestore.

**1. إضافة مستند جديد (Adding a Document):**

لدينا طريقتان: `add` و `set`.

*   **`add()`: لإنشاء مستند بـ ID عشوائي (Auto-generated ID)**
    هذه الطريقة مثالية عندما لا تهتم بمعرّف المستند وتريد من Firestore أن ينشئه لك.

    **مثال: إضافة مستخدم جديد إلى collection اسمها `users`**
    ```dart
    // افترض أن هذا الكود داخل دالة في الـ UserRepositoryImpl
    Future<void> addUserWithAutoId(Map<String, dynamic> userData) async {
      try {
        // .collection('users') يشير إلى مجموعة المستخدمين
        // .add(userData) يضيف مستنداً جديداً بالبيانات الممررة
        await firestore.collection('users').add(userData);
        print("User Added with Auto ID");
      } catch (e) {
        print("Failed to add user: $e");
      }
    }

    // كيفية الاستدعاء من الـ UI أو الـ Cubit
    // addUserWithAutoId({
    //   'fullName': 'Ahmed Ali',
    //   'email': 'ahmed@example.com',
    //   'createdAt': Timestamp.now(), // لإضافة تاريخ الإنشاء
    // });
    ```

*   **`set()`: لإنشاء مستند بـ ID مخصص (Custom ID)**
    هذه الطريقة مفيدة عندما تريد استخدام ID معين، مثل `uid` الخاص بالمستخدم من Firebase Authentication.

    **تحذير:** إذا استخدمت `set` على مستند موجود بالفعل، سيتم **استبدال كل بياناته** بالبيانات الجديدة (ما لم تستخدم `merge`).

    **مثال: حفظ بيانات مستخدم باستخدام الـ `uid` الخاص به**
    ```dart
    // افترض أن هذا الكود داخل دالة في الـ AuthRepositoryImpl
    Future<void> saveUserDataWithCustomId(String userId, Map<String, dynamic> userData) async {
      try {
        // .collection('users') يشير إلى مجموعة المستخدمين
        // .doc(userId) يحدد المستند الذي يحمل الـ ID المخصص
        // .set(userData) يضع البيانات في هذا المستند
        await firestore.collection('users').doc(userId).set(userData);
        print("User Data Saved with Custom ID");
      } catch (e) {
        print("Failed to save user data: $e");
      }
    }
    ```

**2. تعديل مستند (Updating a Document):**

*   **`update()`: لتعديل حقول معينة دون مسح الباقي**
    هذه هي الطريقة الأكثر أماناً لتعديل البيانات.

    ```dart
    Future<void> updateUserEmail(String userId, String newEmail) async {
      try {
        await firestore.collection('users').doc(userId).update({
          'email': newEmail,
          'lastModified': Timestamp.now(),
        });
        print("User Email Updated");
      } catch (e) {
        print("Failed to update user: $e");
      }
    }
    ```
    يمكنك أيضاً تعديل حقول متداخلة (nested fields) باستخدام `.`
    `'address.city': 'Cairo'`

*   **`set()` مع `SetOptions(merge: true)`: لدمج البيانات**
    هذه الطريقة تقوم بنفس وظيفة `update` تقريباً. إذا كان المستند موجوداً، ستدمج البيانات الجديدة معه. إذا لم يكن موجوداً، ستنشئه.

    ```dart
    Future<void> mergeUserData(String userId, Map<String, dynamic> newData) async {
      try {
        await firestore.collection('users').doc(userId).set(
          newData,
          SetOptions(merge: true),
        );
        print("User Data Merged");
      } catch (e) {
        print("Failed to merge data: $e");
      }
    }
    ```

**3. حذف مستند أو حقل (Deleting Data):**

*   **`delete()`: لحذف مستند بالكامل**
    ```dart
    Future<void> deleteUser(String userId) async {
      try {
        await firestore.collection('users').doc(userId).delete();
        print("User Deleted");
      } catch (e) {
        print("Failed to delete user: $e");
      }
    }
    ```

*   **`FieldValue.delete()`: لحذف حقل معين من المستند**
    ```dart
    Future<void> removeUserPhoneNumber(String userId) async {
      try {
        await firestore.collection('users').doc(userId).update({
          'phoneNumber': FieldValue.delete(),
        });
        print("Phone number field removed");
      } catch (e) {
        print("Failed to remove field: $e");
      }
    }
    ```

--------------------------------------------------------------------------------------------------
رابعاً: قراءة البيانات (Read)
--------------------------------------------------------------------------------------------------

هناك طريقتان رئيسيتان لقراءة البيانات: قراءة لمرة واحدة، أو الاستماع للتغييرات في الوقت الفعلي.

**1. القراءة لمرة واحدة (One-time Read) باستخدام `.get()`**
   تستخدم هذه الطريقة عندما تريد جلب البيانات مرة واحدة فقط دون الاستماع للتحديثات.
   - `.get()` ترجع `Future`.
   - أفضل طريقة لاستخدامها في الـ UI هي مع `FutureBuilder`.

   **مثال: عرض اسم مستخدم معين في صفحة البروفايل**
   ```dart
   // هذا Widget يمكن وضعه في أي مكان في شجرة الـ UI
   class UserProfileName extends StatelessWidget {
     final String userId;
     const UserProfileName({Key? key, required this.userId}) : super(key: key);

     @override
     Widget build(BuildContext context) {
       // نصل إلى collection المستخدمين
       CollectionReference users = FirebaseFirestore.instance.collection('users');

       return FutureBuilder<DocumentSnapshot>(
         // future هو الطلب الذي نرسله لجلب البيانات
         future: users.doc(userId).get(),
         builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
           // 1. التعامل مع الأخطاء
           if (snapshot.hasError) {
             return Text("Something went wrong");
           }

           // 2. التعامل مع حالة عدم وجود المستند
           if (snapshot.hasData && !snapshot.data!.exists) {
             return Text("User does not exist");
           }

           // 3. التعامل مع حالة اكتمال جلب البيانات بنجاح
           if (snapshot.connectionState == ConnectionState.done) {
             // snapshot.data هو المستند الذي تم جلبه
             // .data() يحول المستند إلى Map<String, dynamic>
             Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
             return Text("Welcome, ${data['fullName']}");
           }

           // 4. التعامل مع حالة التحميل (Loading)
           return Text("loading...");
         },
       );
     }
   }
   ```

**2. الاستماع للتغييرات في الوقت الفعلي (Real-time) باستخدام `.snapshots()`**
   تستخدم هذه الطريقة عندما تريد أن يتحدث الـ UI تلقائياً عند حدوث أي تغيير في البيانات.
   - `.snapshots()` ترجع `Stream`.
   - أفضل طريقة لاستخدامها في الـ UI هي مع `StreamBuilder`.

   **مثال: عرض قائمة الرسائل في تطبيق دردشة**
   ```dart
   // هذا Widget يمثل شاشة الدردشة
   class ChatMessages extends StatelessWidget {
     final String chatId;
     const ChatMessages({Key? key, required this.chatId}) : super(key: key);

     @override
     Widget build(BuildContext context) {
       // ننشئ Stream يستمع للتغييرات في collection الرسائل
       final Stream<QuerySnapshot> messagesStream = FirebaseFirestore.instance
           .collection('chats')
           .doc(chatId)
           .collection('messages')
           .orderBy('timestamp', descending: true) // لترتيب الرسائل من الأحدث للأقدم
           .snapshots();

       return StreamBuilder<QuerySnapshot>(
         stream: messagesStream,
         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
           if (snapshot.hasError) {
             return Text('Something went wrong');
           }

           if (snapshot.connectionState == ConnectionState.waiting) {
             return Center(child: CircularProgressIndicator());
           }

           // إذا نجح الاتصال وجاءت البيانات
           return ListView(
             reverse: true, // لعرض آخر رسالة في الأسفل
             // snapshot.data.docs هي قائمة بكل المستندات (الرسائل)
             children: snapshot.data!.docs.map((DocumentSnapshot document) {
               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
               return ListTile(
                 title: Text(data['senderName']),
                 subtitle: Text(data['text']),
               );
             }).toList(),
           );
         },
       );
     }
   }
   ```

--------------------------------------------------------------------------------------------------
خامساً: الاستعلام والفلترة (Querying and Filtering)
--------------------------------------------------------------------------------------------------

Firestore يوفر إمكانيات قوية للاستعلام عن البيانات.

*   **`.where()` للفلترة:**
    ```dart
    // جلب كل المنتجات التي سعرها أكبر من 100
    firestore.collection('products').where('price', isGreaterThan: 100).get();

    // جلب كل المستخدمين الذين يسكنون في 'Cairo'
    firestore.collection('users').where('city', isEqualTo: 'Cairo').get();

    // جلب المنتجات الموجودة في قسم 'Electronics' أو 'Books'
    firestore.collection('products').where('category', whereIn: ['Electronics', 'Books']).get();
    ```

*   **`.orderBy()` للترتيب:**
    ```dart
    // ترتيب المنتجات حسب السعر من الأقل للأعلى
    firestore.collection('products').orderBy('price').get();

    // ترتيب المنتجات حسب السعر من الأعلى للأقل
    firestore.collection('products').orderBy('price', descending: true).get();
    ```

*   **`.limit()` لتحديد عدد النتائج:**
    ```dart
    // جلب أول 5 منتجات فقط
    firestore.collection('products').limit(5).get();
    ```

**مثال مركب:** جلب أغلى 3 كتب تم إضافتها مؤخراً.
```dart
firestore
    .collection('products')
    .where('category', isEqualTo: 'Books') // فلترة حسب القسم
    .orderBy('createdAt', descending: true) // ترتيب حسب تاريخ الإضافة
    .orderBy('price', descending: true) // ثم ترتيب حسب السعر
    .limit(3) // جلب 3 فقط
    .get();
```

--------------------------------------------------------------------------------------------------
سادساً: الممارسة الاحترافية - استخدام `withConverter` للكود النظيف والآمن
--------------------------------------------------------------------------------------------------

التعامل مع `Map<String, dynamic>` مباشرة يمكن أن يسبب أخطاء (Typo errors) ويجعل الكود صعب القراءة. الحل الاحترافي هو استخدام `withConverter` لتحويل بيانات Firestore من وإلى كائنات Dart (Objects/Models).

**الخطوة 1: إنشاء الـ Model Class**
   في طبقة الـ Domain، أنشئ كلاس يمثل بياناتك.

   **ملف: `lib/features/users/domain/entities/user_entity.dart`**
   ```dart
   class UserEntity {
     final String id;
     final String fullName;
     final String email;

     UserEntity({required this.id, required this.fullName, required this.email});

     // دالة لتحويل الـ Map القادم من Firestore إلى UserEntity
     factory UserEntity.fromFirestore(DocumentSnapshot doc) {
       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
       return UserEntity(
         id: doc.id, // نحصل على الـ ID من المستند نفسه
         fullName: data['fullName'] ?? '',
         email: data['email'] ?? '',
       );
     }

     // دالة لتحويل الـ UserEntity إلى Map لإرساله إلى Firestore
     Map<String, dynamic> toFirestore() {
       return {
         'fullName': fullName,
         'email': email,
       };
     }
   }
   ```

**الخطوة 2: استخدام `withConverter`**
   في الـ Repository (طبقة الـ Data)، قم بإنشاء `CollectionReference` من نوع الـ Model الخاص بك.

   **ملف: `lib/features/users/data/repositories/user_repository_impl.dart`**
   ```dart
   class FirebaseUserRepositoryImpl {
     // إنشاء مرجع للـ collection مع تحديد نوع البيانات
     final CollectionReference<UserEntity> usersRef =
         FirebaseFirestore.instance.collection('users').withConverter<UserEntity>(
               // fromFirestore: كيف تحول بيانات Firestore إلى كائن UserEntity
               fromFirestore: (snapshot, _) => UserEntity.fromFirestore(snapshot),
               // toFirestore: كيف تحول كائن UserEntity إلى بيانات Map لـ Firestore
               toFirestore: (user, _) => user.toFirestore(),
             );

     // الآن، كل العمليات ستكون Type-Safe!
     Future<void> saveUser(UserEntity user) async {
       // لاحظ أن .set() الآن تتوقع كائن من نوع UserEntity وليس Map
       await usersRef.doc(user.id).set(user);
     }

     Future<UserEntity?> getUser(String userId) async {
       // .get() الآن ترجع DocumentSnapshot<UserEntity>
       final docSnapshot = await usersRef.doc(userId).get();
       // .data() الآن ترجع كائن UserEntity مباشرة
       return docSnapshot.data();
     }
   }
   ```
   هذه الطريقة تجعل كودك أكثر أماناً ونظافة وسهولة في الصيانة.

--------------------------------------------------------------------------------------------------
سابعاً: مواضيع متقدمة (Transactions and Batched Writes)
--------------------------------------------------------------------------------------------------

**1. Transactions (المعاملات):**
   تُستخدم لضمان تنفيذ مجموعة من عمليات القراءة والكتابة كوحدة واحدة (ذرية/Atomic). إذا فشلت أي عملية، يتم التراجع عن كل العمليات.
   **متى تستخدمها؟** عندما تعتمد عملية الكتابة على قيمة حالية في قاعدة البيانات.
   **مثال:** زيادة عدد المتابعين. لو قام مستخدمان بالضغط على "متابعة" في نفس اللحظة، بدون transaction، قد يتم حساب متابعة واحدة فقط.

   ```dart
   Future<void> incrementFollowers(String userId) async {
     final userDocRef = firestore.collection('users').doc(userId);

     await firestore.runTransaction((transaction) async {
       // 1. اقرأ المستند داخل الـ transaction
       final snapshot = await transaction.get(userDocRef);

       if (!snapshot.exists) {
         throw Exception("User does not exist!");
       }

       // 2. قم بحساب القيمة الجديدة
       final int newFollowersCount = (snapshot.data()!['followers'] ?? 0) + 1;

       // 3. قم بتحديث المستند داخل الـ transaction
       transaction.update(userDocRef, {'followers': newFollowersCount});
     });
   }
   ```

**2. Batched Writes (الكتابة المجمعة):**
   تُستخدم لتنفيذ مجموعة من عمليات الكتابة (`set`, `update`, `delete`) دفعة واحدة. هذا أسرع وأكثر كفاءة من تنفيذ كل عملية على حدة.
   **متى تستخدمها؟** عندما تريد تنفيذ عدة تغييرات لا تعتمد على بعضها البعض.
   **مثال:** عندما يحذف المستخدم حسابه، تريد حذف بياناته وحذف تعليقاته أيضاً.

   ```dart
   Future<void> deleteUserAndTheirPosts(String userId, List<String> postIds) async {
     // 1. احصل على instance من WriteBatch
     final batch = firestore.batch();

     // 2. أضف عملية حذف المستخدم إلى الـ batch
     final userDocRef = firestore.collection('users').doc(userId);
     batch.delete(userDocRef);

     // 3. أضف عمليات حذف كل منشوراته إلى الـ batch
     for (final postId in postIds) {
       final postDocRef = firestore.collection('posts').doc(postId);
       batch.delete(postDocRef);
     }

     // 4. قم بتنفيذ كل العمليات دفعة واحدة
     await batch.commit();
     print("User and their posts deleted successfully.");
   }
   ```

==================================================================================================
الخلاصة:
الآن لديك فهم عميق وشامل لـ Cloud Firestore. لقد تعلمت كيف تنشئ وتعدل وتحذف وتقرأ البيانات، وكيف تستعلم عنها بفعالية، وكيف تكتب كوداً احترافياً باستخدام `withConverter`، وكيف تتعامل مع العمليات المعقدة باستخدام `Transactions` و `Batched Writes`.

تدرب على هذه المفاهيم، وابدأ في بناء تطبيقات قوية باستخدام Firestore!
==================================================================================================
*/
