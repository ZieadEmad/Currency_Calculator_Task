import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/logic_layer/get_all_currencies_cubit/cubit.dart';
import 'package:nextleveltask/logic_layer/get_all_currencies_cubit/states.dart';
import 'package:nextleveltask/ui_layer/helpers/constants/constants.dart';
import 'package:nextleveltask/ui_layer/widgets/shared_widgets/build_drop_down_menu/build_drop_down_menu.dart';
import 'package:nextleveltask/ui_layer/widgets/shared_widgets/default_button/default_button.dart';

class AddCurrencyModelSheet extends StatelessWidget {
  AddCurrencyModelSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.clear)),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                ),
                const Center(
                  child: Text(
                    'Edit Balance',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width/1.3,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(16),
                ),
                child:const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: BuildDropDownMenu(),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: DefaultButton(
                width: MediaQuery.of(context).size.width/2,
                height: 40,
                toUpper: false,
                function: (){
                },
                fontSize: 16,
                text: 'Add Currency',
                background: defaultColor,
                titleColor: Colors.white,
                radius: 18,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
