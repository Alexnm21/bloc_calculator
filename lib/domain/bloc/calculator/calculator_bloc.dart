
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {

    on<AddNumber>((event, emit) {
      if(state.result!= null){
        emit(CalculatorState(firstNumber: event.newNumber));
        return;
      }
      
      if(state.operation != '') {
        emit(state.addSecondNumber(event.newNumber));
      } else {
         emit(state.addFirstNumber(event.newNumber));
      }
    });

    on<AddOperation>((event, emit) {

      if(state.result!=null){
        String stringResult = state.result! % 1 == 0 ? '${state.result!.toInt()}' : '${state.result}';
        emit(CalculatorState(firstNumber: stringResult, operation: event.operation));
        
      }else{
        emit(state.copyWith(operation: event.operation));
      }
    });

    on<DeleteNumbers>((event, emit) {
      if(event.reset || state.result != null) {
        emit(const CalculatorState());
      } else {
          emit(state.deleteLast());
      }
      
    });

    on<CalculateResult>((event, emit) {
      double firstNumber = double.parse(state.firstNumber);
      double secondNumber = double.parse(state.secondNumber);
      double result;

      switch (state.operation) {
        case '+': result = firstNumber + secondNumber; break;
        case '-': result = firstNumber - secondNumber; break;
        case 'x': result = firstNumber * secondNumber; break;
        case '/':
          // Verificar la división por cero
          result = secondNumber != 0 ? firstNumber / secondNumber : double.infinity;
          break;
        default: result = 0; break;
      }

      emit(state.copyWith(result: result));
    });
  }
}
