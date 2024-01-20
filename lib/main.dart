import 'package:bloc_calculator/domain/bloc/calculator/calculator_bloc.dart';
import 'package:bloc_calculator/domain/bloc/theme/theme_bloc.dart';
import 'package:bloc_calculator/ui/theme/app_theme.dart';
import 'package:bloc_calculator/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => CalculatorBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 665),
        minTextAdapt: true,
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const HomeScreen(),
              theme: AppTheme.themes[state.themeIndex],
            );
          },
        ),
      ),
    );
  }
}
