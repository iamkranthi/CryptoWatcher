
 class CryptoCurrency {
  String? id;
  String? name;
  String? image;
  String? currentPrice;
  String? marketCap;
  String? marketCapRank;
  String? high24;
  String? low24;
  String? priceChange24;
  String? priceChangePercentage24;
  String? circulatingSupply;
  String? ath;
  String? atl;

  CryptoCurrency({
    required this.id,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.ath,
    required this.atl,
    required this.circulatingSupply,
    required this.high24,
    required this.low24,
    required this.marketCapRank,
    required this.priceChange24,
    required this.priceChangePercentage24,
  });

  factory CryptoCurrency.fromJSON(Map<String, dynamic> map) {
    return CryptoCurrency(
      id: map["id"],
      name: map["name"],
      image: map["image"],
      currentPrice: map["currentPrice"],
      marketCap: map["marketCap"],
      ath: map["ath"],
      atl: map["atl"],
      circulatingSupply: map["circulatingSupply"],
      high24: map["circulatingSupply"],
      low24: map["low24"],
      marketCapRank: map["marketCapRank"],
      priceChange24: map["priceChange24"],
      priceChangePercentage24: map["priceChange24"],
    );
  }
}
