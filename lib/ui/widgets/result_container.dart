import 'package:bloc_calculator/domain/bloc/calculator/calculator_bloc.dart';
import 'package:bloc_calculator/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25).r,
      padding: const EdgeInsets.all(20).r,
      height: 90.h,
      width: double.infinity,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          return Text(state.toString(), style: AppTheme.resultStyle,);
        },
      )
    );
  }

  
}