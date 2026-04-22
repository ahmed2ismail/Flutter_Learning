/*
================================================================================
==================== Masterclass: Pagination (الترقيم/التجزئة) ====================
================================================================================

أهلاً بك في شرح الـ Pagination. هذا المفهوم هو أحد أهم المهارات التي يجب أن يتقنها مطور التطبيقات
للتعامل مع كميات البيانات الضخمة بكفاءة واحترافية.

----------------------------------
-------- 1. ما هو الـ Pagination؟ --------
----------------------------------

الـ Pagination هو أسلوب لجلب البيانات من السيرفر على "دفعات" أو "صفحات" بدلاً من جلبها دفعة واحدة.
تخيل أن لديك تطبيقاً مثل Facebook يحتوي على ملايين المنشورات، هل يعقل أن يقوم التطبيق بتحميل كل 
المنشورات بمجرد فتحه؟ بالطبع لا، سيؤدي ذلك إلى:
1. استهلاك هائل للرام (RAM).
2. بطء شديد في واجهة المستخدم (UI Lag).
3. استهلاك ضخم لباقة الإنترنت للمستخدم.
4. ضغط هائل على السيرفر.

الحل هو الـ Pagination: نطلب أول 10 منشورات فقط، وعندما يصل المستخدم لنهاية القائمة، نطلب الـ 10 التالية.

----------------------------------
-------- 2. كيف يعمل الـ Pagination في الـ API؟ --------
----------------------------------

السيرفر عادةً ما يدعم الـ Pagination من خلال نوعين مشهورين من الـ Parameters:

أ. الـ Offset-based Pagination (الأكثر شيوعاً):
يعتمد على متغيرين في الرابط (Query Parameters):
- **`page` أو `offset`**: رقم الصفحة الحالية أو عدد العناصر التي يجب تخطيها.
- **`limit` أو `per_page`**: عدد العناصر في كل صفحة.
مثال: `https://api.example.com/posts?page=1&limit=10`

ب. الـ Cursor-based Pagination:
يعتمد على "مؤشر" (Cursor) لآخر عنصر تم جلبه. هذا المؤشر يكون عادةً ID فريد أو timestamp.
مثال: `https://api.example.com/posts?limit=10&after_cursor=xyz123`
**ميزته**: أكثر كفاءة في التعامل مع البيانات التي تتغير باستمرار (مثل timeline فيسبوك)، لأنه لا يتأثر بإضافة أو حذف عناصر جديدة في الصفحات السابقة.

----------------------------------
-------- 3. متى نستخدم الـ Pagination؟ --------
----------------------------------
- عندما تتوقع أن قائمة البيانات ستتجاوز 20-50 عنصراً.
- في تطبيقات التواصل الاجتماعي (المنشورات، التعليقات).
- في تطبيقات المتجر الإلكتروني (قائمة المنتجات).
- في أي تطبيق يعرض نتائج بحث قد تكون كبيرة جداً.

================================================================================
========== 4. تطبيق عملي (Pagination مع Bloc/Cubit) ==========
================================================================================

سنقوم ببناء مثال لجلب قائمة "كتب" (Books) مع دعم التمرير اللانهائي (Infinite Scroll).

----------------------------------
-------- الخطوة 1: الموديل (Model) --------
----------------------------------
// هذا موديل بسيط يمثل البيانات القادمة من الـ API

```dart
class Book {
  final int id;
  final String title;

  Book({required this.id, required this.title});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(id: json['id'], title: json['title']);
  }
}
```

----------------------------------
-------- الخطوة 2: الـ Cubit والحالات (States) --------
----------------------------------

نحتاج لحالات تمثل: التحميل لأول مرة، النجاح، الخطأ، وتحميل "المزيد" من البيانات.
```dart
abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksSuccess extends BooksState {
  final List<Book> books;

  BooksSuccess(this.books);
}

class BooksError extends BooksState {
  final String errorMessage;

  BooksError(this.errorMessage);
}

class BooksLoadMore extends BooksState {
  final List<Book> books;

  BooksLoadMore(this.books);
}
```
----------------------------------
-------- الخطوة 3: الـ Cubit --------
----------------------------------

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  void fetchBooks() async {
    try {
      emit(BooksLoading());
      // استدعاء الـ API لجلب أول صفحة
      final books = await fetchBooksFromApi(page: 1, limit: 10);
      emit(BooksSuccess(books));
    } catch (e) {
      emit(BooksError('Failed to fetch books'));
    }
  }
  void loadMoreBooks(int currentPage) async {
    try {
      // استدعاء الـ API لجلب الصفحة التالية
      final moreBooks = await fetchBooksFromApi(page: currentPage + 1, limit: 10);
      if (state is BooksSuccess) {
        final currentBooks = (state as BooksSuccess).books;
        emit(BooksLoadMore([...currentBooks, ...moreBooks]));
      }
    } catch (e) {
      emit(BooksError('Failed to load more books'));
    }
  }
}
```
----------------------------------
-------- الخطوة 4: واجهة المستخدم (UI) --------
----------------------------------

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'books_cubit.dart';
import 'books_state.dart';

class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Books')),
      body: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          if (state is BooksLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BooksSuccess || state is BooksLoadMore) {
            final books = state is BooksSuccess ? state.books : (state as BooksLoadMore).books;
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                if (index == books.length - 1) {
                  // عندما يصل المستخدم لنهاية القائمة، نطلب المزيد
                  context.read<BooksCubit>().loadMoreBooks(currentPage);
                }
                return ListTile(title: Text(books[index].title));
              },
            );
          } else if (state is BooksError) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  } 
}
```
في هذا المثال، قمنا بإنشاء Cubit يدير حالة جلب الكتب من الـ API مع دعم التمرير اللانهائي. عندما يصل المستخدم لنهاية القائمة، يتم استدعاء `loadMoreBooks` لجلب الصفحة التالية من البيانات.
================================================================================
*/