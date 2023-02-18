import 'dart:async';

import 'package:crypto_currency_price_tracker/models/api.dart';
import 'package:crypto_currency_price_tracker/models/crypto_currency.dart';
import 'package:crypto_currency_price_tracker/models/local_storage.dart';
import 'package:flutter/cupertino.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CryptoCurrency> markets = [];
  MarketProvider() {
    fetchData();
  }
  Future<void> fetchData() async {
    // ignore: no_leading_underscores_for_local_identifiers
    List<dynamic> _markets = await Api.getMarkets();
    List<String> favorites = await LocalStorage.fetchFavorites();

    List<CryptoCurrency> temp = [];
    for (var market in _markets) {
      CryptoCurrency newCrypto = CryptoCurrency.fromJSON(market);

      if (favorites.contains(newCrypto.id!)) {
        newCrypto.isFavorite = true;
      }

      temp.add(newCrypto);
    }
    markets = temp;
    isLoading = false;
    notifyListeners();
  }

  CryptoCurrency fetchCryptoById(String id) {
    CryptoCurrency crypto =
        markets.where((element) => element.id == id).toList()[0];
    return crypto;
  }

  void addFavorite(CryptoCurrency crypto) async {
    int index0fCrypto = markets.indexOf(crypto);
    markets[index0fCrypto].isFavorite = true;
    await LocalStorage.addFavorite(crypto.id!);
    notifyListeners();
  }

  void removeFavorite(CryptoCurrency crypto) async {
    int index0fCrypto = markets.indexOf(crypto);
    markets[index0fCrypto].isFavorite = false;
    await LocalStorage.removeFavorite(crypto.id!);
    notifyListeners();
  }
}
