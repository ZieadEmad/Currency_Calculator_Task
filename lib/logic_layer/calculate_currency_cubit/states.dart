abstract class CalculateCurrenciesStates {}

class CalculateCurrenciesStateInitial extends CalculateCurrenciesStates {}

class CalculateCurrenciesStateLoading extends CalculateCurrenciesStates {}
class CalculateCurrenciesStateSuccess extends CalculateCurrenciesStates {
List<String> finalValues ;
  CalculateCurrenciesStateSuccess(this.finalValues);
}
class CalculateCurrenciesStateError extends CalculateCurrenciesStates {
  String error;
  CalculateCurrenciesStateError(this.error);
}