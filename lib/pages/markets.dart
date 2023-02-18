import 'package:crypto_currency_price_tracker/helpers/helpers.dart';
import 'package:crypto_currency_price_tracker/models/crypto_currency.dart';
import 'package:crypto_currency_price_tracker/pages/detail_page.dart';
import 'package:crypto_currency_price_tracker/providers/market_provider.dart';
import 'package:crypto_currency_price_tracker/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Markets extends StatelessWidget {
  const Markets({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Consumer<MarketProvider>(
        builder: (context, marketProvider, child) {
          if (marketProvider.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (marketProvider.markets.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  await marketProvider.fetchData();
                },
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: marketProvider.markets.length,
                  itemBuilder: ((context, index) {
                    CryptoCurrency currentCrypto =
                        marketProvider.markets[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: PADDINGS.padding2,
                          horizontal: PADDINGS.padding3),
                      child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Details(id: currentCrypto.id!),
                              ),
                            );
                          },
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: NetworkImage(currentCrypto.image!),
                          ),
                          title: Text(currentCrypto.name!),
                          subtitle: Text(
                            currentCrypto.symbol!.toUpperCase(),
                            style: const TextStyle(color: Colors.green),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Headings(
                                text:
                                    "₹ ${currentCrypto.currentPrice!.toStringAsFixed(2)}",
                                fontsize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey,
                              ),
                              Builder(
                                builder: (context) {
                                  double priceChange =
                                      currentCrypto.priceChange24!;
                                  double priceChangePercentage =
                                      currentCrypto.priceChangePercentage24!;
                                  if (priceChange < 0) {
                                    return Headings(
                                      text:
                                          "₹ ${priceChangePercentage.toStringAsFixed(2)} % (${priceChange.toStringAsFixed(2)})",
                                      fontsize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red,
                                    );
                                  } else if (priceChange > 0) {
                                    return Headings(
                                      text:
                                          "₹ ${priceChangePercentage.toStringAsFixed(2)} % (${priceChange.toStringAsFixed(2)})",
                                      fontsize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue,
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ],
                          )
                          //Text(currentCrypto.currentPrice!.toStringAsFixed(2),s),
                          ),
                    );
                  }),
                ),
              );
            } else {
              return const Text("Data not found");
            }
          }
        },
      ),
    );
  }
}
