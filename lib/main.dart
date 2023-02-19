import 'package:crypto_currency_price_tracker/constants/colors.dart';
import 'package:crypto_currency_price_tracker/models/local_storage.dart';
import 'package:crypto_currency_price_tracker/pages/onboarding.dart';
import 'package:crypto_currency_price_tracker/providers/market_provider.dart';
import 'package:crypto_currency_price_tracker/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String currentTheme = await LocalStorage.getTheme() ?? "light";
  runApp( MyApp(
    theme: currentTheme,
  ));
}

class MyApp extends StatelessWidget {
  final String theme;
  const MyApp({super.key, required this.theme});

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
            home: const Onboarding(),
          );
        },
      ),
    );
  }
}
