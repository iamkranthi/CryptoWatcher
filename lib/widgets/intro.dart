import 'package:crypto_currency_price_tracker/helpers/helpers.dart';
import 'package:crypto_currency_price_tracker/widgets/text.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  final String image;
  final String text;
  const Intro({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PADDINGS.padding1),
          child: Center(
            child: Column(
              children: [
                verticalSpacer(40),
                SizedBox(
                  height: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(image, fit: BoxFit.fill),
                  ),
                ),
                verticalSpacer(50),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: PADDINGS.padding4),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Headings(
                      text: text,
                      fontsize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
