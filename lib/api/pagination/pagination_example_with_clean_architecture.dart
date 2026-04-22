/*

================================================================================
========== 5. تطبيق عملي احترافي (Pagination مع Clean Architecture) ==========
================================================================================

سنقوم بتطبيق الـ Pagination باستخدام نمط Clean Architecture، مع محاكاة هيكل مشروع
`clean_arch_bookly_app` الذي تم شرحه سابقاً. هذا يوضح كيفية فصل الاهتمامات
بشكل كامل لخاصية الترقيم اللانهائي.

// لنفترض أن هذه الملفات موجودة في مشروعك الفعلي ضمن هيكل Clean Architecture.
// هنا سنقوم بتضمينها في ملف واحد للتوضيح.

// ============================================================================
// 5.1. الطبقة الأساسية (Core Layer) - (محاكاة لـ lib/core/...)
// ============================================================================

// lib/core/errors/failures.dart (مثال مبسط)
// (في مشروعك الفعلي، ستكون هذه الملفات منفصلة كما في clean_arch_masterclass.dart)
import 'package:dartz/dartz.dart'; // يجب إضافة dartz في pubspec.yaml

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

// lib/core/usecases/use_case.dart (مثال مبسط)
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// lib/core/utils/api_service.dart (مثال مبسط)
// (في مشروعك الفعلي، ستكون هذه الفئة أكثر تعقيداً وتستخدم Dio مثلاً)
class ApiService {
  Future<Map<String, dynamic>> get({required String endpoint, Map<String, dynamic>? queryParameters}) async {
    // محاكاة استدعاء API
    await Future.delayed(const Duration(seconds: 1));
    // هنا يمكن محاكاة استجابة API مع بيانات الترقيم
    // مثال: https://api.example.com/books?page=1&limit=10
    int page = queryParameters?['page'] ?? 1;
    int limit = queryParameters?['limit'] ?? 10;

    if (page > 5) { // لنفترض أن لدينا 5 صفحات فقط
      return {'items': []};
    }

    List<Map<String, dynamic>> items = List.generate(limit, (index) {
      final id = (page - 1) * limit + index + 100; // IDs to differentiate from previous example
      return {'id': id, 'title': 'Clean Arch Book #$id (Page $page)'};
    });

    return {'items': items, 'totalItems': 50}; // مثال على بيانات إضافية
  }
}

// ============================================================================
// 5.2. طبقة الـ Domain (lib/features/paginated_books/domain/...)
// ============================================================================

// lib/features/paginated_books/domain/entities/book_entity.dart
// (سنعيد استخدام Book class من المثال السابق كـ Entity)
// class Book { ... } // موجودة بالفعل في بداية الملف

// lib/features/paginated_books/domain/repositories/paginated_books_repo.dart
abstract class PaginatedBooksRepo {
  Future<Either<Failure, List<Book>>> fetchPaginatedBooks(int page, int limit);
}

// lib/features/paginated_books/domain/usecases/fetch_paginated_books_use_case.dart
class FetchPaginatedBooksUseCase implements UseCase<List<Book>, FetchPaginatedBooksParams> {
  final PaginatedBooksRepo repository;

  FetchPaginatedBooksUseCase(this.repository);

  @override
  Future<Either<Failure, List<Book>>> call(FetchPaginatedBooksParams params) async {
    return await repository.fetchPaginatedBooks(params.page, params.limit);
  }
}

class FetchPaginatedBooksParams {
  final int page;
  final int limit;

  FetchPaginatedBooksParams({required this.page, required this.limit});
}

// ============================================================================
// 5.3. طبقة الـ Data (lib/features/paginated_books/data/...)
// ============================================================================

// lib/features/paginated_books/data/models/book_model.dart
// (سنعيد استخدام Book class من المثال السابق كـ Model، مع إضافة factory method للتحويل)
// class Book { ... } // موجودة بالفعل في بداية الملف

// lib/features/paginated_books/data/datasources/paginated_books_remote_data_source.dart
abstract class PaginatedBooksRemoteDataSource {
  Future<List<Book>> fetchPaginatedBooks(int page, int limit);
}

class PaginatedBooksRemoteDataSourceImpl implements PaginatedBooksRemoteDataSource {
  final ApiService apiService;

  PaginatedBooksRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Book>> fetchPaginatedBooks(int page, int limit) async {
    try {
      final response = await apiService.get(
        endpoint: 'books', // مثال على endpoint
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response['items'] != null) {
        return (response['items'] as List)
            .map((item) => Book.fromJson(item))
            .toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch books from API: $e');
    }
  }
}

// lib/features/paginated_books/data/repositories/paginated_books_repo_impl.dart
class PaginatedBooksRepoImpl implements PaginatedBooksRepo {
  final PaginatedBooksRemoteDataSource remoteDataSource;

  PaginatedBooksRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Book>>> fetchPaginatedBooks(int page, int limit) async {
    try {
      final books = await remoteDataSource.fetchPaginatedBooks(page, limit);
      return Right(books);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

// ============================================================================
// 5.4. طبقة الـ Presentation (lib/features/paginated_books/presentation/...)
// ============================================================================

// lib/features/paginated_books/presentation/manager/paginated_books_cubit/paginated_books_state.dart
// (حالة محسّنة كما في التعديل السابق)
import 'package:equatable/equatable.dart'; // يجب إضافة equatable في pubspec.yaml

abstract class PaginatedBooksState extends Equatable {
  const PaginatedBooksState();

  @override
  List<Object?> get props => [];
}

class PaginatedBooksInitial extends PaginatedBooksState {}

class PaginatedBooksLoading extends PaginatedBooksState {}

class PaginatedBooksSuccess extends PaginatedBooksState {
  final List<Book> books;
  final int currentPage;
  final bool hasReachedMax;
  final bool isLoadingMore; // لإظهار مؤشر تحميل في الأسفل

  const PaginatedBooksSuccess({
    required this.books,
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
  });

  PaginatedBooksSuccess copyWith({
    List<Book>? books,
    int? currentPage,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return PaginatedBooksSuccess(
      books: books ?? this.books,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [books, currentPage, hasReachedMax, isLoadingMore];
}

class PaginatedBooksError extends PaginatedBooksState {
  final String message;

  const PaginatedBooksError(this.message);

  @override
  List<Object?> get props => [message];
}

// lib/features/paginated_books/presentation/manager/paginated_books_cubit/paginated_books_cubit.dart
class PaginatedBooksCubit extends Cubit<PaginatedBooksState> {
  final FetchPaginatedBooksUseCase fetchPaginatedBooksUseCase;
  final int _limit = 10; // عدد العناصر في كل صفحة

  PaginatedBooksCubit(this.fetchPaginatedBooksUseCase) : super(PaginatedBooksInitial());

  Future<void> fetchInitialBooks() async {
    if (state is PaginatedBooksLoading) return; // منع طلبات متكررة

    emit(PaginatedBooksLoading());
    final result = await fetchPaginatedBooksUseCase(
      FetchPaginatedBooksParams(page: 1, limit: _limit),
    );

    result.fold(
      (failure) => emit(PaginatedBooksError(failure.message)),
      (books) => emit(PaginatedBooksSuccess(
        books: books,
        currentPage: 1,
        hasReachedMax: books.length < _limit, // إذا كانت أقل من الحد، فقد وصلنا للنهاية
      )),
    );
  }

  Future<void> loadMoreBooks() async {
    final currentState = state;
    if (currentState is PaginatedBooksSuccess &&
        !currentState.isLoadingMore &&
        !currentState.hasReachedMax) {
      emit(currentState.copyWith(isLoadingMore: true)); // إظهار مؤشر التحميل في الأسفل

      final nextPage = currentState.currentPage + 1;
      final result = await fetchPaginatedBooksUseCase(
        FetchPaginatedBooksParams(page: nextPage, limit: _limit),
      );

      result.fold(
        (failure) => emit(currentState.copyWith(isLoadingMore: false)), // إخفاء المؤشر عند الخطأ
        (newBooks) {
          emit(currentState.copyWith(
            books: List.of(currentState.books)..addAll(newBooks), // دمج القوائم
            currentPage: nextPage,
            hasReachedMax: newBooks.length < _limit, // هل هذه هي آخر دفعة؟
            isLoadingMore: false,
          ));
        },
      );
    }
  }
}

// lib/features/paginated_books/presentation/views/paginated_books_view.dart
class PaginatedBooksView extends StatefulWidget {
  const PaginatedBooksView({super.key});

  @override
  State<PaginatedBooksView> createState() => _PaginatedBooksViewState();
}

class _PaginatedBooksViewState extends State<PaginatedBooksView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // استدعاء جلب البيانات الأولية عند تهيئة الصفحة
    context.read<PaginatedBooksCubit>().fetchInitialBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clean Arch Paginated Books')),
      body: BlocBuilder<PaginatedBooksCubit, PaginatedBooksState>(
        builder: (context, state) {
          if (state is PaginatedBooksLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PaginatedBooksSuccess) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.books.length + (state.hasReachedMax ? 0 : 1), // +1 للعنصر الأخير (مؤشر التحميل)
              itemBuilder: (context, index) {
                if (index >= state.books.length) {
                  // هذا هو العنصر الأخير، اعرض مؤشر التحميل إذا لم نصل للنهاية
                  return state.isLoadingMore
                      ? const Center(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ))
                      : const SizedBox.shrink(); // لا شيء إذا وصلنا للنهاية
                }
                final book = state.books[index];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text('ID: ${book.id}'),
                );
              },
            );
          } else if (state is PaginatedBooksError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PaginatedBooksCubit>().loadMoreBooks();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    // طلب المزيد من البيانات عندما يكون المستخدم على بعد 200 بكسل من نهاية القائمة
    return currentScroll >= (maxScroll * 0.8); // 80% من نهاية القائمة
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}

// ============================================================================
// 5.5. حقن الاعتماديات (Dependency Injection) - (محاكاة لـ lib/core/di/injection_container.dart)
// ============================================================================

// (في مشروعك الفعلي، ستستخدم get_it لتسجيل هذه الاعتماديات في مكان مركزي)
// هنا سنقوم بإنشاء دالة بسيطة لمحاكاة الـ Service Locator
// يجب إضافة get_it في pubspec.yaml
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setupPaginatedBooksDependencies() {
  // Cubit
  sl.registerFactory(() => PaginatedBooksCubit(sl()));

  // Use Cases
  sl.registerLazySingleton(() => FetchPaginatedBooksUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<PaginatedBooksRepo>(
    () => PaginatedBooksRepoImpl(sl()),
  );

  // Data Sources
  sl.registerLazySingleton<PaginatedBooksRemoteDataSource>(
    () => PaginatedBooksRemoteDataSourceImpl(sl()),
  );

  // External (ApiService) - إذا لم تكن مسجلة بالفعل
  if (!sl.isRegistered<ApiService>()) {
    sl.registerLazySingleton(() => ApiService());
  }
}

// ============================================================================
// 5.6. كيفية استخدام هذا المثال في ملف main.dart (للتجربة)
// ============================================================================

// في ملف main.dart الخاص بك:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
// تأكد من استيراد الملف الذي يحتوي على هذا الشرح
// import 'package:your_project_path/api/pagination_masterclass_in_api.dart'; // عدّل المسار

void main() {
  // قم بتهيئة الاعتماديات
  setupPaginatedBooksDependencies(); // استدعاء دالة تهيئة الاعتماديات

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagination Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => sl<PaginatedBooksCubit>(), // جلب الـ Cubit من الـ Service Locator
        child: const PaginatedBooksView(), // عرض واجهة الكتب المرقّمة
      ),
    );
  }
}
================================================================================
*/
