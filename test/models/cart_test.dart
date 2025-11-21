import 'package:test/test.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/models/cart.dart';

void main() {
  group('Cart model', () {
    final perUnitPrice = {
      SandwichType.veggieDelight: 5.0,
      SandwichType.chickenTeriyaki: 6.5,
      SandwichType.tunaMelt: 5.75,
      SandwichType.meatballMarinara: 7.0,
    };

    double fakePriceCalculator(Sandwich s, int qty) {
      final unit = perUnitPrice[s.type] ?? 0.0;
      return unit * qty;
    }

    test('add and totalItems / lineItems behave correctly', () {
      final cart = Cart(priceCalculator: fakePriceCalculator);

      final v1 = Sandwich(type: SandwichType.veggieDelight, isFootlong: false, breadType: BreadType.wheat);
      final v2 = Sandwich(type: SandwichType.veggieDelight, isFootlong: true, breadType: BreadType.wheat);

      cart.add(v1);
      expect(cart.totalItems, 1);
      cart.add(v1, 2);
      expect(cart.totalItems, 3);

      // different size is a distinct line item
      cart.add(v2);
      expect(cart.lineItems.length, 2);
    });

    test('updateQuantity and remove work as expected', () {
      final cart = Cart(priceCalculator: fakePriceCalculator);
      final s = Sandwich(type: SandwichType.tunaMelt, isFootlong: false, breadType: BreadType.wholemeal);

      cart.add(s, 3);
      expect(cart.totalItems, 3);

      cart.updateQuantity(s, 1);
      expect(cart.totalItems, 1);

      cart.updateQuantity(s, 0); // should remove
      expect(cart.totalItems, 0);
      expect(cart.lineItems, isEmpty);
    });

    test('totalPrice uses injected price calculator', () {
      final cart = Cart(priceCalculator: fakePriceCalculator);

      final a = Sandwich(type: SandwichType.veggieDelight, isFootlong: false, breadType: BreadType.wheat);
      final b = Sandwich(type: SandwichType.chickenTeriyaki, isFootlong: true, breadType: BreadType.white);

      cart.add(a, 2); // 2 * 5.0 = 10.0
      cart.add(b, 1); // 1 * 6.5 = 6.5

      expect(cart.totalPrice, closeTo(16.5, 1e-9));
    });

    test('clear empties the cart', () {
      final cart = Cart(priceCalculator: fakePriceCalculator);
      final s = Sandwich(type: SandwichType.meatballMarinara, isFootlong: false, breadType: BreadType.white);

      cart.add(s, 2);
      expect(cart.totalItems, 2);

      cart.clear();
      expect(cart.totalItems, 0);
      expect(cart.lineItems, isEmpty);
    });
  });
}
