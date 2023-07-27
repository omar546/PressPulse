

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'layout/news_layout.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/styles/styles.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  // if main() is async and there is await down here it will wait for it to finish before launching app

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor customColorCari = const MaterialColor(0xFF28666E, {
      50: Color(0xFFE2EEF0),
      100: Color(0xFFB6D6DC),
      200: Color(0xFF89BFC7),
      300: Color(0xFF5CA8B2),
      400: Color(0xFF33919D),
      500: Color(0xFF28666E),
      600: Color(0xFF23585F),
      700: Color(0xFF1E4B53),
      800: Color(0xFF183E48),
      900: Color(0xFF0E2534),
    });
    MaterialColor customColorCry = const MaterialColor(0xFFFF5964, {
      50: Color(0xFFFFF1F2),
      100: Color(0xFFFFD7DA),
      200: Color(0xFFFFB0B6),
      300: Color(0xFFFF8990),
      400: Color(0xFFFF6A76),
      500: Color(0xFFFF5964),
      600: Color(0xFFFF515A),
      700: Color(0xFFFF4851),
      800: Color(0xFFFF4047),
      900: Color(0xFFFF2E35),
    });
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'PressPulse',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 30,
          backgroundColor: Styles.whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Styles.caribbean,
          unselectedItemColor: Styles.greyColor,
          selectedLabelStyle: TextStyle(fontFamily: 'wilson'),
          unselectedLabelStyle: TextStyle(fontFamily: 'wilson'),
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Styles.caribbean),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Styles.whiteColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Styles.whiteColor,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Styles.caribbean),
        ),
        scaffoldBackgroundColor: Styles.whiteColor,
        primarySwatch:customColorCari,
          textTheme: TextTheme(
            bodyMedium: const TextStyle(color: Styles.blackColor,fontFamily: 'vexa',fontSize: 14),
            bodySmall: TextStyle(color: Styles.blackColor.withOpacity(0.5),fontFamily: 'vexa',fontSize: 11),
        ),
      ),
      darkTheme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 30,
          backgroundColor: Styles.blackColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Styles.crayola,
          unselectedItemColor: Styles.greyColor,
          selectedLabelStyle: TextStyle(fontFamily: 'wilson'),
          unselectedLabelStyle: TextStyle(fontFamily: 'wilson'),
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Styles.crayola),

          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Styles.blackColor,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Styles.blackColor,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Styles.crayola),

        ),
        scaffoldBackgroundColor: Styles.blackColor,
          primarySwatch:customColorCry,
    textTheme:  TextTheme(bodyMedium: const TextStyle(color: Styles.whiteColor,fontFamily: 'vexa',fontSize: 14),
      bodySmall: TextStyle(color: Styles.greyColor.withOpacity(0.5),fontFamily: 'vexa',fontSize: 11),


    )),
      home: const NewsLayout(),
    );
  }
}