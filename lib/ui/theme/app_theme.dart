import 'package:bloc_calculator/ui/theme/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static List<ThemeData> themes = [
    theme1,
    theme2,
    theme3
  ];

  static List<CalculatorButtonTheme> buttonThemes = [
    buttonTheme1,
    buttonTheme2,
    buttonTheme3
  ];
  static TextStyle resultStyle = GoogleFonts.leagueSpartan(fontWeight: FontWeight.bold, fontSize: 35.r);
  static TextStyle h1 = GoogleFonts.leagueSpartan(fontWeight: FontWeight.bold, fontSize: 30.r);
  static TextStyle h2 = GoogleFonts.leagueSpartan(fontWeight: FontWeight.normal, fontSize: 20.r);

  static ThemeData theme1 = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF182034),
    primaryColor: const Color(0xFF232C43),
    secondaryHeaderColor: const Color(0xFFD03F2F),
  );

  static ThemeData theme2 = ThemeData.fallback().copyWith(
    scaffoldBackgroundColor: const Color(0xFFEDEDED),
    primaryColor: const Color(0xFFD1CCCC),
    secondaryHeaderColor: const Color(0xFFCA5502),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Color(0xFF35352C))),
  );

  static ThemeData theme3 = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF160628),
    primaryColor: const Color(0xFF1D0934),
    secondaryHeaderColor: const Color(0xFF00E0D1),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Color(0xFFFFE53D)))
  );

  static CalculatorButtonTheme buttonTheme1 = CalculatorButtonTheme(
    numberButtonColor:  const Color(0xFFEAE3DC),
    numberTextColor: const Color(0xFF444B5A),
    numberShadow: const Color(0xFFB4A597),
    resultButtonColor: const Color(0xFFD03F2F),
    resultShadow: const Color(0xFF93261A),
    resultTextColor: Colors.white,
    deleteButtonColor: const Color(0xFF637097),
    deleteShadow: const Color(0xFF404E72),
    deleteTextColor: Colors.white
  );

  

  static CalculatorButtonTheme buttonTheme2 = CalculatorButtonTheme(
    numberButtonColor:  const Color(0xFFEAE3DC),
    numberTextColor: const Color(0xFF444B5A),
    numberShadow: const Color(0xFFB4A597),
    resultButtonColor: const Color(0xFFCA5502),
    resultShadow: const Color(0xFF93261A),
    resultTextColor: Colors.white,
    deleteButtonColor: const Color(0xFF377F86),
    deleteShadow: const Color(0xFF1B5F65),
    deleteTextColor: Colors.white
  );

  static CalculatorButtonTheme buttonTheme3 = CalculatorButtonTheme(
    numberButtonColor:  const Color(0xFF341C4F),
    numberTextColor: const Color(0xFFFFE53D),
    numberShadow: const Color(0xFF58077D),
    resultButtonColor: const Color(0xFF00E0D1),
    resultShadow: const Color(0xFF6CF9F2),
    resultTextColor: const Color(0xFF1B2428),
    deleteButtonColor: const Color(0xFF58077D),
    deleteShadow: const Color(0xFFBC15F4),
    deleteTextColor: Colors.white
  );

  
}