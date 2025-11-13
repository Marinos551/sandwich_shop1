class PricingRepository {
  final double sixInchPrice;
  final double footlongPrice;

  PricingRepository({
    required this.sixInchPrice,
    required this.footlongPrice,
  });

  double calculateTotal(int quantity, bool isFootlong) {
    double pricePerSandwich = isFootlong ? footlongPrice : sixInchPrice;
    return quantity * pricePerSandwich;
  }
}
