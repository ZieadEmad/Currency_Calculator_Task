import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/logic_layer/calculate_currency_cubit/states.dart';

class CalculateCurrenciesCubit extends Cubit<CalculateCurrenciesStates>  {
  CalculateCurrenciesCubit() : super(CalculateCurrenciesStateInitial());

  static CalculateCurrenciesCubit get(context) => BlocProvider.of(context);

  String finalValue = '';
  List<String> finalValues = [] ;
   calculateCurrenciesData(
    Map<String, dynamic> allCurrenciesValues,
    balance,
    List currencyType,
  ) {
     for(int i = 0 ; i < currencyType.length ;i++ ){
       allCurrenciesValues.forEach((key, value) {
         if (key == currencyType[i]) {
           finalValues.add('${value*num.parse(balance.toString())}');
         }
       });
     }
     emit(CalculateCurrenciesStateSuccess(finalValues));
  }
}
