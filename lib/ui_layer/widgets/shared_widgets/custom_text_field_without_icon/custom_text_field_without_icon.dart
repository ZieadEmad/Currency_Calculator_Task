import 'package:flutter/material.dart';


///
class CustomTextFieldWithoutIcon extends StatefulWidget {
  /// Custom text form field with out icon
   CustomTextFieldWithoutIcon({
    Key? key,
    required this.hintLabel,
    required this.controller,
    required this.textInputType,
    required this.validator,
    required this.isPassword,
    required this.error,
    required this.haveIcon,
    required this.textFormIcon,
    required this.autofillHints,
    required this.haveObscureIcon,

  }) : super(key: key);
  /// hint text
  final String hintLabel;
  /// Text Editing Controller
  final TextEditingController controller;
  /// keyboard input type
  final TextInputType textInputType;
  bool isPassword = false;
  /// validator
  final String? Function(String?) validator;
   Iterable<String>? autofillHints ;
  bool? error ;

  bool? haveIcon ;
  Icon? textFormIcon ;
   bool? haveObscureIcon ;


   bool _isObscure = true;

   @override
  State<CustomTextFieldWithoutIcon> createState() => _CustomTextFieldWithoutIconState();
}

class _CustomTextFieldWithoutIconState extends State<CustomTextFieldWithoutIcon> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      maxLines: 1,
      style:const TextStyle(color: Colors.white),
      keyboardType: widget.textInputType,
      controller: widget.controller,
      obscureText:   widget._isObscure ,
      autofillHints: widget.autofillHints,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: widget.haveObscureIcon == true ? Icon( widget._isObscure ? Icons.visibility : Icons.visibility_off,color: Colors.white,) : const SizedBox(width: 0,),
          onPressed: () {
            setState(() {
              widget._isObscure = !widget._isObscure;
              widget.isPassword = !widget.isPassword;
            });
          },
        ),
        hoverColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.white),
        disabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:const BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:const BorderSide(
            color: Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:const BorderSide(
            color: Colors.red,
            width: 2
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.error == false ? Colors.white : Colors.red,
          ),
        ),
        hintText: widget.hintLabel,
        filled: true,
        hintStyle:const TextStyle(
          color: Colors.white,
          fontSize: 28,
          letterSpacing: 2.0
        ),
        errorStyle:const TextStyle(height: 0),
        fillColor: Colors.transparent,
        prefixIcon: widget.haveIcon == true ? widget.textFormIcon : null,
        focusColor: Colors.white,
        suffixStyle:const TextStyle(color: Colors.white),
          ),
        );
  }
}
