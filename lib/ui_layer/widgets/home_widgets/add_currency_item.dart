import 'package:flutter/material.dart';

class AddCurrencyItem extends StatelessWidget {
   AddCurrencyItem({
    Key? key,
   required this.onPress,
  }) : super(key: key);
  VoidCallback onPress ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
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
          ],
        ),
        child: Row(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 20,
                ),
                const SizedBox(
                  width: 40,
                  height: 40,
                  //color: Colors.red,
                  child:Center(child: Icon(Icons.add_circle_outline_rounded,color: Colors.black,size: 30,),),
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
                Text(
                  'Add Currency',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
