import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../app_color/app_color.dart';


class TextImageInputField extends StatelessWidget {
  final String? hintText;
  final int? maxLength;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  const TextImageInputField({Key? key,
    this.hintText,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.controller,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        textCapitalization: textCapitalization,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyLarge,
        validator: validator,
        decoration: InputDecoration(
          counterText: "",
          hintText: hintText,
          suffixIconColor: BohibaColors.bgColor,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

class UserAuthDropDown extends StatefulWidget {
  final List<String> items;
  final String hint;
  late String? dropDownValue;
  UserAuthDropDown({
    Key? key,
    this.hint = "Label",
    this.items = const [],
    this.dropDownValue,
  }) : super(key: key);

  @override
  State<UserAuthDropDown> createState() => _UserAuthDropDownState();
}

class _UserAuthDropDownState extends State<UserAuthDropDown> {

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return DropdownButtonHideUnderline(
      child:  DropdownButtonFormField(
        hint: Text(widget.hint),
        value: widget.dropDownValue,
        style: Theme.of(context).textTheme.bodyMedium,
        icon: const Icon(Icons.keyboard_arrow_down),
        focusColor: Colors.green,
        items: widget.items.map((items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items,
              style:  TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  letterSpacing: 1.2
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            widget.dropDownValue = newValue!;
          });
          debugPrint(widget.dropDownValue);
        },
      ),
    );
  }
}

class UserAuthImageUpload extends StatefulWidget {
  final VoidCallback? onTap;
  final String? tooltip;
  const UserAuthImageUpload({
    Key? key,
    this.onTap,
    this.tooltip,
  }) : super(key: key);

  @override
  State<UserAuthImageUpload> createState() => _UserAuthImageUploadState();
}

class _UserAuthImageUploadState extends State<UserAuthImageUpload> {

  File? img;

  void imagePicker() async{
    try {
      var image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 25);

      if (image == null) return;
      setState(() {
        img = File(image.path);
      });
      debugPrint(File(image.path).toString());

    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Tooltip(
      preferBelow: false,
      message: widget.tooltip,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: InkWell(
          onTap: imagePicker,
          // onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            // height: 2,
            width: 35,
            decoration: BoxDecoration(
                image: img != null ? DecorationImage(
                    image: FileImage(File(img!.path)),
                    fit: BoxFit.cover
                ): null,
                color: BohibaColors.primaryColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    width: 1.5,
                    color: img != null ? BohibaColors.successColor :BohibaColors.primaryColor
                )
            ),
            child: const Icon(EvaIcons.imageOutline),
          ),
        ),
      ),
    );
  }
}

class PinCodeTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  const PinCodeTextField({
    Key? key,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.maxLength,
    this.textCapitalization = TextCapitalization.words,
    this.onChanged,
    this.inputFormatters,
    this.suffixIcon,
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
          suffixIcon: suffixIcon
        ),
      ),
    );
  }
}



class UserAuthContainerImageUpload extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final DecorationImage? image;
  const UserAuthContainerImageUpload({
    Key? key,
    this.label = "User Auth Container Image Upload",
    this.onTap,
    this.image,
  }) : super(key: key);

  @override
  State<UserAuthContainerImageUpload> createState() => _UserAuthContainerImageUploadState();
}

class _UserAuthContainerImageUploadState extends State<UserAuthContainerImageUpload> {
  File? img;

  void imagePicker() async{
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);

      if (image == null) return;
      setState(() {
        img = File(image.path);
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        elevation: 2.0,
        child: InkWell(
          onTap: imagePicker,
          // onTap: onTap,
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: height * 0.2,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: img != null ? DecorationImage(
                    image: FileImage(File(img!.path)),
                    fit: BoxFit.cover
                ) : null,
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(EvaIcons.imageOutline),
                img == null ? Text(widget.label,
                  style: Theme.of(context).textTheme.bodySmall,
                ) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}