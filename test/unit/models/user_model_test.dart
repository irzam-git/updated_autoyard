import 'package:flutter_test/flutter_test.dart';
import 'package:autoyard/features/auth/domain/models/user_model.dart';

void main() {
  group('UserModel Serialization & Domain Logic', () {
    test('correctly deserializes full driver JSON payload', () {
      final json = {
        'id': 16,
        'first_name': 'Fawaz',
        'last_name': 'Hussain',
        'fullname': 'Fawaz Hussain',
        'email': 'fawaz.pixelz360@gmail.com',
        'phone_number': '03002643066',
        'user_type': 'driver',
        'profile_image_url': 'https://dev.autoyard.com.au/storage/users/profile.jpeg',
        'avatar_color': '#0DB0F4',
        'status': 'active',
        'verified': true,
        'driver_details': {
          'id': 9,
          'user_id': 16,
          'send_details_to': 'email',
        },
        'driver_parent': {
          'id': 15,
          'first_name': 'Huzaifa',
          'last_name': 'Rasheed',
          'email': 'pm@pixelz360.com.au',
          'other': {
            'is_subscription_active': true,
            'vehicles_count': 27,
            'drivers_count': 1,
          },
        },
        'driver_parent_details': {
          'id': 6,
          'user_id': 15,
          'company_name': 'P360 Automobiles',
          'business_address': 'Karachi Pakistan',
          'abn_number': '124411278',
        },
      };

      final user = UserModel.fromJson(json);

      expect(user.id, 16);
      expect(user.displayName, 'Fawaz Hussain');
      expect(user.initials, 'FH');
      expect(user.email, 'fawaz.pixelz360@gmail.com');
      expect(user.driverDetails?.sendDetailsTo, 'email');
      expect(user.driverParent?.displayName, 'Huzaifa Rasheed');
      expect(user.driverParent?.other?.vehiclesCount, 27);
      expect(user.driverParentDetails?.companyName, 'P360 Automobiles');
    });

    test('initials fallback for single word or empty name', () {
      const user = UserModel(
        email: 'driver@autoyard.com',
        firstName: 'Solo',
      );
      expect(user.displayName, 'Solo');
      expect(user.initials, 'S');

      const userNoName = UserModel(email: 'test@example.com');
      expect(userNoName.displayName, 'test');
      expect(userNoName.initials, 'T');
    });
  });
}
