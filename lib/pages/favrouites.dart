import 'package:crypto_currency_price_tracker/constants/colors.dart';
import 'package:crypto_currency_price_tracker/models/crypto_currency.dart';
import 'package:crypto_currency_price_tracker/providers/market_provider.dart';
import 'package:crypto_currency_price_tracker/widgets/crypto_cards.dart';
import 'package:crypto_currency_price_tracker/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(
      builder: (context, marketProvider, child) {
        List<CryptoCurrency> favorites = marketProvider.markets
            .where((element) => element.isFavorite == true)
            .toList();
        if (favorites.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: ()async{
            await marketProvider.fetchData();
            },
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                CryptoCurrency currentCrypto = favorites[index];
                return CryptoCards(currentCrypto: currentCrypto);
              },
            ),
          );
        } else {
          return const Center(
            child:  Headings(text: "Favorites not added yet!", fontsize: 26, fontWeight: FontWeight.w400,color: AppColors.bluegrey,
            ),
          );
        }
      },
    ); // Consumer
  }
}
