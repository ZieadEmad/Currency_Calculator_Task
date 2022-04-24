import 'package:flutter/material.dart';

class RatingTextField extends StatelessWidget {
   RatingTextField({
    Key? key,
    required  this.controller ,
    required this.validator,
  }) : super(key: key);
    TextEditingController controller ;
    String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter Message',
        labelText: 'Enter Message',
      ),
      validator: validator,
    );
  }
}
