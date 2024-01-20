part of 'calculator_bloc.dart';

@immutable
class CalculatorState {
  final String firstNumber;
  final String secondNumber;
  final String operation;
  final double? result;

  const CalculatorState({
    this.firstNumber = '0',
    this.secondNumber = '',
    this.operation = '',
    this.result,
  });

  CalculatorState copyWith({
    String? firstNumber,
    String? secondNumber,
    String? operation,
    double? result,
  }) {
    return CalculatorState(
      firstNumber: firstNumber ?? this.firstNumber,
      secondNumber: secondNumber ?? this.secondNumber,
      operation: operation ?? this.operation,
      result: result ?? this.result,
    );
  }

  @override
  String toString(){
    if(result != null){
      if(result! % 1 == 0) return '${result!.toInt()}'; //Comprobar si es un entero para no mostrar el numero con decimales
      return '$result';
    }

    return firstNumber + operation + secondNumber;
  }

  CalculatorState deleteLast() {
    if (secondNumber.isNotEmpty) {
      // Eliminar el último carácter de secondNumber
      final updatedSecondNumber = secondNumber.substring(0, secondNumber.length - 1);
      return copyWith(secondNumber: updatedSecondNumber);
    } else if (operation.isNotEmpty) {
      // Eliminar el último carácter de operation
      final updatedOperation = operation.substring(0, operation.length - 1);
      return copyWith(operation: updatedOperation);
    } else if (firstNumber.isNotEmpty ) {
      // Eliminar el último carácter de firstNumber
      final updatedFirstNumber = firstNumber.substring(0, firstNumber.length - 1);
      if(updatedFirstNumber.isEmpty) return copyWith(firstNumber: '0');
      return copyWith(firstNumber: updatedFirstNumber);
    } else {
      // No hay nada que eliminar, devolver el estado actual
      return this;
    }
  }

  CalculatorState addFirstNumber(String newNumber){
    if(firstNumber == '0') return copyWith(firstNumber: newNumber);

    return copyWith(firstNumber: firstNumber + newNumber);
  }

  CalculatorState addSecondNumber(String newNumber){
    if(secondNumber == '0') return copyWith(secondNumber: newNumber);

    return copyWith(secondNumber: secondNumber + newNumber);
  }


}
