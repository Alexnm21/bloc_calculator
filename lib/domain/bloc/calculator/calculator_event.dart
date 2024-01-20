part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorEvent {}

class ChangeStringEvent extends CalculatorEvent{
  final String newString;

  ChangeStringEvent({required this.newString});
}

class AddNumber extends CalculatorEvent{
  final String newNumber;

  AddNumber(this.newNumber);
}

class AddOperation extends CalculatorEvent{
  final String operation;

  AddOperation(this.operation);
}

class DeleteNumbers extends CalculatorEvent{
  final bool reset;

  DeleteNumbers({this.reset=false});


}

class CalculateResult extends CalculatorEvent{}
