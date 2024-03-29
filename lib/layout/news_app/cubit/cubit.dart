import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/news_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/business/business.dart';
import 'package:newsapp/modules/science/science.dart';
import 'package:newsapp/modules/sports/sports.dart';

import '../../../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> screenList = [const BusinessScreen(), const SportsScreen(), const ScienceScreen()];
  List<String> titleList = ['Business News','Sprots News','Science News'];
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: 'Business'
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      label: 'Sprots'
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science'
    ),
  ];
  int screenIndex = 0;

  void changeBottomNavBar(int i){
    screenIndex = i;
    if(screenIndex == 1) getSportsNews();
    if(screenIndex == 2) getScienceNews();
    emit(NewsBottomNavBarState());
  }

  List<dynamic> business = [];

  void getBusinessNews()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'business',
          'apiKey' : 'a0e214bf39424a6d906dcba05ad6de30',
        }
    ).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error));
    });
  }

  List<dynamic> sports = [];

  void getSportsNews()
  {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'sports',
          'apiKey' : 'a0e214bf39424a6d906dcba05ad6de30',
        }
    ).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState(error));
    });
  }

  List<dynamic> search = [];

  void getScienceNews()
  {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'science',
          'apiKey' : 'a0e214bf39424a6d906dcba05ad6de30',
        }
    ).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error));
    });
  }

  List<dynamic> science = [];

  void getSearchNews({required String searchKey})
  {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q' : searchKey,
          'apiKey' : 'a0e214bf39424a6d906dcba05ad6de30',
        }
    ).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error));
    });
  }

}
