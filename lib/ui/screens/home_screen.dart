import 'package:bloc_calculator/ui/widgets/calculator_keyboard.dart';
import 'package:bloc_calculator/ui/widgets/result_container.dart';
import 'package:bloc_calculator/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30).r,
          child: const Column(
            children: [
              AppHeader(),
              ResultContainer(),
              CalculatorKeyboard()
            ],
          ),
        ),
      ),
    );
  }
}