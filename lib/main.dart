import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:marcha/state/DataBase.dart';
import 'package:marcha/views/splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Get initial links
  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();
  runApp(MyApp(initialLink: initialLink));
  // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  // OneSignal.shared.setAppId("3265e1d5-dfce-4dd0-876f-f5d8765f04b4");
  // OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
  //   print("Accepted permission: $accepted");
  // });
}

class MyApp extends StatefulWidget {
  final PendingDynamicLinkData? initialLink;
  const MyApp({Key? key, this.initialLink}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // final PendingDynamicLinkData? initialLink;
    initDynamicLinks();
    super.initState();
  }

  void initDynamicLinks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = widget.initialLink;
    var deepLink = data?.link;

    if (deepLink != null) {
      Map<String, String> queryParams = deepLink.queryParameters;
      if (queryParams.isNotEmpty) {
        dynamic postId = queryParams['post_id'];
        if (postId != null) {
          prefs.setString('post_id', postId);
        } else {
          prefs.remove('post_id');
        }
      }
    }

    // Map<String, String> queryParams = deepLink!.queryParameters;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Marcha',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4CAF4F),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF4CAF4F),
          ),
        ),
        primaryColor: const Color(0xFF4CAF4F),
        secondaryHeaderColor: const Color(0xFF4d4949),
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: const Color(0xFF4CAF4F),
        //   primary: const Color(0xFF4CAF4F), //<-- SEE HERE
        // ),
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4CAF4F),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF4CAF4F),
          ),
        ),
        useMaterial3: true,
        primaryColor: const Color(0xFF4CAF4F),
        secondaryHeaderColor: const Color(0xFF4d4949),
        backgroundColor: const Color(0xFFEEEEEE),
        textTheme: GoogleFonts.poppinsTextTheme(
          TextTheme(
            displayLarge: const TextStyle(color: Color(0xFF4d4949)),
            bodyLarge:
                TextStyle(color: const Color(0xFF100E34).withOpacity(0.5)),
          ),
        ),
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF4F),
          primary: const Color(0xFF4CAF4F), //<-- SEE HERE
        ).copyWith(background: const Color(0xFFF5F6F6)),
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<DataBase>(() => DataBase());
      }),
      home: const Splash(),
    );
  }
}
