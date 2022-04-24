

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/logic_layer/layout_cubit/states.dart';
import 'package:nextleveltask/ui_layer/screens/home/home_screen.dart';
import 'package:nextleveltask/ui_layer/screens/settings/settings_screen.dart';
import 'package:nextleveltask/ui_layer/screens/transactions/transactions_screen.dart';



class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutStateInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> widget = [
    HomeScreen(),
   const TransactionsScreen(),
   const SettingsScreen(),
  ];

  int currentIndex = 0 ;


  changeIndex(index){
    currentIndex = index ;
    emit(LayoutStateIndex());
  }


}