import 'package:crypto_currency_price_tracker/constants/colors.dart';
import 'package:crypto_currency_price_tracker/helpers/helpers.dart';
import 'package:crypto_currency_price_tracker/models/crypto_currency.dart';
import 'package:crypto_currency_price_tracker/providers/market_provider.dart';
import 'package:crypto_currency_price_tracker/widgets/row.dart';
import 'package:crypto_currency_price_tracker/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final String id;

  const Details({Key? key, required this.id}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Consumer<MarketProvider>(
          builder: (context, marketProvider, child) {
            CryptoCurrency currentCrypto =
                marketProvider.fetchCryptoById(widget.id);

            return RefreshIndicator(
              onRefresh: () async {
                await marketProvider.fetchData();
              },
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                child: Image.network(currentCrypto.image!)),
                            horizontalSpacer(10),
                            Headings(
                              text: currentCrypto.name!.toUpperCase(),
                              fontsize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                            horizontalSpacer(20),
                            (currentCrypto.isFavorite == false)
                                ? IconButton(
                                    onPressed: () {
                                      marketProvider.addFavorite(currentCrypto);
                                    },
                                    icon: const Icon(
                                        CupertinoIcons.location_circle),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      marketProvider
                                          .removeFavorite(currentCrypto);
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.location_circle_fill,
                                      color: AppColors.green,
                                    ),
                                  )
                          ],
                        ),
                      ),
                      verticalSpacer(40),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: PADDINGS.padding1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SpecialisedRow(
                              heading: "current Price :-",
                              heading2:
                                  " ₹ ${currentCrypto.currentPrice!.toStringAsFixed(2)}",
                            ),
                            verticalSpacer(15),
                            SpecialisedRow(
                              heading: "Market cap rank:-",
                              heading2: currentCrypto.marketCapRank!.toString(),
                              color: AppColors.blue,
                            ),
                            verticalSpacer(15),
                            SpecialisedRow(
                                heading: "High(24h):-",
                                heading2: currentCrypto.high24!.toString(),
                                color: AppColors.green),
                            verticalSpacer(15),
                            SpecialisedRow(
                              heading: "Low(24h):-",
                              heading2: currentCrypto.low24!.toString(),
                              color: AppColors.red,
                            ),
                            verticalSpacer(15),
                            SpecialisedRow(
                              heading: "Price change:-",
                              heading2: currentCrypto.priceChange24!.toString(),
                            ),
                            verticalSpacer(15),
                            SpecialisedRow(
                              heading: "Circulating supply:-",
                              heading2: currentCrypto.circulatingSupply!
                                  .toStringAsFixed(2),
                            ),
                            verticalSpacer(15),
                            SpecialisedRow(
                              heading: "ATH:-",
                              heading2: currentCrypto.ath!.toStringAsFixed(2),
                            ),
                            verticalSpacer(15),
                            SpecialisedRow(
                              heading: "ATL:-",
                              heading2: currentCrypto.atl!.toStringAsFixed(2),
                            ),
                            verticalSpacer(25),
                            Container(
                              height: 200,
                              width: double.infinity,
                              margin: const EdgeInsets.all(PADDINGS.padding1),
                              child: const Headings(
                                text:
                                    "This information is intended for monitoring purposes only and should not be used for making financial decisions. Always conduct your own research and seek professional advice before investing",
                                fontsize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.bluegrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


