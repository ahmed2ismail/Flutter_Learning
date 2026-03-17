/*
- بينكتب هنا كل حاجة ليها علاقة بال Features بمعني ان فيه حجات بين ال features وبعضها مشتركة فهل منطقي اني اكررها اكتر من مرة في كل feature ?? اكيد لا عشان احنا بنحاول منكررش اصلا not repeat your self in programming
-- Core folder --> بنحط فيه الحجات اللي بتتكرر عندنا في ال Features اللي هي الحجات اللي بنستخدمها في اكتر او كل ال Features
-- ال Core folder --> هو فولدر مشترك في كل ال Features اللي عندي
lib/Core/utils (utilities) بمعني الحجات اللي بتساعدني في كتابة الكود ممكن تكون function او class بتهندل حاجة معينة
- lib/Core/utils/assets.dart --> دا ملف بنحط فيه ال paths بتاعت الصور المستخدمة في التطبيق لاننا بنستخدمها بكثرة
- lib/core/utils/app_router.dart --> دا بيكون فيه ال router اللي بنستخدمه في التطبيق كله عشان لو حبيت تغير اي حاجة في ال navigation بتاع التطبيق هتغيرها في مكان واحد بس (ملف ال app_router) وهيتغير اوتوماتيكيا في كل صفحات التطبيق
- lib/core/utils/styles.dart --> دا بيكون فيه ال styles اللي بنستخدمها في التطبيق كله عشان لو حبيت تغير اي حاجة في ال styles بتاع التطبيق هتغيرها في مكان واحد بس (ملف ال styles) وهيتغير اوتوماتيكيا في كل صفحات التطبيق
- lib/core/utils/api_service.dart --> دا بيكون فيه ال wrapper بتاعي اللي فيه ال api service اللي هو بيكون مسؤول عن تنفيذ ال api calls بتاعتي يعني هو اللي بيبعت ال request لل api وبيستقبل ال response من ال api وبيعمل parsing لل response بتاع ال api عشان يحولها ل data model اقدر استخدمها في ال features بتاعتي
lib/Core/widgets --> دا بيكون فيه الويدجتس المشتركة في التطبيق بالكامل منها ال buttons او ال textFields
--- lib/Feature/home/data --> دا بيكون فيه ال data source اللي هي بتجيب البيانات من ال api او من ال local database
--- lib/Feature/home/data/models --> دا بيكون فيه ال models اللي بتستخدم في ال home feature ودايما دي بتكون نقطة البداية في اي arcthicture لانها بتحدد شكل البيانات اللي هتتعامل معاها في ال features كلها
- لما بنيجي نشتغل بنبني feature feature يعني بعمل اول اسكرين مثلا زي ال splash ويعدين بعمل ال logic بتاعها وبعدين بنقل علي غيرها
- اول خطوة في ال logic هي اني اعمل ال model وبعدين تاني خطوة هي ال service بس قبل ما اعمل ال service هستخدم ال repository pattern عشان اعزل ال data source عن ال features نفسها يعني بدل ما اعمل service بتجيب البيانات من ال api او من ال local database هعمل repository بيكون هو المسؤول عن جلب البيانات من ال data source وبعدين بستخدمه في ال service اللي هو بيكون مسؤول عن ال logic بتاع ال feature نفسها ودا بيسهل عليا اني ا shift لل clean architecture في المستقبل لو حبيت
--- lib/Feature/home/data/repos --> دا بيكون فيه ال repository اللي هو بيكون مسؤول عن جلب البيانات من ال data source وبعدين بستخدمه في ال service اللي هو بيكون مسؤول عن ال logic بتاع ال feature نفسها ودا بيسهل عليا اني ا shift لل clean architecture في المستقبل لو حبيت
--- lib/Feature/home/data/repos/home_repository.dart
--- lib/Feature/home/data/repos/home_repo_impl (implementation).dart --> دا بيكون فيه ال implementation بتاع ال repository اللي هو بيكون مسؤول عن جلب البيانات من ال data source وبعدين بستخدمه في ال service اللي هو بيكون مسؤول عن ال logic بتاع ال feature نفسها ودا بيسهل عليا اني ا shift لل clean architecture في المستقبل لو حبيت
--- lib/Feature/home/data/services --> دا بيكون فيه ال service اللي هو بيكون مسؤول عن ال logic بتاع ال feature نفسها ودا بيسهل عليا اني ا shift لل clean architecture في المستقبل لو حبيت
--- lib/Feature/home/data/services/home_service.dart
1- بعمل ال model اللي هو بيحدد شكل البيانات اللي هتتعامل معاها في ال features كلها
2- بعمل ال repository اللي هو بيكون مسؤول عن جلب البيانات من ال data source
3- بعمل ال service اللي هو بيكون مسؤول عن ال logic بتاع ال feature نفسها ودا بيسهل عليا اني ا shift لل clean architecture في المستقبل لو حبيت
- lib/core/errors --> دا بيكون فيه ال custom errors اللي بنستخدمها في التطبيق كله عشان لو حصل اي error في اي مكان في التطبيق نقدر نستخدم ال custom error اللي عملناه في ال core folder عشان يكون عندنا مصدر واحد للحقيقة (Single Source of Truth) في ال errors بتاعتنا
------------------------ lib/Core/utils/assets.dart : ------------------------
class AssetsData {
  // إحنا عملنا الكلاس ده عشان يكون "Single Source of Truth" (مصدر واحد للحقيقة). لو في يوم حبيت تغير اسم صورة اللوجو أو مكانها، هتغيرها في مكان واحد بس (كلاس AssetsData) وهتتغير أوتوماتيكياً في كل صفحات التطبيق.
  // دا هيبقي دفتر عناوين عشان بدل ما تكتب: 'assets/images/Logo.png' في كل صفحة بتكتب بس: AssetsData.logo مثلا
  // دا هيشيل كل الصور بتاع التطبيق عن طريق انشاء متغير static وبيشيل القيمة بتاعت الصورة
  // كلمة static معناها إن المتغير ده "ملك للكلاس نفسه" مش للمولود (Object) اللي هيطلع منه.
  // why static:
  // 1- لو المتغير مش static عشان تستخدمه لازم تعمل كدة:
  // AssetsData myAssets = AssetsData(); ثم myAssets.logo
  //لكن بـ static إنت بتنادي عليه فوراً: AssetsData.logo
  // 2- توفير الرام (Memory): لأن الصورة دي بتتحجز في الذاكرة "مرة واحدة بس" مهما استخدمتها في 100 صفحة، عكس المتغيرات العادية اللي بتتحجز مع كل نسخة جديدة من الكلاس.

  static const String logo = 'assets/images/Logo.png';
}

------------------------ lib/Core/utils/styles.dart : ------------------------
- دايما في ال styles بتاع ال text بيكون عندنا ترتيب لشغلنا :
1- بحدد ال variation بتاع ال size وعلي اساسها هنشا مجموعة من ال textStyles
2- ال fontFamily : بيكون عندنا واحد اساسي للتطبيق كله ولو فيه اي نص ال fontFamily بتاعه حاجة تانية بعمل style: Styles.اسم الخط الاساسي اللي انا شغال بيه.copyWith(fontFamily: النوع الجديد) وكده احنا عملنا منه نسخة بنوع الخط اللي احنا عايزينه
3- ال color مش فارق معايا عشان اقدر احدده وانا بكتب النص
4- ال FontWeight : من تصميم التطبيق بحدد انهي اكتر واحد مستخدم في التصميم bold ولا semiBold ولا غيره والموضوع بيختلف علي حسب نوع ال text يعني مثلا لو كان ال size = 30 rugular وفي حتة تانية كان حاجة تانية نقدر نغيره عادي واحنا بنكتب النص
--- يعني من الاخر ال font family , color مش مقياس وانما المقياس هو ال fontWeight مع ال size وبنعتمد الحاجة المتكررة اكتر
abstract class Styles {
  static const titleMedium = TextStyle( --> titleMedium دا مش افضل حاجة لانه اسم مش معبر عن حجم الخط مثلا فلما اجي استخدمه مش هفهم دا استايله ايه غير لما ادخل جواه
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  ---> دي التقسيمة الصح واللي نعمل زيها مع شغلنا
  static const textStyle18 = TextStyle( --> دي تسمية افضل لانها واضحة
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textStyle20 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal, // normal == regular
    fontFamily: kGTSectraFine,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

----------------------- lib/Core/utils/app_router.dart : -----------------------
- دي package اسمها go_router وبتستخدم للتنقل بين الصفحات وبشكل سهل
- في ملف ال main.dart لازم نستخدم معاها خاصية ال :
return MaterialApp.router(
-  routerConfig: AppRouter.router,
)
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
ولما نيجي ننتقل لصفحة بنستخدم : GoRouter.of(context).push(AppRouter.kHomeView);
- ممكن نستخدم باكدج تانية اسمه Gitx ولكنها معقدة شوية ودي بدالها بس لو هنستخدمها هتبقي كده : // Get.to(
-   () => const HomeView(),
-   transition: Transition.fade, // انميشن للتنقل
-   duration: kTransitonDuration,
- );
------------------------ lib/Core/widgets/custom_button.dart : ------------------------
- دا ملف بنحط فيه ال custom buttons اللي بنستخدمها في التطبيق كله عشان لو حبيت تغير شكل ال button في يوم من الايام هتغيره في مكان واحد بس (ملف ال custom_button) وهيتغير اوتوماتيكيا في كل صفحات التطبيق
import 'package:bookly_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius,
    this.fontsize,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadiusGeometry? borderRadius;
  final double? fontsize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
------------------------ lib/Features/home/data/repos/home_repository.dart : ------------------------
// هنا هنستخدم ال repository pattern عشان نفصل بين ال data layer و ال presentation layer
// ال repository pattern بيعتمد علي ان انا انشئ abstract class وجوه ال abstract class دا انا بعمل ال methods وخلاص بدون ما اعمل اي implementation لل methods
// في ال repository pattern انا بقول ال method دي هتعمل ايه بس من غير ما اقولها هتعمله ازاي لان انا ممكن يكون عندي اكتر من طريقة لتنفيذ الحاجة دي يعني ممكن يكون عندي api مختلفة او ممكن يكون عندي local database فانا بقول ال method دي هتعمل ايه بس من غير ما اقولها هتعمله ازاي عشان لو انا حبيت اغير ال implementation بتاع ال method دي في المستقبل مش هيأثر علي ال presentation layer خالص
// ال repository pattern بيخليني يبقي عندي نظرة عامة عن ال Future دي بتعمل اي
import 'package:bookly_app/Core/errors/failures.dart';
import 'package:bookly_app/Features/home/data/models/books_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
// هنا احنا بنعرف ال repository اللي بيحتوي علي الدوال اللي بتتعامل مع ال api
// كل method في ال repository دي بتكون مسؤولة عن جلب نوع معين من البيانات من ال api اللي هي الشاشة دي هتتعامل معاها اللي هما featured books و best seller books
// يعني من الاخر انا بعمل abstract class وبعمل جواه ال methods اللي بتتعامل مع ال api اللي هي الشاشة دي هتتعامل معاها اللي هما featured books و best seller books
// ال return type بتاع ال method دي لازم ترجع حاجة في حالة ال success و حاجة في حالة ال failure عشان انا ممكن يكون عندي اكتر من حالة في ال api response بتاعتي يعني ممكن يكون عندي حالة ال success اللي هي بترجعلي البيانات اللي انا عايزها و ممكن يكون عندي حالة ال failure اللي هي بترجعلي error message او exception عشان انا اقدر اعمل handle لل error في ال presentation layer
// عشان كدا انا بستخدم ال Either class من ال dartz package اللي بتخليني ارجع حاجة في حالة ال success و حاجة في حالة ال failure في نفس الوقت يعني انا بقول ال method دي هترجعلي يا اما بيانات من نوع List<BooksModel> في حالة ال success يا اما error message او exception في حالة ال failure
// ال Either (إما , أو) دي بتاخد نوعين من ال types يعني انا بقول ال method دي هترجعلي يا اما String في حالة ال failure يا اما List<BooksModel> في حالة ال success
// Either<L, R> --> L هو نوع ال failure و R هو نوع ال success
// انا عندي انواع كتيرة من ال failure ممكن يكون عندي network failure او server failure او cache failure فانا بقول ال method دي هترجعلي class هنعمله مخصوص لكل حالات ال failure دي عشان اقدر اعمل handle لل error في ال presentation layer بشكل افضل وهنعمل ال class دا في ال core layer عشان اقدر استخدمه في كل ال features بتاعتي
// عشان كدا انا بعمل class اسمه Failure في ال core layer وبعمله subclasses لكل نوع من ال failure اللي ممكن يحصل في ال api response بتاعتي زي network failure او server failure او cache failure وانا بقول ال method دي هترجعلي يا اما class من نوع Failure في حالة ال failure يا اما List<BooksModel> في حالة ال success
// كدا احنا حددنا ال return type بتاع ال method ولو فيه arguments احنا محتاجينها فلازم تبعتها لل method دي عشان تنفذ ال api call بتاعتها زي مثلا لو انا عايز اعمل pagination في ال api call بتاعتي فانا بقول ال method دي لازم تبعتلي page number عشان اقدر اعمل pagination في ال api call بتاعتي
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BooksModel>>> fetchBestSellerBooks();
}
------------------------ lib/Feature/home/data/repos/home_repo_impl (implementation).dart : ------------------------
import 'package:bookly_app/Features/home/data/repos/home_repository.dart';
// implementation of the home repository
// implement عشان انا عايز اعمل implementation لل home repository عشان يعمل كل اللي انا عايزه من ال api call اللي هي الشاشة دي هتتعامل معاها اللي هما featured books و best seller books او اي حاجة انا حددتهاله في ال home repository
class HomeRepoImplementaion implements HomeRepo {
// انا فرضت عليه قاعدة ان هو يعمل implementation لكل ال methods اللي انا حددتهاله في ال home repository عشان كدا انا عملت override لكل ال methods
// بعد كده انا هحدد انا هعمل ال request ب ايه يا اما ب dio package او ب http package وانا بحب ال dio package اكتر عشان هو بيحتوي علي مميزات كتيرة زي ال interceptors و ال global configuration و ال form data و ال file downloading و ال file uploading و ال request cancellation و ال timeout و غيرها كتير من المميزات اللي بتسهل عليا التعامل مع ال api call بتاعتي
// ال dio package بيخليني اعمل request بطرق كتيرة زي ال get و ال post و ال put و ال delete و غيرها كتير من الطرق اللي بتسهل عليا التعامل مع ال api call بتاعتي
// ال dio package كمان افضل في رفع الملفات
// هنا لازم نوحد المصدر بتاع ال get request بتاعنا عشان لو حبيت اي حاجة بعدين اغيرها من مكان واحد وتتغير معايا في كل الاماكن
// فهنعمل wrapper اللي هي نقطة تواصل مبين ال service بتاعتي والنقطة دي هي اللي بتتعامل في كل الاماكن ومع ال سيرفس بتاعتي وانا بتعامل مع النقطة دي
// فهروح اعمل class اسمه ApiService في ال core/utils layer وهعمل فيه ال get request بتاعي و ال post request بتاعي و ال put request بتاعي و ال delete request بتاعي و اي حاجة انا محتاجها في ال api call بتاعتي زي ال headers و ال query parameters و غيرها كتير من الحاجات اللي بتسهل عليا التعامل مع ال api call بتاعتي
  final ApiService
  apiService; // انا هنا بعمل instance من ال ApiService عشان اقدر استخدمه في ال methods اللي هعملها في ال home repository implementation عشان اعمل ال api call بتاعتي لل features دول featured books و best seller books
  HomeRepoImplementaion(this.apiService);

  @override
  Future<Either<Failure, List<BooksModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endpoint:
            'volumes?q=subject:Programming&Filtering=free-ebooks&Sorting=newest',
      );
      // ال data اللي جالي من ال api call بتاعتي بيكون في شكل json format اللي هي ال map الكبيرة خالص وانا طبعا عايز اوصل لل "items" اللي جواها فانا لازم اعمل parsing لل data دي عشان اقدر احولها ل objects من نوع BooksModel
      // انا هنا بعمل parsing لل data اللي جالي من ال api call بتاعتي عشان اقدر احولها من ال json format اللي جالي بيه من ال api call بتاعتي ل objects من نوع BooksModel اللي انا عملته في ال data layer بتاعي عشان اقدر استخدمه في ال presentation layer بتاعي
      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }
      return Right(books);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      throw Exception('Failed to fetch newest books: $e');
    }
  }

  @override
  Future fetchFeaturedBooks() {
    // TOdO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
  
}
------------------------ llib/core/utils/api_service.dart : ------------------------
// هنعمل هنا ال wrapper اللي بيحتفظ بكل المعلومات و بيهندل كل حاجة بتتعلق بال api call بتاعتي زي ال get request و ال post request و ال put request و ال delete request و اي حاجة انا محتاجها في ال api call بتاعتي زي ال headers و ال query parameters و غيرها كتير من الحاجات اللي بتسهل عليا التعامل مع ال api call بتاعتي
import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

// احنا هنا حاطين ال get request بتاعنا بس عشان احنا لسه ما احتجناش غير ال get request في ال api call بتاعتنا لل features دول featured books و best seller books بس في المستقبل ممكن نحتاج اي نوع تاني من ال requests زي ال post request او ال put request او ال delete request فانا هضيفهم هنا لما احتاجهم في المستقبل
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');
    return response.data;
  }
}
------------------------ lib/core/errors/failures.dart : ------------------------
// هنا انا بعمل class اسمه Failure في ال core layer وبعمله subclasses بترثه ومخصصة لكل نوع من ال failure اللي ممكن يحصل في ال api response بتاعتي زي network failure او server failure او cache failure
// ال class دا هستخدمه في ال repository بتاعي عشان احدد ال return type بتاع ال method اللي بتتعامل مع ال api اللي هي الشاشة دي هتتعامل معاها اللي هما featured books و best seller books
// هحدد ال errors اللي هتظهرلي في التطبيق في المستقبل فلما ي المستقبل يحصل error في ال api response هحدد ال errors هنا ك subclasses
abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
}

class CacheFailure extends Failure {
  CacheFailure(super.errorMessage);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.errorMessage);
}

class EmptyServerFailure extends Failure {
  EmptyServerFailure(super.errorMessage);
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.errorMessage);
}

class EmptyNetworkFailure extends Failure {
  EmptyNetworkFailure(super.errorMessage);
}
------------------------ lib/Features/home/data/services/home_service.dart : ------------------------
*/