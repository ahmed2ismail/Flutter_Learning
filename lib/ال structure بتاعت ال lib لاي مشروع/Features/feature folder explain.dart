/* 
- انا دلوقت لما باجي ابني اي تطبيق التطبيق دا بيكون مكون من مجموعة من ال feature اللي هي خصائص وكل خاصية بتؤدي غرض عشان التطبيق في الاخر يأدي الوظيفة المطلوبة منه
- فبالتالي لما باجي ابني التطبيق ببني كل feature علي حده عشان مندخلش الدنيا في بعض وبعد كده بيكون سهل نغير فيها او نعدلها او نضيف ليها
- ودا افضل من اني اعمل شوية فولدرات منفصلة جوه ال lib folder وكل فولدر شايل خصائص بتعمل حجات زي مثلا views, services, models,

-- Feature folder --> دا بيحتوي علي تفاصيل وخصائص التطبيق زي ال homeFeature لصفحة ال homePage, notificationFeature, detailedFeatured
- ال feature ممكن تكون screen او اكتر من screen علي حسب التطبيق وبنعرفها مع الخبرة
-- Feature folder --> بيكون فيه مجموعة ال Features اللي بتكون التطبيق وال feature ماهي الا شاشة او مجموعة من الشاشات
-- ال feature ذات نفسها بتتقسم لمجموعة من ال layers:
Domain Layer: دي "قلب" التطبيق، فيها الـ Logic اللي مش بيتغير (زي إن المنتج لازم يكون ليه سعر). هي مستقلة تماماً عن أي حاجة تانية.

Data Layer: دي المسؤولة عن "منين بنجيب البيانات؟" (سواء من الـ API بـ Dio أو من التخزين الداخلي بـ Isar). لو قررنا نغير قاعدة البيانات مستقبلاً، هنغير في الطبقة دي بس، وباقي التطبيق مش هيحس بحاجة.

Presentation Layer: دي اللي فيها الـ UI (الـ Screens) والـ Bloc/Cubit. وظيفتها بس إنها تعرض البيانات وتستقبل أوامر المستخدم.
lib/
 ├── core/              # الحاجات المشتركة (Errors, Utils, Widgets العامة)
 ├── features/          # كل ميزة في فولدر لوحدها (Auth, Home, Cart)
 │    └── auth/         # مثال لميزة تسجيل الدخول
 │         ├── data/    # الموديلات (Models) والـ Data Sources
 │         ├── domain/  # الـ Entities والـ Repositories (التعريفات)
 │         └── presentation/ # الشاشات والـ Cubits
 └── main.dart

-  أول layer هي Presentation layer --> ودي بيندرج تحتيها حاجتين
1- ال ui اللي بيكون الشاشة
2- ال manager اللي بيحتوي علي الحاجة اليي هت manage ال state بتاعت ال ui
-- lib/Feature, lib/Core
-- lib/Feature/splash(اول شاشة)/data
-- lib/Feature/splash(اول شاشة)/Presentation/views/
-- lib/Feature/splash(اول شاشة)/Presentation/manager/
-- lib/Feature/splash(اول شاشة)/Presentation/view_model/splash_view_model.dart
--- lib/Feature/splash(اول شاشة)/Presentation/views/splash_screen.dart
--- lib/Feature/splash(اول شاشة)/Presentation/view_model/splash_view_model.dart
--- lib/Feature/splash(اول شاشة)/Presentation/views/widgets
--- lib/Feature/home/Presentation/views/widgets
--- lib/Feature/home/data --> دا بيكون فيه ال data source اللي هي بتجيب البيانات من ال api او من ال local database
- لما بنيجي نشتغل بنبني feature feature يعني بعمل اول اسكرين مثلا زي ال splash ويعدين بعمل ال logic بتاعها وبعدين بنقل علي غيرها
- احنا بنبني ال feature كاملة وبتكون جزئين 1- ال ui اللي هو الشاشة نفسها 2- ال logic اللي هو ال manager اللي بيكون مسؤول عن ال state بتاعت الشاشة دي
- لما بنبني ال feature بنبنيها كاملة يعني بنبني ال ui وال logic بتاعها مع بعض عشان لما نخلص منها نكون خلصنا ال feature دي كلها وبعدين بننتقل لغيرها
--- lib/Feature/home/data/models --> دا بيكون فيه ال data models اللي هي بتستخدم في ال home feature
--- lib/Feature/home/data/repository --> دا بيكون فيه ال repository اللي هو بيكون مسؤول عن جلب البيانات من ال data source وبيكون فيه ال logic بتاع جلب البيانات دي
--- lib/Feature/home/data/repository/home_repository.dart
--- lib/Feature/home/data/repository/home_repository_impl.dart
--- lib/Feature/home/data/services --> دا بيكون فيه ال services اللي هي بتتعامل مع ال api او مع ال local database عشان تجلب البيانات دي
--- lib/Feature/home/data/services/home_api_service.dart
-- lib/Feature/home/Domain --> دي "قلب" التطبيق، فيها الـ Logic اللي مش بيتغير (زي إن المنتج لازم يكون ليه سعر). هي مستقلة تماماً عن أي حاجة تانية.
*/