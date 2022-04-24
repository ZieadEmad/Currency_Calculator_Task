abstract class GetAllCurrenciesStates {}

class GetAllCurrenciesInitial extends GetAllCurrenciesStates {}

//state of get all currencies (main)
class GetAllCurrenciesLoading extends GetAllCurrenciesStates {}
class GetAllCurrenciesSuccess extends GetAllCurrenciesStates {
  Map <String,dynamic> allCurrencies;
  List<String> allCurrenciesNames;
  GetAllCurrenciesSuccess(this.allCurrencies,this.allCurrenciesNames);
}
class GetAllCurrenciesError extends GetAllCurrenciesStates {
  String error;
  GetAllCurrenciesError(this.error);
}