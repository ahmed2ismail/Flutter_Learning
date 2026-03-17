/*
why bloc ?
1. Separation of concerns: Bloc helps to separate business logic from UI code, making the codebase cleaner and easier to maintain.
2. Testability: Since the business logic is separated, it becomes easier to write unit tests for the logic without involving the UI.
3. Reusability: Blocs can be reused across different parts of the application or even in different projects.
4. Predictable State Management: Bloc uses events and states, making it easier to predict how the application will behave in response to user actions or other events.
5. Scalability: Bloc is well-suited for large applications with complex state management needs, as it provides a structured way to handle state changes.
### English Introduction
**What is BLoC?**
BLoC (Business Logic Component) is a design pattern for managing state in Flutter applications. It helps separate business logic from the UI layer, making the code more modular, testable, and maintainable. BLoC uses streams to handle events and states, allowing for a reactive programming approach.
**Key Concepts:**
*   **Events:** Actions or inputs that trigger state changes in the BLoC. Events are typically user interactions or external data updates.
*   **States:** The various conditions or outputs of the BLoC in response to events. States represent the current state of the UI.
*   **Streams:** BLoC uses streams to manage the flow of events and states.
*   **BLoC Class:** The core component that contains the business logic, processes events, and emits states.
The combination of Flutter and BLoC is powerful, as it allows for the development of scalable, maintainable, and testable applications with a clear separation of concerns.
---### مقدمة باللغة العربية
لماذا BLoC؟
1. فصل المسؤوليات: يساعد BLoC في فصل منطق الأعمال عن كود واجهة المستخدم، مما يجعل قاعدة الكود أنظف وأسهل في الصيانة.
2. قابلية الاختبار: نظرًا لفصل منطق الأعمال، يصبح من الأسهل كتابة اختبارات وحدة للمنطق دون الحاجة إلى إشراك واجهة المستخدم.
3. إعادة الاستخدام: يمكن إعادة استخدام BLoCs عبر أجزاء مختلفة من التطبيق أو حتى في مشاريع مختلفة.
4. إدارة حالة متوقعة: يستخدم BLoC الأحداث والحالات، مما يسهل في التنبؤ بكيفية تصرف التطبيق استجابةً لإجراءات المستخدم أو الأحداث الأخرى.
5. القابلية للتوسع: BLoC مناسب جيدًا للتطبيقات الكبيرة التي تتطلب إدارة حالة معقدة، حيث يوفر طريقة منظمة للتعامل مع تغييرات الحالة.
**ما هو BLoC؟**
BLoC (مكون منطق الأعمال) هو نمط تصميم لإدارة الحالة في تطبيقات Flutter. يساعد في فصل منطق الأعمال عن طبقة واجهة المستخدم، مما يجعل الكود أكثر تنظيمًا وقابلية للاختبار والصيانة. يستخدم BLoC التدفقات (streams) للتعامل مع الأحداث والحالات، مما يسمح بنهج برمجة تفاعلية.
**المفاهيم الرئيسية:**
*   **الأحداث (Events):** الإجراءات أو المدخلات التي تؤدي إلى تغييرات في الحال داخل BLoC. عادةً ما تكون الأحداث تفاعلات المستخدم أو تحديثات البيانات الخارجية.
*   **الحالات (States):** الظروف أو المخرجات المختلفة لـ BLoC استجابةً للأحداث. تمثل الحالات الحالة الحالية لواجهة المستخدم.
*   **التدفقات (Streams):** يستخدم BLoC التدفقات لإدارة تدفق الأحداث والحال 
*   **فئة BLoC (BLoC Class):** المكون الأساسي الذي يحتوي على منطق الأعمال، ويعالج الأحداث، ويصدر الحالات.
يعتبر الجمع بين Flutter و BLoC قويًا، حيث يتيح تطوير تطبيقات قابلة للتوسع والصيانة والاختبار مع فصل واضح للمسؤوليات.
--- أهم ميزتين في ال BloC هما انه بيفصل بين ال UI و ال Logic و بعرف عن طريقة ايه هي ال State بتاعت التطبيق بتاعي
-- package flutter_bloc بيوفرلي اتنين حاجات اساسية هما [Bloc , Cubit]:
--- events ---> bloc ---> states : ال flow بتاع ال bloc :
هنا ال bloc بيشتغل علي اساس ال events اللي بتيجي من ال UI و بيعمل processing عليها و بعد كده بيطلع ال states اللي هيتعرضوا علي ال UI
--- Function ---> cubit ---> states : ال flow بتاع ال cubit :
هنا ال cubit بيشتغل علي اساس ال functions شغالة هو بيختار ال state اللي هيتعرض علي ال UI
ال bloc و ال cubit هما اتنين طرق مختلفين لتحقيق نفس الهدف اللي هو ادارة الحالة (state management) في تطبيقات Flutter والاتنين ليهم نفس المميزات اللي اتكلمنا عنها قبل كده مع فروقات بسيطة بينهم :
1. التعقيد : ال : bloc بيكون اكتر تعقيد شوية من ال cubit بسبب انه بيعتمد علي ال events و ال states و ال streams اما ال cubit بيكون ابسط لان هو بيعتمد علي ال functions و ال states بس
2. الاستخدام : ال bloc بيكون مناسب اكتر للمشاريع الكبيرة و المعقدةة اللي بتحتاج ادارة حالة معقدة و تفاعلات كتير اما ال cubit بيكون مناسب اكتر للمشاريع الصغيرة و المتوسطة اللي بتحتاج ادارة حالة بسيطة
لما نيجي نستخدم ال bloc او ال cubit فاحنا بنحدد ال states بتاعت ال screen اللي هنشتغل عليها اللي في التطبيق وليس states التطبيق كله
--- خطوات اساسية لاستخدام ال bloc / cubit في التطبيق :
1- تعريف ال states اللي هتتعرض علي ال UI
2- تعريف ال events (لو هستخدم bloc) او ال functions (لو هستخدم cubit) اللي هتتعامل مع ال states
3- انشاء ال bloc / cubit class اللي هيحتوي علي ال logic اللي هيتعامل مع ال events / functions و هيغير ال states
4- استخدام BlocProvider عشان اوفر ال bloc / cubit لل widgets اللي محتاجاها
5- استخدام BlocBuilder عشان ابني ال UI بناء علي ال states
---------------------------- مثال علي الخطوات -----------------------
1- تعريف ال states في ملف منفصل مثلا counter_state.dart :
abstract class CounterState {}
sealed class CounterState {} ==> دا أفضل
// sealed class دي معناها ان ال LoginState دي مش هتتعمل منها instance غير ال subclasses اللي جواها يعني مفيش حد يقدر يعمل instance من ال LoginState نفسها لانها abstract class بس في نفس الوقت مش abstract class عشان نقدر نعمل instance من ال subclasses اللي جواها زي ال LoginInitial
// الفرق بين ال sealed class و ال abstract class ان ال sealed class بتمنع اي حد يعمل instance منها غير ال subclasses اللي جواها اما ال abstract class ممكن اي حد يعمل instance منها بس مش هتكون مفيدة لانه مش هتحتوي علي اي implementation

class CounterCubitInitial extends CounterState {}

class CounterAIncrementState extends CounterState {}

class CounterBIncrementState extends CounterState {}
طريقة ثانية افضل :
// التحسين: بدلاً من استخدام abstract class وحالات متعددة فارغة (Initial, IncrementA, IncrementB)
// الأفضل جعل الـ State تحمل البيانات نفسها.
// هذا يسمى "Single Source of Truth" أي أن الحالة هي المصدر الوحيد للبيانات.

class CounterState {
  final int teamAScore;
  final int teamBScore;

  // نستخدم required لضمان وجود قيم ابتدائية دائماً
  // المتغيرات final لضمان عدم تغييرها يدوياً من خارج الكلاس (Immutability)
  CounterState({required this.teamAScore, required this.teamBScore});
}


2- تعريف ال functions (لو هستخدم cubit) اللي هتتعامل مع ال states في نفس الملف او في ملف منفصل مثلا counter_cubit.dart :
import 'package:basketball_points_counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// --- Function --> cubit --> states --- // this is the flow of using cubit pattern
// هنحط الحالة الاب اللي هي CounterState في الكيوبت بتاعنا عشان نقدر نستخدمه كل الحالات الابناء اللي بيرثوها
// وبعد كده هيبقي فاضل ال Function اللي ال كيوبت هيستخدمها عشان يغير الحالة بتاعته
Bloc pattern ==> بيستخدم خطوات ثابته :
1- create state : نحدد ال states اللي هنتعامل معاها وكل state بنمثلها باستخدام ال oop علي هيئة class
2- create cubit :
2- create function :
3- provide cubit :
4- integrate cubit :
5- trigger cubit :

class CounterCubit extends Cubit<CounterState> { ==> انشاء الكيوبت
  CounterCubit() : super(CounterCubitInitial());

  --- هنا ال logic بتاع الكيوبت اللي هيغير ال states بناء علي ال functions ---
  int counterA = 0;
  int counterB = 0;

  void incrementCounterA() {
    counterA++;
    بعد مكتبت ال logic اللي هيحصل بقوله طلع ال state الجديدة دي عن طريق ال emit بمعني طلع او اظهرلي ال state دي
    emit(CounterAIncrementState());
  }

  void incrementCounterB() {
    counterB++;
    emit(CounterBIncrementState());
  }
  أو
  void incrementCounter({required String teamName, required int points}) {
    if (teamName == "Team A") {
      counterA += points;
      // بعد مكتبت ال logic اللي هيحصل بقوله طلع ال state الجديدة دي عن طريق ال emit بمعني طلع او اظهرلي ال state دي
      emit(CounterAIncrementState());
    } else if (teamName == "Team B") {
      counterB += points;
      // بعد مكتبت ال logic اللي هيحصل بقوله طلع ال state الجديدة دي عن طريق ال emit بمعني طلع او اظهرلي ال state دي
      emit(CounterBIncrementState());
    }
  }
  --- end of logic ---
  وكده نقدر نستخدم ال cubit بتاعنا في اي مكان في التطبيق عشان نغير الحالة بتاعتنا في ال UI
}
مثال اخر :

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  final String? errormessage;
  WeatherFailureState({this.errormessage});
}

class GetWeatherCubit extends Cubit<WeatherState> {
  WeatherModel? weatherModel;
  // initialState ==> هي القيمة اللي هيبقي عليها ال Cubit في البداية
  // initialState ==> NoWeatherState عشان مفيش بيانات طقس في البداية هتبقي
  GetWeatherCubit() : super(WeatherInitialState());
  // the third step is to create functions that will be called to change the states based on events
  getWeather({required String cityName}) async {
    // logic to fetch weather data and emit appropriate states
    try {
      weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(cityName: cityName);
      // emit بعد ما جبت بيانات الطقس هبعت الحالة اللي بتقول ان البيانات اتحملت بنجاح عن طريق
      // emit => بتبعت الحالة الجديدة لل Cubit عشان اي حد بيستمع ليها ياخدها
      // emit (ارسال او بيبعت) is meaning "send out" or "broadcast" in the context of state management. بمعني يبعت الحالة الجديدة لل Cubit
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(errormessage: e.toString()));
    }
    // كده الكيوبت هيعبت لل للواجهة الحالة اللي بتقول ان البيانات اتحملت بنجاح
  }
}


3- استخدام BlocProvider عشان اوفر ال cubit لل widgets اللي محتاجاها في ملف main.dart او في اي ملف تاني :
---  بنوفر ال cubit في اعلي ال widget tree عشان اي widget تحت منه تقدر توصل ليه وبنوفره عن طريق ال BlocProvider لكل الويدجتس اللي محتاجاه واللي ليها access لل cubit
--- لو انا عندي اكتر من cubit في التطبيق بتاعي فهنا بستخدم MultiBlocProvider عشان اوفر اكتر من cubit في نفس الوقت
--- BlocProvider.of<الكيوبت اللي انا عايز اوصله>(context).ال function اللي انا عايز اشغلها اللي مكتوبة في الكيوبت
MultiBlocProvider(
      providers: [
        BlocProvider(
        // fetchAllProducts ==> دي function مكتوبة في ال cubit بتاعي اللي فيها كل ال logic اللي هتتعامل مع ال states و هتغيرها
          create: (context) => ProductsCubit()..fetchAllProducts(), // علامة ..fetchAllProducts معناها شغله أول ما يتكريت
        ),
      ],
      child: ...
    );
4- استخدام BlocBuilder, BlocConsumer عشان ابني ال UI بناء علي ال states في ال cubit
---  الفرق بين BlocBuilder و BlocConsumer ان ال BlocBuilder بيبني ال UI بناء علي ال states بس اما ال BlocConsumer بيبني ال UI و كمان بيقدر يتعامل مع ال side effects زي ال navigation او ال showing dialogs
---  بنستخدم ال BlocBuilder لو احنا هنغير ال UI بس بناء علي ال states و بنستخدم ال BlocConsumer لو احنا عايزين نغير ال UI و كمان نعمل حاجات تانية بناء علي ال states عن طريق ال listener زي ال navigation او ال showing dialogs او نغير logic معين منغير منغير ال UI
--- يعني من الاخر بنستخدم ال BlocConsumer لما يكون عندي side effects عايز اعملها من غير تغيير ال UI يعني انا مش محتاج اعمل return ل widget جديدة اللي هي ui جديد في ال builder بتاعي
--- اما لو انا عايز اعمل return ل widget جديدة بناء علي ال states بس من غير side effects فهنا بستخدم ال BlocBuilder
--- بستخدم ال Bloclistener عشان ابني ال side effects اللي انا عايز اعملها بناء علي ال states اللي بتتغير في ال cubit بتاعي زي ال navigation او ال showing dialogs او نغير logic معين منغير منغير ال UI
--- ال BlocListener من الاخر بينفذ مجموعة من الاكواد علي اساس ال state اللي جايالي ولكنه مش بيبني ال ui زي كده :
return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;
          Navigator.pushNamed(context, ChatScreen.id);
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, message: state.errMessage);
        }
      },
      child: ...
    );

----------------- نهاية المثال علي الخطوات --------------------

*********************************************** استخدام ال bloc *********************************************************************
*********************************************** استخدام ال bloc *********************************************************************

// --- Events --> BLoC --> states --- // this is the flow of using BloC pattern
الفرق بين ال cubit , bloc هي ان ال bloc بيستخدم ال events وليس ال function
ال bloc عنده 2 stream ==> Bloc<AuthEvent, AuthState> 1- events 2- state
ال bloc بيستقبل events وبيطلع states ==> Bloc<AuthEvent, AuthState> علي عكس ال cubit اللي بينكتب جواه function وبيتعامل مع state ==> cubit<AuthState>
وبيكون فيه جوه ال bloc ال on method ودي هي ال event handler بتاعي وعن طريقها بهندل كل ال events اللي جايالي :  on<AuthEvent>((event, emit){}); / لازم اقول لل on method هي هتتعامل مع انهي event ودا بيتم عن طريق on<AuthEvent> زي ال bloc اللي هي فيه

الفرق بين ال bloc , cubit هما نقطتين لو كانوا موجودين فهنستخدم ال bloc غير كدا ال cubit حل مثالي :
1- لو انا عايز اتابع كل التغيرات اللي هتحصل في ال states عندي وايه ال state الموجودة حاليا وايه ال event الحالي و هيطلع منه انهي state اللي هي next state وكل دا عن طريق ال onTransition الموجودة في ال bloc
-- لو انا مش عايز اتابع ليه ال state اللي طلعت دي طلعت بسبب انهي event ال user عمله فانا اقدر اتابع التغيرات بال cubit بدل ال bloc عن طريق ال onChange اللي موجود في ال cubit
-- الطريقة الافضل والابسط والاشمل بدل استخدام ال onTransition, onChange هي اني اطبع كل ال states اللي بتتغير في ال bloc بتاعي عن طريق ال BlocObserver اللي هو عبارة عن class بعمله implement وبيحتوي علي 3 methods هما onEvent, onChange, onTransition وبعمل override ليهم وبطبع كل حاجة بتحصل فيهم عشان اعرف ايه اللي بيحصل جوا ال bloc بتاعي وايه ال states اللي بتتغير و ايه ال events اللي بتتعمله triggering عشان اعرف اذا كان في مشكلة ولا لا
2-

خطوات تنفيذ ال bloc في اي تطبيق زي ال cubit بالظبط ماعدا اول 3 خطوات والطريقة كالتالي :
1- بحدد ال Event ==> اللي هي اي حدث ممكن المستخدم يعملها مع مثلا الصفحة اللي بنحدد ال events بتاعتها يعني باختصار انا ك user ممكن اعمل اي في ال login_page والاجابة هي ال events وملحوظة ال event علي الاغلب بتكون هي اسم ال function اللي عملناها في ال cubit لنفس الصفحة
2- بحدد ال States
3- بنشأ ال BloC
4- بكمل باقي الخطوات عادي زي ال cubit (ب provide ال BloC و بشغله في المكان اللي انا محتاجه في التطبيق)
*** ملحوظة ***** :
--> احنا بنعمل cubit واحد لصفحات ال Authentication اللي زي login page , register page وبيكون اسم ال cubit دا هو Auth_cubti وبيكون شايل كل ال functions بتاعت الصفحتين وكذلك في ملف ال Auth_states اللي بيشيل كل ال states بتاعت الصفحتين
*** ملحوظة ***** :
احنا بنعمل فولدر اسمه Features جوه ال lib لاننا دايما اول منبدا مشروع بنعمله عشان نقسم الكود علي هيئة Features يعني مش بنعمل فولدر اسمه pages مثلا لان دا مش افضل الممارسات وكل feature بنحدده علي اساس ال design بتاع التطبيق زي مثلا ال Auth Feature اللي بتكون مسؤولة عن انها تهندل كل عمليات ال Authentication وشايلة كل صفح تسجيل الدخول والحسابات وكل الكلام دا
--------------------  مثال علي خطوات استخدام ال bloc ---------------------------------
هنعمل فولدر اسمه auth_bloc وهنحط فيه 3 ملفات :
1- auth_events :
@immutable
abstract class AuthEvent {}
final class LoginEvent extends AuthEvent {
final String email, password;
وكده ال LoginEvent بيحتوي علي البيانات اللي انا محتاجها
LoginEvent({required this.email, required this.password})
}
final class SignupEvent extends AuthEvent {}

2- auth_states :
abstract class AuthState {}
هنحط كل ال states بتاعت ال login , signup pages هنا عادي وكلهم بي extends AuthState {}

3- auth_bloc :
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    @override
    void onTransition(Transition<AuthEvent, AuthState> transition) {
      // This method is called whenever there is a transition from one state to another in the AuthBloc. It can be used for logging, debugging, or performing side effects based on state changes.
      // ال transition هو عبارة عن object بيحتوي على معلومات عن الانتقال اللي حصل في ال bloc بتاعي يعني ايه ال event اللي اتعمله triggering و ايه ال state اللي كان قبل الانتقال و ايه ال state اللي بعد الانتقال
      // الهدف منه هو اني اطبع كل transition بيحصل في ال bloc بتاعي عشان اعرف ايه اللي بيحصل جوا ال bloc بتاعي وايه ال states اللي بتتغير و ايه ال events اللي بتتعمله triggering عشان اعرف اذا كان في مشكلة ولا لا
      // ال transition بيحتوي على ال event اللي اتعملها triggering وال state اللي قبل ال transition وال state اللي بعد ال transition
      print(transition);
      super.onTransition(transition);
      // هنستخدم ال BlocObserver ومش هنتعامل بال method دي هنا عشان هو افضل
    }

    on<AuthEvent>((event, emit) async {
      // TOdO: implement event handler
      هنا انا بكتب الكود بتاعي عادي جدا يعني انا بتشك علي الكود اللي جايلي
      if (event is LoginEvent) {
      هنحط كود ال loginUser من اول emit(LoginLoading()); لحد الاخر وهنجيبه من ال LoginCubit اللي كنا عاملينه
      والبيانات اللي هنحتاجها زي المتغيرات اللي هتجيب البيانات اللي المستخدم هيكتبها زي email, password هتجيلنا ونتحكم فيها عن طريق ال LoginEvent
      وهجيب ال email , password عن طريق ال event نفسه اللي انا بتشك عليه زي كده : email: event.email , password: event.password
      }
    });
  }
}

4- دلوقت بق عايزين نعمل trigger لل event في صفحة ال login_page عند زرار ontap :
عشان اضيف event بستخدم add method لان في حالة ال bloc بيكون عندي حاجتين وهما stream بستقبل عليه event و stream بطلع منه ال states فعشان ابعت state لل bloc بستخدم ال add وبضيف فيها ال event اللي انا عايز ابعته فتلقائيا بمجرد محط ال event في ال add method علطول بيستقبله مني ال bloc اللي انا انشاته
onTap: () async {
  if (formKey.currentstate!.validate()) {
  BlocProvider.of<AuthBloc>(context).add(LoginEvent(email: email!, password: password!));
  وباقي الكود ....
  }
  وباقي الكود ....
}
-------------------- نهاية المثال علي خطوات استخدام ال bloc ------------------------

###For overview & learn read bloc documentation on ==> https://bloclibrary.dev/#/getting-started
install flutter bloc package write in terminal ==> flutter pub add flutter_bloc , https://pub.dev/packages/flutter_bloc
read & learn about bloc library documentation ==> https://bloclibrary.dev/#/

*********************************************** استخدام ال bloc نهاية *********************************************************************
*********************************************** استخدام ال bloc نهاية *********************************************************************

------------------------- MVVM (Model-View-ViewModel) -------------------------
Introduction to MVVM (Model-View-ViewModel) Architecture Pattern / design pattern الاتنين صح عشان ال Architecture pattern ينفع يكون design pattern وليس العكس
الفرق بين ال design pattern و ال architecture pattern ان ال design pattern هو حل لمشكلة معينة في تصميم البرمجيات اما ال architecture pattern هو هيكل عام لتنظيم النظام البرمجي بالكامل
مثال علي ال design pattern زي Singleton pattern , Factory pattern , Observer pattern
مثال علي ال architecture pattern زي MVC ,MVC+S , MVVM , MVP , Clean Architecture
انا بحدد انهي architecture pattern علي حسب حجم المشروع و تعقيده و طب هنحدد ازاي ؟
- المشاريع الصغيرة و البسيطة اللي بتاخد اسبوعين ل شهر ممكن نستخدم ال MVC او MVP
- المشاريع المتوسطة و الكبيرة اللي بتاخد من شهرين ل 6 شهور ممكن نستخدم ال MVVM
- المشاريع الكبيرة جدا و المعقدة اللي بتاخد اكتر من 6 شهور ممكن نستخدم ال Clean Architecture

الفرق بين ال product based , services based في الشركات :
- ال product based  دي شركة شغالة علي منتج واحد لا غير وهو اللي بيبني منتج معين و بيبيعه للمستخدمين زي تطبيقات الموبايل او الويب زي google , facebook , twitter فهنا بق لازم يكون عندي architecture pattern قوية عشان اقدر اعدل و اضيف ميزات جديدة للمنتج بتاعي بسهولة و بسرعة
- ال services based هو اللي بيقدم خدمات معينة للعملاء زي تطبيقات الويب اللي بتقدم خدمات للشركات او المؤسسات زي مواقع التجارة الالكترونية او مواقع الحجز الفندقي فهنا ممكن نستخدم architecture pattern ابسط زي MVC او MVP عشان المشاريع بتكون بسيطة و مش معقدة

**ليه MVVM؟**
اغلب المشاريع اللي هنشتغل عليها هتكون MVVM مثالية ليها وهنستخدم حاجة اكبر من ال MVVM لما نشتغل علي مشاريع علي scale كبير جدا مع العلم ان المشاريع المتوسطة بتاخد وقت من شهرين ل 6 اشهر
ال MVVM هو architecture pattern بيفصل بين ال UI و ال Logic و بيخلي ال Codebase منظم اكتر و سهل للصيانة و اختباره واعادة استخدام الكود و scalable كمان
MVVM ==> فيها 2 layers
1- Data Layer ==> Model --> بتتعامل مع البيانات سواء من API او Database و بتحولها ل objects عشان تبعتها لل Presentation Layer
2- Presentation Layer ==> View + ViewModel ---> بتعرض البيانات اللي جاية من ال data Layer علي ال UI
Presentation Layer بتتكون من 2 layers
  a- View ==> بتعرض البيانات اللي جاية من ال ViewModel وبتبعت ال user interactions لل ViewModel
  b- ViewModel ==> بتتعامل مع ال Model عشان تجيب البيانات وبتعالجها لو محتاجة معالجة وبتعرضها لل View وبتتعامل مع ال user interactions اللي جاية من ال View وبتحدث ال Model علي اساسها

### English Introduction
**What is MVVM?**
MVVM (Model-View-ViewModel) is a software architectural pattern that separates the development of the graphical user interface (the view) from the business logic or back-end logic (the model) by introducing an intermediate component called the ViewModel. This separation allows for a more modular and maintainable codebase.
**Key Components:**
*   **Model:** Represents the data and business logic of the application. It is responsible for managing the data, whether it comes from a database, web service, or other sources.
*   **View:** The user interface of the application. It displays data from the Model and sends user interactions to the ViewModel.
*   **ViewModel:** Acts as an intermediary between the View and the Model. It retrieves data from the Model, processes it if necessary, and exposes it to the View. The ViewModel also handles user interactions from the View and updates the Model accordingly.
The MVVM pattern promotes a clear separation of concerns, making it easier to manage complex applications, improve testability, and enhance maintainability.
---### مقدمة باللغة العربية
**ما هو MVVM؟**
MVVM (النموذج-العرض-نموذج العرض) هو نمط معماري للبرمجيات يفصل بين تطوير واجهة المستخدم الرسومية (العرض) ومنطق الأعمال أو منطق الخلفية (النموذج) من خلال تقديم مكون وسيط يسمى نموذج العرض. يسمح هذا الفصل بقاعدة كود أكثر تنظيمًا وقابلية للصيانة.
**المكونات الرئيسية:**
*   **النموذج (Model):** يمثل بيانات ومنطق الأعمال للتطبيق. وهو مسؤول عن إدارة البيانات، سواء كانت تأتي من قاعدة بيانات أو خدمة ويب أو مصادر أخرى.
*   **العرض (View):** واجهة المستخدم للتطبيق. يعرض البيانات من النموذج ويرسل تفاعلات المستخدم إلى نموذج العرض.
*   **نموذج العرض (ViewModel):** يعمل كوسيط بين العرض والنموذج. يسترجع البيانات من النموذج، ويعالجها إذا لزم الأمر، ويعرضها على العرض. كما يتعامل نموذج العرض مع تفاعلات المستخدم من العرض ويحدث النموذج وفقًا لذلك.
يعزز نمط MVVM فصلًا واضحًا للمسؤوليات، مما يسهل إدارة التطبيقات المعقدة، وتحسين قابلية الاختبار، وتعزيز الصيانة.
---###For overview & learn read MVVM documentation on ==> https://learn.microsoft.com/en-us
*/
