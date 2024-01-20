import 'package:bloc_calculator/domain/bloc/theme/theme_bloc.dart';
import 'package:bloc_calculator/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'calc',
          style: AppTheme.h1,
        ),
        const _ThemeSelector(),
      ],
    );
  }
}

class _ThemeSelector extends StatelessWidget {
  const _ThemeSelector();
  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15).r,
          width: 70.h,
          padding: const EdgeInsets.symmetric(horizontal: 10).r,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('2', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('3', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Row(
          children: [
             Padding(
               padding: const EdgeInsets.only(right: 10).r,
               child: const Text('THEME', style: TextStyle(fontWeight: FontWeight.bold)),
             ),
            GestureDetector(
              onTap: () {
                themeBloc.add(ChangeTheme());
              },
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 70.h,
                    height: 25.h,
                    alignment: getAlignmentByPosition(state.themeIndex),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Theme.of(context).primaryColor),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(5).r,
                      height: 15.h,
                      width: 15.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                        borderRadius: BorderRadius.circular(50)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
  // Define la posicion del selector de tema en función de cual está seleccionado
  Alignment getAlignmentByPosition(int position) {
    switch (position) {
      case 0:
        return Alignment.centerLeft;
      case 1:
        return Alignment.center;
      default:
        return Alignment.centerRight;
    }
  }
}
