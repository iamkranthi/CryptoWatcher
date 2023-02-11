import 'package:crypto_currency_price_tracker/models/api.dart';
import 'package:crypto_currency_price_tracker/models/crypto_currency.dart';
import 'package:flutter/cupertino.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CryptoCurrency> markets = [];
  MarketProvider() {
    fetchData();
  }
  Future<void>fetchData() async {
    // ignore: no_leading_underscores_for_local_identifiers
    List<dynamic> _markets = await Api.getMarkets();

    List<CryptoCurrency> temp = [];
    for (var market in _markets) {
      CryptoCurrency newCrypto = CryptoCurrency.fromJSON(market);
      temp.add(newCrypto);
    }
    markets = temp;
    isLoading = false;
    notifyListeners();
  }
}
