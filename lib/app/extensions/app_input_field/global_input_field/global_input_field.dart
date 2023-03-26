
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class TextInputField extends StatelessWidget {
  final String? hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  const TextInputField({Key? key,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.maxLength,
    this.textCapitalization = TextCapitalization.words,
    this.onChanged,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        textCapitalization: textCapitalization,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
            color: Theme.of(context).textTheme.bodyLarge!.color,
            letterSpacing: 1.2
        ),
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please Enter Details';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          counterText: "",
        ),
      ),
    );
  }
}

class EmailInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  const EmailInputField({Key? key, required this.hintText, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: Theme.of(context).textTheme.bodyMedium,
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please Enter Email';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  const PasswordInputField({Key? key, required this.hintText, this.controller}) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: widget.controller,
        style: Theme.of(context).textTheme.bodyMedium,
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please Enter Password';
          }else{
            return null;
          }
        },
        obscureText: showPassword,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 12.0
          ),
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                showPassword = !showPassword;
              });},
            icon: Icon(showPassword ? Remix.eye_close_line : Remix.eye_line,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}