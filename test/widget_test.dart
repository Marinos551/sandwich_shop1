import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';

void main() {
  group('Sandwich Shop App - Widget Tests', () {
    testWidgets('Toggle button switches between Footlong and Six-inch',
        (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const App());

      // Verify initial state is Footlong
      expect(find.text('Footlong'), findsOneWidget);
      expect(find.text('Six-inch'), findsOneWidget);

      // Tap the Six-inch button to switch sandwich size
      await tester.tap(find.byType(ToggleButtons));
      await tester.pumpAndSettle();

      // Verify the size changed by checking the order display
      expect(find.byType(OrderItemDisplay), findsOneWidget);
      final orderDisplay = find.byType(OrderItemDisplay);
      expect(orderDisplay, findsOneWidget);
    });

    testWidgets('Add button increases quantity', (WidgetTester tester) async {
      await tester.pumpWidget(const App());

      // Find and tap the Add button
      final addButton =
          find.byWidgetPredicate((widget) =>
              widget is ElevatedButton &&
              widget.child is Text &&
              (widget.child as Text).data == 'Add');

      // Initial quantity should be 0
      expect(find.text('0 Footlong sandwich(es)'), findsOneWidget);

      // Tap Add button
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      // Quantity should increase to 1
      expect(find.text('1 Footlong sandwich(es)'), findsOneWidget);
    });

    testWidgets('Remove button decreases quantity', (WidgetTester tester) async {
      await tester.pumpWidget(const App());

      // Find Add and Remove buttons
      final addButton =
          find.byWidgetPredicate((widget) =>
              widget is ElevatedButton &&
              widget.child is Text &&
              (widget.child as Text).data == 'Add');
      final removeButton =
          find.byWidgetPredicate((widget) =>
              widget is ElevatedButton &&
              widget.child is Text &&
              (widget.child as Text).data == 'Remove');

      // Add 2 sandwiches
      await tester.tap(addButton);
      await tester.pumpAndSettle();
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      // Verify quantity is 2
      expect(find.text('2 Footlong sandwich(es)'), findsOneWidget);

      // Remove 1 sandwich
      await tester.tap(removeButton);
      await tester.pumpAndSettle();

      // Verify quantity is 1
      expect(find.text('1 Footlong sandwich(es)'), findsOneWidget);
    });

    testWidgets('Add button disables at maximum quantity',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());

      final addButton =
          find.byWidgetPredicate((widget) =>
              widget is ElevatedButton &&
              widget.child is Text &&
              (widget.child as Text).data == 'Add');

      // Add sandwiches until max (5)
      for (int i = 0; i < 5; i++) {
        await tester.tap(addButton);
        await tester.pumpAndSettle();
      }

      // Verify quantity is at max
      expect(find.text('5 Footlong sandwich(es)'), findsOneWidget);

      // Try to add one more - button should be disabled
      final disabledAddButton = find.byWidgetPredicate((widget) =>
          widget is ElevatedButton &&
          widget.onPressed == null &&
          widget.child is Text &&
          (widget.child as Text).data == 'Add');

      expect(disabledAddButton, findsOneWidget);
    });

    testWidgets('Remove button disables at zero quantity',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());

      // At the start, quantity should be 0 and Remove button should be disabled
      final disabledRemoveButton = find.byWidgetPredicate((widget) =>
          widget is ElevatedButton &&
          widget.onPressed == null &&
          widget.child is Text &&
          (widget.child as Text).data == 'Remove');

      expect(disabledRemoveButton, findsOneWidget);
    });

    testWidgets('Order notes are displayed in summary',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());

      // Find the notes text field
      final notesField = find.byType(TextField);
      expect(notesField, findsOneWidget);

      // Enter a note
      await tester.tap(notesField);
      await tester.typeText(notesField, 'no onions');
      await tester.pumpAndSettle();

      // Add a sandwich to see the note in the display
      final addButton =
          find.byWidgetPredicate((widget) =>
              widget is ElevatedButton &&
              widget.child is Text &&
              (widget.child as Text).data == 'Add');
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      // Verify the note appears in the order display
      expect(find.text('no onions'), findsWidgets);
    });
  });
}
