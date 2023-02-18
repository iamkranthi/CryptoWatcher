import 'package:crypto_currency_price_tracker/constants/colors.dart';
import 'package:crypto_currency_price_tracker/widgets/text.dart';
import 'package:flutter/material.dart';

class SpecialisedRow extends StatelessWidget {
  final String heading;
  final String heading2;
  final Color? color;

  const SpecialisedRow({
    Key? key,
    required this.heading,
    required this.heading2,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Headings(
          text: heading,
          fontsize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.bluegrey,
        ),
        Headings(
          text: heading2,
          fontsize: 18,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      ],
    );
  }
}