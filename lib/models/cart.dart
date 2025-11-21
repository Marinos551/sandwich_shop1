import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

typedef PriceCalculator = double Function(Sandwich sandwich, int quantity);

class CartItem {
  final Sandwich sandwich;
  int quantity;

  CartItem(this.sandwich, this.quantity);
}

class Cart {
  final List<CartItem> _items = [];
  final PriceCalculator _calculatePrice;

  // Default to PricingRepository.calculatePrice but allow injection for tests.
  Cart({PriceCalculator? priceCalculator})
      : _calculatePrice = priceCalculator ??
            ((sandwich, qty) => PricingRepository.calculatePrice(sandwich, qty));

  // Read-only view of line items.
  List<CartItem> get lineItems => List.unmodifiable(_items);

  int get totalItems => _items.fold(0, (prev, item) => prev + item.quantity);

  double get totalPrice =>
      _items.fold(0.0, (prev, item) => prev + _calculatePrice(item.sandwich, item.quantity));

  void add(Sandwich sandwich, [int quantity = 1]) {
    if (quantity <= 0) return;
    final idx = _indexOf(sandwich);
    if (idx >= 0) {
      _items[idx].quantity += quantity;
    } else {
      _items.add(CartItem(sandwich, quantity));
    }
  }

  void remove(Sandwich sandwich) {
    final idx = _indexOf(sandwich);
    if (idx >= 0) _items.removeAt(idx);
  }

  void updateQuantity(Sandwich sandwich, int quantity) {
    final idx = _indexOf(sandwich);
    if (idx < 0) return;
    if (quantity <= 0) {
      _items.removeAt(idx);
    } else {
      _items[idx].quantity = quantity;
    }
  }

  void clear() => _items.clear();

  int _indexOf(Sandwich sandwich) {
    for (var i = 0; i < _items.length; i++) {
      if (_sameSandwich(_items[i].sandwich, sandwich)) return i;
    }
    return -1;
  }

  bool _sameSandwich(Sandwich a, Sandwich b) {
    return a.type == b.type && a.isFootlong == b.isFootlong && a.breadType == b.breadType;
  }
}
