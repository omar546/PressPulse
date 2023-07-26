import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'layout/news_layout.dart';
import 'shared/styles/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PressPulse',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Styles.caribbean,
          unselectedItemColor: Styles.greyColor,
          selectedLabelStyle: TextStyle(fontFamily: 'wilson'),
          unselectedLabelStyle: TextStyle(fontFamily: 'wilson'),
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Styles.whiteColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Styles.whiteColor,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Styles.caribbean),
        ),
        scaffoldBackgroundColor: Styles.whiteColor,
      ),
      darkTheme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Styles.crayola,
          unselectedItemColor: Styles.greyColor,
          selectedLabelStyle: TextStyle(fontFamily: 'wilson'),
          unselectedLabelStyle: TextStyle(fontFamily: 'wilson'),
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Styles.blackColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Styles.blackColor,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Styles.crayola),

        ),
        scaffoldBackgroundColor: Styles.blackColor,
        primarySwatch: Colors.blueGrey,
      ),
      home: NewsLayout(),
    );
  }
}