import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:marcha/state/DataBase.dart';
import 'package:marcha/views/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Marcha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF90CB25),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF90CB25),
          ),
        ),
        useMaterial3: true,
        primaryColor: const Color(0xFF90CB25),
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
          seedColor: const Color(0xFF90CB25),
          primary: const Color(0xFF90CB25), //<-- SEE HERE
        ).copyWith(background: const Color(0xFFF5F6F6)),
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<DataBase>(() => DataBase());
      }),
      home: const Splash(),
    );
  }
}
