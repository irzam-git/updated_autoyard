import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:autoyard/features/inventory/domain/models/vehicle_model.dart';
import 'package:autoyard/features/inventory/presentation/widgets/vehicle_inventory_card.dart';

void main() {
  group('VehicleInventoryCard Widget Tests', () {
    testWidgets('renders vehicle rego, price, and responds to taps', (tester) async {
      bool receiptTapped = false;
      bool cardTapped = false;

      const vehicle = VehicleModel(
        id: 99,
        registrationNumber: 'TEST99',
        registrationState: 'NSW',
        price: '32000',
        firstName: 'Alex',
        lastName: 'Smith',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VehicleInventoryCard(
              vehicle: vehicle,
              onTap: () => cardTapped = true,
              onViewReceipt: () => receiptTapped = true,
            ),
          ),
        ),
      );

      expect(find.text('TEST99 - NSW'), findsOneWidget);
      expect(find.text('\$32000'), findsOneWidget);
      expect(find.text('Alex Smith'), findsOneWidget);

      await tester.tap(find.text('Receipt'));
      expect(receiptTapped, true);

      await tester.tap(find.text('TEST99 - NSW'));
      expect(cardTapped, true);
    });
  });
}
