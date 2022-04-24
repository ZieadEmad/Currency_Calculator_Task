import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/domain_layer/remote/remote.dart';
import 'package:nextleveltask/logic_layer/get_currencies_values_cubit/states.dart';

class GetCurrenciesValuesCubit extends Cubit<GetCurrenciesValuesStates> {
  GetCurrenciesValuesCubit() : super(GetCurrenciesValuesStateInitial());
  static GetCurrenciesValuesCubit get(context) => BlocProvider.of(context);


  Map <String,dynamic> allCurrenciesValues = {};
  getCurrenciesValuesData(){
    emit(GetCurrenciesValuesStateLoading());
    DioHelper.getData(
        path: 'latest/currencies/usd.json',
    ).then((value) {
      allCurrenciesValues.addAll(value.data['usd']);
      emit(GetCurrenciesValuesStateSuccess(allCurrenciesValues));
    }).catchError((e)
    {
      if (e is DioError){
        emit(GetCurrenciesValuesStateError('${e.response!.data['message']}'));
      } else {
      }
    });
  }
}