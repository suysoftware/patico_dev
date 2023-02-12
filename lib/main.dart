import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patico_dev/src/bloc/patico_user_cubit.dart';
import 'package:patico_dev/src/screen/components/custom_navigation_bar.dart';
import 'package:sizer/sizer.dart';
import 'src/constant/language_constants.dart';
import 'src/screen/navigation_screens/home/home_screen.dart';
import 'src/screen/login/login_screen.dart';
import 'src/service/firebase_options.dart';
import 'src/utils/router.dart';

bool isLogged = true;

Future<void> appTracking() async {
  if (await AppTrackingTransparency.trackingAuthorizationStatus ==
      TrackingStatus.notDetermined) {
    await Future.delayed(const Duration(milliseconds: 200));
    await AppTrackingTransparency.requestTrackingAuthorization();
  }
}

Future<void> main() async {
  await init();

  runApp(EasyLocalization(
      supportedLocales: LanguageConstants.SUPPORTED_LOCALE,
      path: LanguageConstants.LANG_PATH,
      fallbackLocale: const Locale('en', 'US'),
      child: const PaticoApp()));
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
      name: "paticoApp", options: FirebaseOptionsClass.firebaseConfig);
  /*await FirebaseAuthService.loggedCheck().then((value) => kmUser = value);
  await FirestoreOperations.kmSystemSettingsGetter()
      .then((value) => systemSettings = value);*/
  await appTracking();

  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
}

class PaticoApp extends StatelessWidget {
  const PaticoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return GestureDetector(
        onTap: () {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => PaticoUserCubit(),
          )
        ], child: const _cupertinoApp()),
      );
    }));
  }
}

class _cupertinoApp extends StatefulWidget {
  const _cupertinoApp({super.key});

  @override
  State<_cupertinoApp> createState() => __cupertinoAppState();
}

class __cupertinoAppState extends State<_cupertinoApp>
    with WidgetsBindingObserver {
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.inactive) {
      //print('inactive');
      /*  messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );*/
    }

    if (state == AppLifecycleState.paused) {
      //print(" altta atıldı");
      /*  messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );*/
    }

    if (state == AppLifecycleState.resumed) {
      //print("alta atıp geri gelince");
      /* messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );*/
    }

    if (state == AppLifecycleState.detached) {
      //print('detached');
      /* messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );*/
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: CustomNavigationBar(),
      onGenerateRoute: RouterSystem.generateRoute,
      initialRoute: navigationBar,
    );
  }
}
