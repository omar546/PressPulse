import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press_pulse/shared/components/components.dart';

import '../../layout/news_layout.dart';
import '../../modules/business/business_screen.dart';
import '../../modules/science/science_screen.dart';
import '../../modules/sports/sports_screen.dart';
import '../network/local/cache_helper.dart';
import '../network/remote/dio_helper.dart';
import 'states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.monetization_on), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports_basketball), label: "Sports"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_rounded), label: "Science"),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.settings), label: "Settings"),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  // bool isDark = false;
  // void changeMode({bool? fromShared}) {
  //   if (fromShared != null) {
  //     isDark = fromShared;
  //     emit(AppChangeModeState());
  //   } else {
  //     isDark = !isDark;
  //     CacheHelper.putBoolean(key: 'isDark', value: isDark).then(
  //           (value) {
  //             emit(AppChangeModeState());
  //
  //       },
  //     );
  //   }
  // }

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    // const SettingsScreen(),
  ];

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState(error));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {

      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        emit(NewsGetSportsErrorState(error));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());

    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        emit(NewsGetScienceErrorState(error));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }


  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
      DioHelper.getData(url: 'v2/everything', query: {
        'q': value,
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        search = value.data['articles'];
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        emit(NewsGetSearchErrorState(error));
      });

    }

}
