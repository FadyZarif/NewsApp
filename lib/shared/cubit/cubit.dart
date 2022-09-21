

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/news_app/cubit/states.dart';
import 'package:newsapp/network/local/cache_helper.dart';
import 'package:newsapp/shared/cubit/states.dart';

import '../../layout/news_app/cubit/cubit.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isLightMode = true;
  ThemeMode themeMode = ThemeMode.light;

  void changeMode({fromShared}){
    if(fromShared != null){
      isLightMode = fromShared;
      if(isLightMode){
        themeMode = ThemeMode.light;
      }
      else{
        themeMode = ThemeMode.dark;
      }
      emit(AppSwitchLightModeState());
    }
    else {
      if(isLightMode){
        themeMode = ThemeMode.dark;
        isLightMode = false;
      }
      else{
        themeMode = ThemeMode.light;
        isLightMode = true;

      }
      CacheHelper.putBool(key: 'isLight',value: isLightMode).then((value) {
        emit(AppSwitchLightModeState());
      }).catchError((error){
        print("Error is : ${error.toString()}");
      });
    }

  }




}