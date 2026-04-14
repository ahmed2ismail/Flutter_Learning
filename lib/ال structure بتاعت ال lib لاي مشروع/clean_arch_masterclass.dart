/*
================================================================================
====================== Clean Architecture Masterclass ======================
================================================================================

أهلاً بك في الشرح المفصل للـ Clean Architecture. هنا، سنغوص في كل تفاصيل هذا النمط المعماري القوي الذي سيغير طريقة بنائك للتطبيقات.

----------------------------------
-------- 1. ما هي الـ Clean Architecture ولماذا نستخدمها؟ --------
----------------------------------

الـ Clean Architecture هي نمط تصميم برمجي (Software Design Pattern) وضعه "Robert C. Martin" (المعروف بـ Uncle Bob).
الهدف الأساسي منها هو "فصل الاهتمامات" (Separation of Concerns)، مما يجعل الكود:

- **مستقل عن الأطر (Framework Independent):** الكود لا يعتمد على مكتبة معينة (مثل Flutter). منطق العمل الأساسي يجب أن يعمل حتى لو قررنا استبدال Flutter بشيء آخر.
- **قابل للاختبار (Testable):** كل جزء من الكود، خاصة منطق العمل، يمكن اختباره بمعزل عن الأجزاء الأخرى.
- **مستقل عن واجهة المستخدم (UI Independent):** يمكن تغيير واجهة المستخدم بالكامل (من Mobile إلى Web مثلاً) دون الحاجة لتغيير منطق العمل.
- **مستقل عن قاعدة البيانات (Database Independent):** يمكن تغيير طريقة تخزين البيانات (من Firebase إلى SQLite مثلاً) دون التأثير على باقي التطبيق.

تخيل أنك تبني منزلاً:
- الـ **Domain Layer** هي "قواعد المنزل" (مثلاً: لا يمكن بناء غرفة نوم بدون نافذة). هذه القواعد لا تتغير.
- الـ **Data Layer** هي "مواد البناء" (طوب، أسمنت، خشب). يمكنك تغيير نوع الطوب دون تغيير قاعدة "الغرفة تحتاج نافذة".
- الـ **Presentation Layer** هي "الديكور والأثاث". يمكنك تغيير لون الطلاء والأثاث كل يوم، وهذا لن يؤثر على قواعد المنزل أو مواد البناء.

----------------------------------
-------- 2. القاعدة الذهبية: The Dependency Rule --------
----------------------------------

هذه هي أهم قاعدة في الـ Clean Architecture على الإطلاق.

**"الاعتماديات يجب أن تشير إلى الداخل فقط" (Source code dependencies can only point inwards).**

هذا يعني:
- طبقة الـ Presentation (الخارجية) يمكن أن تعتمد على طبقة الـ Domain (الداخلية).
- طبقة الـ Data (الخارجية) يمكن أن تعتمد على طبقة الـ Domain (الداخلية).
- طبقة الـ **Domain** (الداخلية) **لا يجب أن تعرف أي شيء على الإطلاق** عن الطبقات الخارجية (Presentation, Data).

كيف نحقق هذا؟ عن طريق "عكس الاعتمادية" (Dependency Inversion Principle). بدلاً من أن يعتمد الـ Domain على الـ Data، نجعل الـ Data يعتمد على "عقد" (Contract) أو (Interface) يحدده الـ Domain.

================================================================================
====================== الطبقات (The Layers) بالتفصيل ======================
================================================================================

يتكون الهيكل من ثلاث طبقات رئيسية:

----------------------------------
-------- 3. طبقة الـ Domain (The Core / القلب) --------
----------------------------------

هذه هي أعمق وأهم طبقة في التطبيق. تحتوي على منطق العمل (Business Logic) وقواعده. هذه الطبقة لا تحتوي على أي كود خاص بـ Flutter أو أي مكتبة خارجية. هي مجرد كود Dart نقي.

**مكوناتها:**

**أ. Entities (الكيانات):**
- هي الـ Business Objects الأساسية في تطبيقك (مثل `User`, `Product`, `Order`).
- تكون عبارة عن Plain Dart Objects (PODOs) بسيطة.
- قد تحتوي على بعض الـ Business Logic البسيط (مثلاً: دالة داخل `Order` لحساب السعر الإجمالي).
- **مثال:**
  ```dart
  // lib/features/weather/domain/entities/weather_entity.dart
  class WeatherEntity {
    final String cityName;
    final double temperature;
    final String condition;

    WeatherEntity({
      required this.cityName,
      required this.temperature,
      required this.condition,
    });
  }
  ```

**ب. Repositories (المستودعات - كـ Abstract Class):**
- هذا هو "العقد" أو الـ Interface الذي ذكرناه.
- هي فئات مجردة (Abstract Classes) تُعرّف "ماذا" نريد أن نفعل بالبيانات، وليس "كيف".
- مثال: "أريد جلب بيانات الطقس لمدينة معينة"، لكن لا أهتم إذا كانت ستأتي من API أو من قاعدة بيانات محلية.
- **مثال:**
  ```dart
  // lib/features/weather/domain/repositories/weather_repository.dart
  import 'package:dartz/dartz.dart'; // For Either
  import 'package:my_app/core/error/failures.dart';
  import '../entities/weather_entity.dart';

  abstract class WeatherRepository {
    // نستخدم Either للتعامل مع النجاح والفشل بطريقة آمنة
    Future<Either<Failure, WeatherEntity>> getWeatherByCity(String cityName);
  }
  ```

**ج. Use Cases (حالات الاستخدام - أو Interactors):**
- كل Use Case يمثل "إجراء" واحد فقط في التطبيق (Single Responsibility).
- هي "الأفعال" في تطبيقك (مثلاً: `GetWeatherByCityUseCase`, `LoginUserUseCase`).
- هي التي تقوم بتنسيق العمل، حيث تستدعي الـ Methods الموجودة في الـ Repository.
- **مثال:**
  ```dart
  // lib/features/weather/domain/usecases/get_weather_by_city.dart
  import 'package:dartz/dartz.dart';
  import 'package:my_app/core/error/failures.dart';
  import '../entities/weather_entity.dart';
  import '../repositories/weather_repository.dart';

  class GetWeatherByCityUseCase {
    final WeatherRepository repository;

    GetWeatherByCityUseCase(this.repository);

    // نستخدم call() لجعل الكلاس قابلاً للاستدعاء كدالة
    Future<Either<Failure, WeatherEntity>> call(String cityName) async {
      return await repository.getWeatherByCity(cityName);
    }
  }
  ```

import 'package:clean_arch_bookly_app/Core/use_cases/no_parameter_use_case.dart';
abstract class UseCase<T> {
  Future<Either<Failure, T>> call();
}

import 'package:clean_arch_bookly_app/Core/use_cases/use_case.dart';
// generic usecase:
abstract class UseCase<T, Param> {
// هنا بنحدد نوع البيانات اللي هيرجعها ال UseCase، في الحالة دي احنا بنقول انه هيكون Future من Either اللي ممكن يرجع Failure او List<BookEntity>
// ودا اسمه ال Type Definition اللي بنستخدمه عشان نحدد نوع البيانات اللي هيرجعها ال UseCase
  Future<Either<Failure, T>> call(Param param);
}

import 'package:clean_arch_bookly_app/Core/use_cases/no_parameter_use_case.dart';
class FetchFeaturedBooksUseCase implements UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

@override
  Future<Either<Failure, List<BookEntity>>> call() async {
    // هنا احنا بنقول ان ال call دي هتستقبل اي حاجة من ال parameters اللي احنا عايزينها يعني مثلا لو احنا عايزين نجيب الكتب اللي بتبدأ بحرف معين ممكن نعمل parameter اسمه startWith ونستخدمه هنا
    // او ممكن مثلا لو احنا هنت check علي permission قبل ما نجيب الكتب ممكن نعمل parameter اسمه permissionStatus ونستخدمه هنا
    // بس في الحالة دي احنا مش محتاجين اي parameters عشان كدا هنسيبها فاضية
    // وبعدين هنروح لل homeRepo ونقول له يجيبلي الكتب اللي هي featured books وبعدين هنرجع النتيجة اللي جايه من ال homeRepo
    return await homeRepo.getFeaturedBooks();
  }
}
  ```
  او ممكن نستخدم ال generic UseCase اللي عملناه قبل كدا بدل منعمل ملفين اتنين واحد لل no parameter وواحد لل generic UseCase:
  // lib/Core/use_cases/use_case.dart
  class NoParameter {
    // دا كلاس فاضي بنستخدمه لما ال UseCase مش محتاج parameters
  }
  abstract class UseCase<T, Param> {
    Future<Either<Failure, T>> call([Param param]);
  }
  class FetchFeaturedBooksUseCase implements UseCase<List<BookEntity>, NoParameter> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

@override
  Future<Either<Failure, List<BookEntity>>> call([NoParameter? param]) async {
    return await homeRepo.getFeaturedBooks();
  }
}
  ```

**ملخص طبقة الـ Domain:** هي قلب التطبيق، تحتوي على القواعد الأساسية (Entities)، وتُعرّف العقود (Repositories)، وتنفذ الإجراءات (Use Cases). لا تعرف شيئاً عن العالم الخارجي.

----------------------------------
-------- 4. طبقة الـ Data (The How / الكيفية) --------
----------------------------------

هذه الطبقة مسؤولة عن "تنفيذ" العقود التي حددتها طبقة الـ Domain. هي التي تعرف "كيف" تجلب البيانات.

**مكوناتها:**

**أ. Models (النماذج):**
- هي Data Transfer Objects (DTOs). تمثل البيانات كما هي قادمة من مصدرها (مثل JSON من API).
- قد تكون مختلفة عن الـ Entities. مثلاً، الـ API قد يرجع بيانات لا تهمنا في الـ Business Logic، فتكون موجودة في الـ Model ولكن ليس في الـ Entity.
- غالباً ما تحتوي على `fromJson` و `toJson` لتحويل البيانات.
- **مثال:**
  ```dart
  // lib/features/weather/data/models/weather_model.dart
  import '../../domain/entities/weather_entity.dart';

  class WeatherModel extends WeatherEntity {
    WeatherModel({
      required String cityName,
      required double temperature,
      required String condition,
    }) : super(cityName: cityName, temperature: temperature, condition: condition);

    factory WeatherModel.fromJson(Map<String, dynamic> json) {
      return WeatherModel(
        cityName: json['location']['name'],
        temperature: json['current']['temp_c'],
        condition: json['current']['condition']['text'],
      );
    }

    // يمكن إضافة toJson إذا احتجنا إرسال بيانات للـ API
  }
  ```
  **ملاحظة:** جعل الـ Model يرث من الـ Entity هو أسلوب شائع لتجنب كتابة دالة تحويل (mapper function) يدوية.

**ب. Repositories (التنفيذ - Implementation):**
- هي فئات حقيقية (Concrete Classes) تقوم بتنفيذ (implements) الـ Abstract Class الخاصة بالـ Repository من طبقة الـ Domain.
- هي التي تقرر من أين ستأتي البيانات (من مصدر بيانات عن بعد أم محلي) ومن الافضل ان يوجد كلاهما (remote data source, local data source) عشان لما المستخدم يفتح التطبيق يلاقي المحتوي موجود جاهز مش لسه هيحمله لان دا بيستهلك من بيانات النت ليه وكل شوية بيظهرله loading indicator اثناء عملية التحميل ودي تعتبر تجربة سيئة ليه فبنحلها باننا بنعمل local data source مع ال remote data source.
- **مثال:**
  ```dart
  // lib/features/weather/data/repositories/weather_repository_impl.dart
  import 'package:dartz/dartz.dart';
  import 'package:my_app/core/error/failures.dart';
  import '../../domain/entities/weather_entity.dart';
  import '../../domain/repositories/weather_repository.dart';
  import '../datasources/remote_data_source.dart';

  class WeatherRepositoryImpl implements WeatherRepository {
    final WeatherRemoteDataSource remoteDataSource;
    // يمكن إضافة LocalDataSource هنا للتعامل مع التخزين المحلي
    final WeatherLocalDataSource localDataSource;

    WeatherRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

    @override
    Future<Either<Failure, WeatherEntity>> getWeatherByCity(String cityName) async {
      try {
        final weatherModel = await remoteDataSource.getWeatherByCity(cityName);
        return Right(weatherModel); // الـ Model هو أيضاً Entity بسبب الوراثة
      } on Exception { // ServerException, etc.
        return Left(ServerFailure('Something went wrong!'));
      }
    }
  }
  ```

**ج. Data Sources (مصادر البيانات):**
- هي الفئات المسؤولة عن التعامل المباشر مع مصادر البيانات.
- **Remote Data Source:** تتعامل مع الـ API (باستخدام `http` أو `dio`).
- **Local Data Source:** تتعامل مع قواعد البيانات المحلية (مثل `shared_preferences`, `isar`, `sqlite`).
- **مثال (Remote):**
  ```dart
  // lib/features/weather/data/datasources/remote_data_source.dart
  import 'package:dio/dio.dart';
  import '../models/weather_model.dart';

  abstract class WeatherRemoteDataSource {
    Future<WeatherModel> getWeatherByCity(String cityName);
  }

  class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
    final Dio dio;

    WeatherRemoteDataSourceImpl({required this.dio});

    @override
    Future<WeatherModel> getWeatherByCity(String cityName) async {
      final response = await dio.get('https://api.weatherapi.com/v1/current.json?key=YOUR_API_KEY&q=$cityName');

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Server Exception!');
      }
    }
  }
  ```

**ملخص طبقة الـ Data:** هي طبقة التنفيذ، تجلب البيانات من مصادرها (Models)، وتنفذ عقود الـ Domain (Repository Implementation)، وتتعامل مباشرة مع الشبكة أو قاعدة البيانات (Data Sources).

----------------------------------
-------- 5. طبقة الـ Presentation (The UI / الواجهة) --------
----------------------------------

هذه هي الطبقة التي يراها المستخدم ويتفاعل معها. هي أكثر طبقة متغيرة.

**مكوناتها:**

**أ. View (أو Pages/Screens/Widgets):**
- هي واجهات المستخدم التي تعرض البيانات.
- يجب أن تكون "غبية" (Dumb) قدر الإمكان. وظيفتها فقط هي عرض الحالة (State) الحالية وإرسال الأحداث (Events) للمستخدم إلى طبقة إدارة الحالة.

**ب. State Management (إدارة الحالة - BLoC/Cubit/ViewModel):**
- هي العقل المدبر للـ View.
- تستدعي الـ Use Cases من طبقة الـ Domain للحصول على البيانات.
- تدير حالات الواجهة (مثل `Loading`, `Success`, `Error`).
- تستقبل الأحداث من الـ View وتقرر أي Use Case يجب استدعاؤه.
- **مثال (باستخدام Cubit):**
  ```dart
  // lib/features/weather/presentation/cubit/weather_cubit.dart
  import 'package:flutter_bloc/flutter_bloc.dart';
  import '../../domain/usecases/get_weather_by_city.dart';
  import 'weather_state.dart';

  class WeatherCubit extends Cubit<WeatherState> {
    final GetWeatherByCityUseCase getWeatherByCityUseCase;

    WeatherCubit(this.getWeatherByCityUseCase) : super(WeatherInitial());

    Future<void> fetchWeather(String cityName) async {
      emit(WeatherLoading());
      final result = await getWeatherByCityUseCase(cityName);
      result.fold(
        (failure) => emit(WeatherError(message: failure.message)),
        (weatherEntity) => emit(WeatherLoaded(weather: weatherEntity)),
      );
    }
  }
  ```

**مثال للـ View (باستخدام BlocBuilder):**
  ```dart
  // lib/features/weather/presentation/pages/weather_page.dart
  // ... imports

  class WeatherPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Weather App')),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(child: Text('Please enter a city.'));
            } else if (state is WeatherLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoaded) {
              return Center(
                child: Text(
                  '${state.weather.cityName}: ${state.weather.temperature}°C',
                  style: TextStyle(fontSize: 24),
                ),
              );
            } else if (state is WeatherError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      );
    }
  }
  ```

================================================================================
====================== رحلة البيانات (Flow of Control) ======================
================================================================================

لنرسم مسار طلب كامل، مثلاً عندما يضغط المستخدم على زر "جلب الطقس":

1.  **View (WeatherPage):** المستخدم يضغط على زر، فيتم استدعاء `context.read<WeatherCubit>().fetchWeather('Cairo');`.
2.  **Cubit (WeatherCubit):** يستقبل الطلب، يطلق حالة `WeatherLoading`، ثم يستدعي الـ `getWeatherByCityUseCase`.
3.  **UseCase (GetWeatherByCityUseCase):** يستدعي `repository.getWeatherByCity('Cairo')`. (لاحظ أنه يتعامل مع الـ Abstract Repository).
4.  **Repository Impl (WeatherRepositoryImpl):** يستقبل الطلب، ويقرر جلبه من الشبكة، فيستدعي `remoteDataSource.getWeatherByCity('Cairo')`.
5.  **Data Source (WeatherRemoteDataSourceImpl):** يقوم بعملية `dio.get(...)` الفعلية للـ API.
6.  **العودة:**
    -   الـ API يرجع JSON.
    -   الـ Data Source يحول الـ JSON إلى `WeatherModel`.
    -   الـ Repository Impl يستلم الـ `WeatherModel` ويرجعه كـ `Right(weatherModel)`.
    -   الـ UseCase يستلم النتيجة ويمررها كما هي.
    -   الـ Cubit يستلم النتيجة، وباستخدام `fold`، يقرر إطلاق حالة `WeatherLoaded` مع بيانات الطقس.
7.  **View (WeatherPage):** الـ `BlocBuilder` يستشعر الحالة الجديدة `WeatherLoaded` ويعيد بناء الواجهة لعرض درجة الحرارة.

================================================================================
====================== حقن الاعتماديات (Dependency Injection) ======================
================================================================================

لاحظ أن كل طبقة تعتمد على الطبقة التي تليها (مثلاً، الـ Cubit يحتاج UseCase، والـ UseCase يحتاج Repository). كيف نمرر هذه الاعتماديات؟

هنا يأتي دور الـ Dependency Injection (DI). بدلاً من أن يقوم كل كلاس بإنشاء اعتمادياته بنفسه، نقوم "بحقنها" من الخارج.

أشهر مكتبة لهذا الغرض هي `get_it` مع `injectable`.

**الفكرة:**
1.  نسجل كل الكلاسات (Repositories, UseCases, DataSources, Cubits) في مكان مركزي واحد (Service Locator).
2.  عندما نحتاج أي كلاس، نطلبه من الـ Service Locator.

**مثال بسيط باستخدام `get_it`:**
```dart
// lib/core/di/injection_container.dart

final sl = GetIt.instance; // sl = Service Locator

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => WeatherCubit(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetWeatherByCityUseCase(sl()));

  // Repository
  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(remoteDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(() => WeatherRemoteDataSourceImpl(dio: sl()));

  // External (like Dio)
  sl.registerLazySingleton(() => Dio());
}
```
ثم في `main.dart`، نستدعي `await di.init();` قبل `runApp()`.
وفي الـ `BlocProvider`، نستخدم `create: (context) => sl<WeatherCubit>()`.

================================================================================
====================== هيكل المجلدات (Folder Structure) ======================
================================================================================

هيكل المجلدات المقترح الذي يتبع هذا النمط (Feature First Approach):

```
lib/
├── core/
│   ├── di/                     # إعدادات Dependency Injection (get_it)
│   ├── error/                  # تعريفات الـ Failures
│   ├── network/                # إعدادات الـ Dio أو HTTP Client
│   └── usecase/                # كلاس أساسي للـ UseCase إذا لزم الأمر
│
└── features/
    └── weather/                # اسم الميزة (Feature)
        ├── data/
        │   ├── datasources/
        │   │   └── remote_data_source.dart
        │   ├── models/
        │   │   └── weather_model.dart
        │   └── repositories/
        │       └── weather_repository_impl.dart
        │
        ├── domain/
        │   ├── entities/
        │   │   └── weather_entity.dart
        │   ├── repositories/
        │   │   └── weather_repository.dart  (الـ Abstract Class)
        │   └── usecases/
        │       └── get_weather_by_city.dart
        │
        └── presentation/
            ├── cubit/ (أو bloc/)
            │   ├── weather_cubit.dart
            │   └── weather_state.dart
            └── pages/ (أو screens/ أو views/)
                └── weather_page.dart

```
lib/
├── core/
│   ├── errors/          # Failures, Exceptions handling
│   ├── network/         # Application-wide network handling
│   ├── theme/           # Design System (colors, fonts, sizes based on Stitch)
│   ├── usecases/        # Base abstract UseCase implementation
│   ├── utils/           # Extension methods, constants
│   └── widgets/         # Shared Dummy Components (buttons, textfields, shimmers)
├── di/                  # Dependency Injection via get_it
│   └── injection_container.dart
├── features/            # Features (e.g., auth, main, dashboard)
│   ├── [feature_name]/  
│   │   ├── data/
│   │   │   ├── datasources/ # Remote & Local data sources
│   │   │   ├── models/      # Data models (JSON serialization)
│   │   │   └── repositories/# Repository Implementations
│   │   ├── domain/
│   │   │   ├── entities/    # Core business objects
│   │   │   ├── repositories/# Interfaces for repositories
│   │   │   └── usecases/    # Feature-specific use cases
│   │   └── presentation/
│   │       ├── bloc/        # Feature BLoCs/Cubits
│   │       ├── pages/       # Screen UI
│   │       └── widgets/     # Smart/Feature-specific widgets
├── main.dart            # Flutter entry point
├── memora_app.dart      # Main App Widget wrapper
└── app_routes.dart      # Global go_router configuration

```

**الخلاصة:**
الـ Clean Architecture قد تبدو معقدة في البداية بسبب كثرة الملفات، لكنها استثمار طويل الأمد. تجعل مشروعك قابلاً للتوسع، سهل الصيانة، وممتعاً في العمل عليه، خاصة في الفرق الكبيرة والمشاريع طويلة الأمد.

ابدأ بتطبيقها على ميزة واحدة (feature) في مشروعك القادم، ومع الوقت ستصبح طبيعة ثانية لك.

*/