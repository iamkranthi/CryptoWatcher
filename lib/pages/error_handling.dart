import 'package:crypto_currency_price_tracker/constants/colors.dart';
import 'package:crypto_currency_price_tracker/widgets/text.dart';
import 'package:flutter/cupertino.dart';

class ErrorHandling extends StatelessWidget {
  const ErrorHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(CupertinoIcons.wifi_exclamationmark, size: 25),
          Headings(
            text: "Please Connect to internet",
            fontsize: 25,
            fontWeight: FontWeight.w400,
            color: AppColors.bluegrey,
          )
        ],
      ),
    );
  }
}
