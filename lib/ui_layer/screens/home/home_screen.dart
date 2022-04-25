import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/data_layer/local/shared_prefrenses.dart';
import 'package:nextleveltask/logic_layer/calculate_currency_cubit/cubit.dart';
import 'package:nextleveltask/logic_layer/calculate_currency_cubit/states.dart';
import 'package:nextleveltask/logic_layer/get_currencies_values_cubit/cubit.dart';
import 'package:nextleveltask/logic_layer/get_currencies_values_cubit/states.dart';
import 'package:nextleveltask/ui_layer/helpers/constants/constants.dart';
import 'package:nextleveltask/ui_layer/widgets/home_widgets/add_currency_item.dart';
import 'package:nextleveltask/ui_layer/widgets/home_widgets/add_currency_model_sheet.dart';
import 'package:nextleveltask/ui_layer/widgets/home_widgets/currency_item.dart';
import 'package:nextleveltask/ui_layer/widgets/home_widgets/edit_balance_model_sheet.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<String> startCurrencies = ['egp', 'eur', 'aed'];
  List<String> startCurrenciesNames = ['Egyptian', 'Euro', 'United Arab'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetCurrenciesValuesCubit()..getCurrenciesValuesData(),
        child: BlocBuilder<GetCurrenciesValuesCubit, GetCurrenciesValuesStates>(
          builder: (context, state) {
            if (state is GetCurrenciesValuesStateLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is GetCurrenciesValuesStateError) {
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
            if (state is GetCurrenciesValuesStateSuccess) {
              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.3,
                          color: defaultColor,
                        ),
                      ],
                    ),
                  ),
                  BlocProvider(
                    create: (context) => CalculateCurrenciesCubit(),
                    child: BlocBuilder<CalculateCurrenciesCubit, CalculateCurrenciesStates>(
                      builder: (context, state) {
                        CalculateCurrenciesCubit.get(context).calculateCurrenciesData(GetCurrenciesValuesCubit.get(context).allCurrenciesValues, getBalance() ?? 0, startCurrencies);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height / 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                            'assets/icons/drawer_icon.png',
                                            height: 20,
                                            width: 20,
                                          )),
                                      Row(
                                        children: [
                                          const Text(
                                            'ZieadEmad',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                            child: Center(
                                              child: Container(
                                                width: 35,
                                                height: 35,
                                                decoration: const BoxDecoration(
                                                    // color: Colors.green,
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/4/4a/Mohamed_Salah_2018.jpg'), fit: BoxFit.cover)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey[300],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('TOTAL BALANCE',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text('\$',
                                                  style: TextStyle(
                                                    fontSize: 35,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text('${getBalance() ?? 0}',
                                                  style: const TextStyle(
                                                    fontSize: 28,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 2,
                                              color: Colors.grey,
                                              width: MediaQuery.of(context).size.width / 2.2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30.0),
                                                topRight: Radius.circular(30.0),
                                              ),
                                            ),
                                            builder: (BuildContext context) {
                                              return EditBalanceModelSheet();
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey, width: 2),
                                            borderRadius: BorderRadius.circular(18),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2, bottom: 2),
                                            child: Center(
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                    size: 14,
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text('Edit',
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 24.0, right: 24.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text('Currency',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text('Make Changes',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height / 100,
                                  ),
                                  Column(
                                    children: [
                                      ListView.separated(
                                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) => CurrencyItem(
                                          title: GetCurrenciesValuesCubit.get(context).myCurrencies[index].name,
                                          iconPath: 'assets/icons/drawer_icon.png',
                                          currency: ('${GetCurrenciesValuesCubit.get(context).myCurrencies[index].amountRate * double.parse('${getBalance() == null ? 0 : getBalance()}')}'),
                                          currencyType: GetCurrenciesValuesCubit.get(context).myCurrencies[index].code,
                                        ),
                                        separatorBuilder: (context, index) => SizedBox(height: MediaQuery.of(context).size.height / 50,
                                        ),
                                        itemCount: GetCurrenciesValuesCubit.get(context).myCurrencies.length,
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height / 50,
                                      ),
                                      AddCurrencyItem(onPress: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.0),
                                              topRight: Radius.circular(30.0),
                                            ),
                                          ),
                                          builder: (BuildContext context) {
                                            return AddCurrencyModelSheet();
                                          },
                                        );
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const SizedBox(
              height: 1,
            );
          },
        ),
      ),
    );
  }
}
