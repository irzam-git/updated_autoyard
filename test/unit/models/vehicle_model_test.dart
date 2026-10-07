import 'package:flutter_test/flutter_test.dart';
import 'package:autoyard/features/inventory/domain/models/vehicle_model.dart';

void main() {
  group('VehicleModel Serialization & Computed Properties', () {
    test('correctly parses JSON and computes price, regoBadge, and title', () {
      final json = {
        'id': 90,
        'user_id': 15,
        'driver_id': 16,
        'year': '2022',
        'registration_number': '4H5AN',
        'registration_state': 'QLD',
        'first_name': 'Sarah',
        'last_name': 'Connor',
        'price': '45000',
        'payment_method': 'bank_transfer',
        'vehicle_condition': {
          'drivable': 'yes',
          'accidental': 'no',
          'wovi': 'no',
          'under_finance': 'no',
        },
        'brand': {
          'id': 2,
          'name': 'Tesla',
        },
        'model': {
          'id': 5,
          'name': 'Model 3',
        },
      };

      final vehicle = VehicleModel.fromJson(json);

      expect(vehicle.id, 90);
      expect(vehicle.vehicleTitle, '2022 Tesla Model 3');
      expect(vehicle.sellerFullName, 'Sarah Connor');
      expect(vehicle.regoBadge, '4H5AN - QLD');
      expect(vehicle.formattedPrice, '\$45000');
      expect(vehicle.vehicleCondition?.isDrivable, true);
      expect(vehicle.vehicleCondition?.isAccidental, false);
    });

    test('regoBadge returns UNREGISTERED when registration is absent', () {
      const vehicle = VehicleModel(id: 1);
      expect(vehicle.regoBadge, 'UNREGISTERED');
      expect(vehicle.formattedPrice, '\$0');
    });
  });
}
