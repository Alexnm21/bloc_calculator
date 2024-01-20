import 'package:bloc_calculator/domain/bloc/theme/theme_bloc.dart';
import 'package:bloc_calculator/ui/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorKeyboard extends StatelessWidget {
  const CalculatorKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10).r,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  CalculatorButton.number('7',state.themeIndex),
                  CalculatorButton.number('8',state.themeIndex),
                  CalculatorButton.number('9',state.themeIndex),
                  CalculatorButton.delete('DEL',state.themeIndex)
                ],
              ),
              Row(
                children: [
                  CalculatorButton.number('4',state.themeIndex),
                  CalculatorButton.number('5',state.themeIndex),
                  CalculatorButton.number('6',state.themeIndex),
                  CalculatorButton.operation('+',state.themeIndex)
                ],
              ),
              Row(
                children: [
                  CalculatorButton.number('1',state.themeIndex),
                  CalculatorButton.number('2',state.themeIndex),
                  CalculatorButton.number('3',state.themeIndex),
                  CalculatorButton.operation('-',state.themeIndex),
                ],
              ),
              Row(
                children: [
                  CalculatorButton.number('.',state.themeIndex),
                  CalculatorButton.number('0',state.themeIndex),
                  CalculatorButton.operation('/',state.themeIndex),
                  CalculatorButton.operation('x',state.themeIndex),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton.delete('RESET',state.themeIndex),
                  CalculatorButton.result(state.themeIndex),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
