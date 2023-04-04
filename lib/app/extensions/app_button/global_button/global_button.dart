import 'package:flutter/material.dart';

import '../../app_color/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final String label;

  const PrimaryButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton(

        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width ?? _width, height ?? 47),
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