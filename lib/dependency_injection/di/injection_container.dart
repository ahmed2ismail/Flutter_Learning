/*
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
وفي الـ `BlocProvider`، نستخدم `create: (context) => di.sl<WeatherCubit>()..fetchWeather('Cairo');`.

مثال من ال clean_arch_bookly_app:
// lib/core/di/injection_container.dart

final sl = GetIt.instance; // sl = Service Locator

Future<void> init() async {
  // here we will register all our dependencies like cubits, use cases, repositories, data sources, etc.

  // Cubits
  sl.registerFactory(() => FeaturedBooksCubit(sl<FetchFeaturedBooksUseCase>()));
  sl.registerFactory(
    () => NewestBooksCubit(
      fetchBestNewestBooksUseCase: sl<FetchBestNewestBooksUseCase>(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => FetchFeaturedBooksUseCase(sl<HomeRepo>()));
  sl.registerLazySingleton(() => FetchBestNewestBooksUseCase(sl<HomeRepo>()));

  // Repositories
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      homeRemoteDataSource: sl<HomeRemoteDataSource>(),
      homeLocalDataSource: sl<HomeLocalDataSource>(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );

  // Network
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));

  // External Packages
  // Dio
  // هنا انا سجلت ال Dio في ال injection container عشان اقدر استخدمه في اي مكان في التطبيق من غير ما اعمل instance جديد منه كل مرة
  sl.registerLazySingleton<Dio>(() => Dio());
}

ثم في `main.dart`، نستدعي `await di.init();` قبل `runApp()`.
وفي الـ `BlocProvider`، نستخدم `create: (context) => di.sl<FeaturedBooksCubit>()..fetchFeaturedBooks();`. --> كده احنا بنجيب ال FeaturedBooksCubit من ال Service Locator اللي هو sl وبعد ما جبناه بنستدعي علطول ال fetchFeaturedBooks() عشان يجيب البيانات من ال api ويعرضها في ال ui بتاعنا
```
*/