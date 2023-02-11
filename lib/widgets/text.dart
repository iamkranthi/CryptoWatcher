import 'package:flutter/material.dart';

class Headings extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontsize;
  final FontWeight fontWeight;
 final double? textScaleFactor;
  const Headings({
    super.key,
    required this.text,
    this.color,
    required this.fontsize,
    required this.fontWeight, this.textScaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaleFactor: textScaleFactor,
      style:
          TextStyle(fontSize: fontsize, fontWeight: fontWeight, color: color,),
    );
  }
}