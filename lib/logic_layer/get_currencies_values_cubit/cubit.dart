import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/data_layer/local/shared_prefrenses.dart';
import 'package:nextleveltask/data_layer/models/currency_model/currency_model.dart';
import 'package:nextleveltask/domain_layer/remote/end_points.dart';
import 'package:nextleveltask/domain_layer/remote/remote.dart';
import 'package:nextleveltask/logic_layer/get_currencies_values_cubit/states.dart';

class GetCurrenciesValuesCubit extends Cubit<GetCurrenciesValuesStates> {
  GetCurrenciesValuesCubit() : super(GetCurrenciesValuesStateInitial());
  static GetCurrenciesValuesCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic> allCurrenciesValues = {};
  Map<String, dynamic> allCurrencies = {};
  List<CurrencyModel> myCurrencies = [];

  getCurrenciesValuesData() async {
    emit(GetCurrenciesValuesStateLoading());
    await getAllCurrenciesData();
    try {
      Response res = await DioHelper.getData(
        path: 'latest/currencies/usd.json',
      );
      allCurrenciesValues.addAll(res.data['usd']);
    } catch (e) {
      if (e is DioError) {
        emit(GetCurrenciesValuesStateError('${e.response!.data['message']}'));
      } else {}
    }
      if(preferences.getStringList("myCurrencies") == null){
        await preferences.setStringList("myCurrencies", ["aed", "ada"]);
      }
    myCurrencies = (preferences.getStringList("myCurrencies") as List<String>).map((e) {
      return CurrencyModel(amountRate: num.parse('${allCurrenciesValues[e]}'), code: e, name: allCurrencies[e]);
    }).toList();
    emit(GetCurrenciesValuesStateSuccess(allCurrenciesValues));
  }

  Future getAllCurrenciesData() async {
    Response res = await DioHelper.getData(
      path: getAllCurrencies,
    );
    allCurrencies.addAll(res.data);
  }
}
