import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/domain_layer/remote/end_points.dart';
import 'package:nextleveltask/domain_layer/remote/remote.dart';
import 'package:nextleveltask/logic_layer/get_all_currencies_cubit/states.dart';

class GetAllCurrenciesCubit extends Cubit<GetAllCurrenciesStates> {
  GetAllCurrenciesCubit() : super(GetAllCurrenciesInitial());
  static GetAllCurrenciesCubit get(context) => BlocProvider.of(context);
 Map <String,dynamic> allCurrencies = {};
 List<String> allCurrenciesNames = [];

  getAllCurrenciesData(){
    emit(GetAllCurrenciesLoading());
    DioHelper.getData(
      path: getAllCurrencies,
    ).then((value) {
      allCurrencies.addAll(value.data);
      allCurrencies.forEach((key, value) {
      allCurrenciesNames.add(value);
      });
      emit(GetAllCurrenciesSuccess(allCurrencies,allCurrenciesNames));
    }).catchError((e)
    {
      if (e is DioError){
        emit(GetAllCurrenciesError('${e.response!.data['message']}'));
        print('${e.response!.data['message']}');
      } else {
        print('${e.toString()}');
      }
    });
  }

}