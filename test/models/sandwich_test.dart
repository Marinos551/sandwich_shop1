import 'package:test/test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich model', () {
    test('name getter returns human-readable name', () {
      final s = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
      expect(s.name, 'Veggie Delight');
    });

    test('image getter constructs correct asset path for footlong', () {
      final s = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      expect(s.image, 'assets/images/veggieDelight_footlong.png');
    });

    test('image getter constructs correct asset path for six inch', () {
      final s = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: false,
        breadType: BreadType.wholemeal,
      );
      expect(s.image, 'assets/images/tunaMelt_six_inch.png');
    });

    test('breadType is preserved on the model', () {
      final s = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );
      expect(s.breadType, BreadType.wheat);
    });
  });
}
