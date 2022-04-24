import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/logic_layer/get_all_currencies_cubit/cubit.dart';
import 'package:nextleveltask/logic_layer/get_all_currencies_cubit/states.dart';
import 'package:nextleveltask/ui_layer/helpers/constants/constants.dart';

class BuildDropDownMenu extends StatefulWidget {
  const BuildDropDownMenu({Key? key}) : super(key: key);

  @override
  State<BuildDropDownMenu> createState() => _BuildDropDownMenuState();
}

class _BuildDropDownMenuState extends State<BuildDropDownMenu> {
  var startValue ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllCurrenciesCubit()..getAllCurrenciesData(),
      child: BlocBuilder<GetAllCurrenciesCubit, GetAllCurrenciesStates>(
        builder: (context, state) {
          if (state is GetAllCurrenciesLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is GetAllCurrenciesError) {
            Scaffold(
              body: Center(
                child: Text(
                  state.error,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            );
          }
          if (state is GetAllCurrenciesSuccess) {
              startValue = state.allCurrenciesNames.first;
            return DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                focusColor: defaultColor,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: defaultColor,
                ),
                hint: const Text("Choose Currency"),
                style: const TextStyle(
                    fontSize: 12,
                    color: defaultColor,
                    fontWeight: FontWeight.bold),
                value: startValue,
                onChanged: (newValue) {
                  setState(() {
                    startValue = newValue;
                  });
                },
                items: state.allCurrenciesNames
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  );
                }).toList(),
              ),
            );
          }
          return const SizedBox(
            height: 1,
          );
        },
      ),
    );
  }

  List<String> currencyValues = ['Euro', 'Egyptian Pound', 'Dollar', 'Yen'];
}
