import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    test('calculates total for six-inch sandwich', () {
      final repository = PricingRepository(
        sixInchPrice: 7.0,
        footlongPrice: 11.0,
      );
      expect(repository.calculateTotal(3, false), 21.0);
    });

    test('calculates total for footlong sandwich', () {
      final repository = PricingRepository(
        sixInchPrice: 7.0,
        footlongPrice: 11.0,
      );
      expect(repository.calculateTotal(3, true), 33.0);
    });

    test('calculates zero for zero quantity', () {
      final repository = PricingRepository(
        sixInchPrice: 7.0,
        footlongPrice: 11.0,
      );
      expect(repository.calculateTotal(0, true), 0.0);
    });

    test('calculates single six-inch sandwich', () {
      final repository = PricingRepository(
        sixInchPrice: 7.0,
        footlongPrice: 11.0,
      );
      expect(repository.calculateTotal(1, false), 7.0);
    });

    test('calculates single footlong sandwich', () {
      final repository = PricingRepository(
        sixInchPrice: 7.0,
        footlongPrice: 11.0,
      );
      expect(repository.calculateTotal(1, true), 11.0);
    });
  });
}
