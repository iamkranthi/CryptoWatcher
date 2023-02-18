import 'package:crypto_currency_price_tracker/helpers/helpers.dart';
import 'package:crypto_currency_price_tracker/helpers/responsive.dart';
import 'package:crypto_currency_price_tracker/pages/favrouites.dart';
import 'package:crypto_currency_price_tracker/pages/markets.dart';
import 'package:crypto_currency_price_tracker/providers/theme_provider.dart';
import 'package:crypto_currency_price_tracker/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late TabController viewController;

  @override
  void initState() {
    super.initState();
    viewController = TabController(length: 2, vsync: this);
  }

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
                  Headings(
                    text: "Welcome Back",
                    fontsize: 20,
                    fontWeight: FontWeight.w400,
                    textScaleFactor: responsive.sp(3),
                  ),
                  verticalSpacer(10),
                  TabBar(
                    controller: viewController,
                    tabs: const [
                      Tab(
                        child: Text("Markets"),
                      ),
                      Tab(
                        child: Text("Favorites"),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      controller: viewController,
                      children: const [
                        Markets(),
                        Favorite(),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
