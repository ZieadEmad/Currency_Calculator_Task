abstract class GetCurrenciesValuesStates {}

class GetCurrenciesValuesStateInitial extends GetCurrenciesValuesStates {}

class GetCurrenciesValuesStateLoading extends GetCurrenciesValuesStates {}

class GetCurrenciesValuesStateSuccess extends GetCurrenciesValuesStates {
  Map<String, dynamic> allCurrenciesValues;
  GetCurrenciesValuesStateSuccess(this.allCurrenciesValues);
}

class GetCurrenciesValuesStateError extends GetCurrenciesValuesStates {
  String error;
  GetCurrenciesValuesStateError(this.error);
}

class GetCurrenciesInitLoading extends GetCurrenciesValuesStates {}

class GetCurrenciesInitSuccess extends GetCurrenciesValuesStates {}
