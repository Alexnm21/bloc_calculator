import 'package:bloc_calculator/ui/theme/app_theme.dart';
import 'package:bloc_calculator/ui/theme/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeIndex: 0)) {
    on<ChangeTheme>((event, emit) {
      int currentIndex = state.themeIndex;

      if(currentIndex == AppTheme.themes.length - 1){
        emit(ThemeState(themeIndex: 0));
      }else{
        emit(ThemeState(themeIndex: ++currentIndex));
      }    
    });
  }
}
