import 'package:flutter/material.dart';
import 'package:nextleveltask/data_layer/local/shared_prefrenses.dart';
import 'package:nextleveltask/ui_layer/helpers/constants/constants.dart';
import 'package:nextleveltask/ui_layer/helpers/navigations/navigations.dart';
import 'package:nextleveltask/ui_layer/screens/home/home_screen.dart';
import 'package:nextleveltask/ui_layer/widgets/shared_widgets/build_toast/build_toast.dart';
import 'package:nextleveltask/ui_layer/widgets/shared_widgets/custom_text_field_without_icon/custom_text_field_without_icon.dart';
import 'package:nextleveltask/ui_layer/widgets/shared_widgets/default_button/default_button.dart';

class EditBalanceModelSheet extends StatefulWidget {
  EditBalanceModelSheet({Key? key}) : super(key: key);

  @override
  State<EditBalanceModelSheet> createState() => _EditBalanceModelSheetState();
}

class _EditBalanceModelSheetState extends State<EditBalanceModelSheet> {
  TextEditingController balanceController = TextEditingController();
  var formKey = GlobalKey<FormState>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
      balanceController.text = getBalance() != null ? getBalance()! : "";
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
            Form(
              key: formKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Cant be blank';
                    //   LoginCubit.get(context).changeEmailToError();
                  }
                },
                maxLines: 1,
                style: const TextStyle(color: defaultColor),

                keyboardType: TextInputType.number,
                controller: balanceController,
                decoration: const InputDecoration(
                  hintText: 'Balance',
                  border: OutlineInputBorder()
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
                  if(formKey.currentState!.validate()){
                    saveBalance(balanceController.text).then((value) {
                      showToast(text: 'Your Balance Added Successfully', error: false);
                     navigateTo(context,  HomeScreen());
                    });
                  }
                  if(balanceController.text.isEmpty){
                    showToast(text: 'Please add balance', error: true);
                  }
                },
                fontSize: 16,
                text: 'Edit Balance',
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
