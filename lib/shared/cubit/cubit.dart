import 'package:PressPulse/modules/business/business_screen.dart';
import 'package:PressPulse/modules/science/science_screen.dart';
import 'package:PressPulse/modules/sports/sports_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [

    BottomNavigationBarItem(
        icon: Icon(Icons.science_rounded), label: "Science"),
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_rounded), label: "Business"),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports), label: "Sports"),
  ];
  void changeBottomNavBar(int index){currentIndex = index;
  emit(NewsBottomNavState());
  }
  List<Widget> screens= [
    ScienceScreen(),
    BusinessScreen(),
    SportsScreen(),

  ];
}
