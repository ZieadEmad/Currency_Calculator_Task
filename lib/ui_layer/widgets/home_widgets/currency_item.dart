import 'package:flutter/material.dart';
import 'package:nextleveltask/ui_layer/helpers/constants/constants.dart';
import 'package:nextleveltask/ui_layer/helpers/text_trim/text_trim.dart';

class CurrencyItem extends StatelessWidget {
  CurrencyItem({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.currency,
    required this.currencyType,
  }) : super(key: key);
  String title;
  String iconPath;
  String currency;
  String currencyType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    //color: Colors.red,
                    child: Center(
                        child: Image.asset(
                      iconPath,
                      fit: BoxFit.cover,
                      color: Colors.black,
                    )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  ),
                  Container(
                    width: 3,
                    height: 70,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 30,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey[500],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  textTrim(7, '$currency'),
                  style: const TextStyle(
                      color: defaultColor, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  currencyType,
                  style: const TextStyle(
                      color: defaultColor, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
