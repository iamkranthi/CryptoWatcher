import 'package:crypto_currency_price_tracker/constants/colors.dart';
import 'package:crypto_currency_price_tracker/models/local_storage.dart';
import 'package:crypto_currency_price_tracker/pages/homepage.dart';
import 'package:crypto_currency_price_tracker/pages/onboarding.dart';
import 'package:crypto_currency_price_tracker/providers/market_provider.dart';
import 'package:crypto_currency_price_tracker/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasCompletedOnboarding =
      prefs.getBool("hasCompletedOnboarding") ?? false;
  String currentTheme = await LocalStorage.getTheme() ?? "dark";
  runApp(MyApp(
      theme: currentTheme, hasCompletedOnboarding: hasCompletedOnboarding));
}

class MyApp extends StatelessWidget {
  final String theme;
  final bool hasCompletedOnboarding;
  const MyApp(
      {super.key, required this.theme, required this.hasCompletedOnboarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MarketProvider>(
          create: (context) => MarketProvider(),
        ),
        ChangeNotifierProvider<Themeprovider>(
          create: (context) => Themeprovider(theme),
        ),
      ],
      child: Consumer<Themeprovider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Crypto tracker',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: AppColors.lightTheme,
            darkTheme: AppColors.darkTheme,
             home:  hasCompletedOnboarding ? const Homepage() : const Onboarding(),
          );
        },
      ),
    );
  }
}
