import 'package:flutter/material.dart';

import '../../app_color/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final dynamic onPressed;
  final String label;

  const PrimaryButton({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width, height * 0.070),
            backgroundColor: BohibaColors.successColor
        ),
        child: Text(label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            )
        ),
      ),
    );
  }
}