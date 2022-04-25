import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/data_layer/local/shared_prefrenses.dart';
import 'package:nextleveltask/domain_layer/remote/remote.dart';
import 'package:nextleveltask/logic_layer/layout_cubit/cubit.dart';
import 'package:nextleveltask/ui_layer/screens/login/login_screen.dart';

import 'logic_layer/calculate_currency_cubit/cubit.dart';
import 'logic_layer/get_all_currencies_cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPreferences();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(
            create: (context) =>
                GetAllCurrenciesCubit()..getAllCurrenciesData()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
