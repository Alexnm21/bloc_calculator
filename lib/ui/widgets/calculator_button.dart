import 'package:bloc_calculator/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/bloc/calculator/calculator_bloc.dart';

class CalculatorButton extends StatefulWidget {
  const CalculatorButton({super.key, required this.label, required this.event, required this.color, required this.textColor, required this.shadowColor});
  
  final String label;
  final CalculatorEvent event;
  final Color color;
  final Color textColor;
  final Color shadowColor;

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();

  factory CalculatorButton.number(String number, int themePosition) {
    
    return CalculatorButton(
      label: number,
      event: AddNumber(number),
      color: AppTheme.buttonThemes[themePosition].numberButtonColor,
      textColor: AppTheme.buttonThemes[themePosition].numberTextColor,
      shadowColor: AppTheme.buttonThemes[themePosition].numberShadow,

    );
  }

  factory CalculatorButton.operation(String operation, int themePosition) {
    
    return CalculatorButton(
      label: operation,
      event: AddOperation(operation),
      color: AppTheme.buttonThemes[themePosition].numberButtonColor,
      textColor: AppTheme.buttonThemes[themePosition].numberTextColor,
      shadowColor: AppTheme.buttonThemes[themePosition].numberShadow,

    );
  }

  factory CalculatorButton.delete(String text, int themePosition) {
    
    return CalculatorButton(
      label: text,
      event: DeleteNumbers(reset: text == 'RESET'),
      color: AppTheme.buttonThemes[themePosition].deleteButtonColor,
      textColor: AppTheme.buttonThemes[themePosition].deleteTextColor,
      shadowColor: AppTheme.buttonThemes[themePosition].deleteShadow,

    );
  }

  factory CalculatorButton.result(int themePosition) {
    
    return CalculatorButton(
      label: '=',
      event: CalculateResult(),
      color: AppTheme.buttonThemes[themePosition].resultButtonColor,
      textColor: AppTheme.buttonThemes[themePosition].resultTextColor,
      shadowColor: AppTheme.buttonThemes[themePosition].resultShadow,

    );
  }
}

class _CalculatorButtonState extends State<CalculatorButton> {

  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          calculatorBloc.add(widget.event);
          setState(() {pressed = true;});
          await Future.delayed(const Duration(milliseconds: 200), (){setState(() {pressed = false;});});
        },
        onLongPress: () {
          calculatorBloc.add(widget.event);
          setState(() {pressed = true;});
        },
        onLongPressEnd: (details) {
          setState(() {pressed = false;});
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5).r,
          height: 60.h,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
            border: pressed ? null : Border(bottom: BorderSide(color: widget.shadowColor, width: 5.r))
          ),
          child: Center(child: Text(widget.label, style: AppTheme.h1.copyWith(color: widget.textColor),)),
        ),
      ),
    );
  }
}