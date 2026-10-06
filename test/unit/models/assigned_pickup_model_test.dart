import 'package:flutter_test/flutter_test.dart';
import 'package:start/features/pickups/domain/models/assigned_pickup_model.dart';

void main() {
  group('AssignedPickupModel Serialization & Helpers', () {
    test('correctly parses JSON and computes vehicleTitle and customer details', () {
      final json = {
        'id': 52,
        'user_id': 15,
        'driver_id': 16,
        'status': 'accepted',
        'year': '2023',
        'address': '123 Test St, Melbourne VIC',
        'pickup_date': '2026-10-06',
        'customer_name': 'John Doe',
        'phone_number': '+61400111222',
        'brand': {
          'id': 1,
          'name': 'Bentley',
        },
        'model': {
          'id': 10,
          'name': 'Continental GT',
        },
        'customer_info': {
          'id': 15,
          'fullname': 'John Doe',
          'phone_number': '+61400111222',
        },
      };

      final pickup = AssignedPickupModel.fromJson(json);

      expect(pickup.id, 52);
      expect(pickup.vehicleTitle, '2023 Bentley Continental GT');
      expect(pickup.effectiveCustomerName, 'John Doe');
      expect(pickup.effectivePhoneNumber, '+61400111222');
      expect(pickup.isAccepted, true);
      expect(pickup.isCompleted, false);
      expect(pickup.address, '123 Test St, Melbourne VIC');
    });

    test('status flags work for all valid states', () {
      const completed = AssignedPickupModel(id: 1, status: 'completed');
      expect(completed.isCompleted, true);
      expect(completed.isAccepted, false);

      const inTransit = AssignedPickupModel(id: 2, status: 'in_transit');
      expect(inTransit.isInTransit, true);

      const cancelled = AssignedPickupModel(id: 3, status: 'cancelled');
      expect(cancelled.isCancelled, true);

      const pending = AssignedPickupModel(id: 4, status: 'pending');
      expect(pending.isPending, true);
    });
  });
}
