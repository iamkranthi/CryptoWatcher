import 'package:crypto_currency_price_tracker/helpers/helpers.dart';
import 'package:crypto_currency_price_tracker/helpers/responsive.dart';
import 'package:crypto_currency_price_tracker/models/crypto_currency.dart';
import 'package:crypto_currency_price_tracker/pages/detail_page.dart';
import 'package:crypto_currency_price_tracker/providers/market_provider.dart';
import 'package:crypto_currency_price_tracker/providers/theme_provider.dart';
import 'package:crypto_currency_price_tracker/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Themeprovider themeProvider =
        Provider.of<Themeprovider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilderWidget(
          builder: (BuildContext context, Responsive responsive) {
            return Container(
              padding: EdgeInsets.only(
                top: responsive.hp(2),
                bottom: 0,
                left: responsive.hp(2),
                right: responsive.hp(2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Headings(
                        text: 'Crypto Watcher',
                        fontsize: 24,
                        fontWeight: FontWeight.w600,
                        textScaleFactor: responsive.sp(4),
                      ),
                      IconButton(
                        onPressed: () {
                          themeProvider.toggleTheme();
                        },
                        icon: (themeProvider.themeMode == ThemeMode.dark)
                            ? const Icon(Icons.dark_mode)
                            : const Icon(Icons.light_mode),
                      )
                    ],
                  ),
                  verticalSpacer(8),
                  Headings(
                    text: "Welcome Back",
                    fontsize: 20,
                    fontWeight: FontWeight.w400,
                    textScaleFactor: responsive.sp(3),
                  ),
                  verticalSpacer(10),
                  Flexible(
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
                                              builder: (context) => Details(
                                                  id: currentCrypto.id!),
                                            ),
                                          );
                                        },
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 8),
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          backgroundImage: NetworkImage(
                                              currentCrypto.image!),
                                        ),
                                        title: Text(currentCrypto.name!),
                                        subtitle: Text(
                                          currentCrypto.symbol!.toUpperCase(),
                                          style: const TextStyle(
                                              color: Colors.green),
                                        ),
                                        trailing: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
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
                                                    currentCrypto
                                                        .priceChange24!;
                                                double priceChangePercentage =
                                                    currentCrypto
                                                        .priceChangePercentage24!;
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
