import 'package:flutter_test/flutter_test.dart';
import 'package:start/features/notifications/domain/models/notification_model.dart';

void main() {
  group('NotificationModel Serialization & Link Extraction', () {
    test('correctly parses notification and extracts pickup ID from deep URL', () {
      final json = {
        'id': 'f2032229-9964-4a14-bc56-d2fafc84dda8',
        'type': 'App\\Notifications\\AssignedVehicleToDriverByCustomerNotification',
        'data': {
          'title': 'Pickup Vehicle Assignment',
          'url': 'http://127.0.0.1:8000/driver/assigned_vehicle/52',
          'message': 'Bentley Continental GT Speed pickup vehicle has been assigned.',
        },
        'read_at': null,
        'created_at': '2026-10-06T03:33:28.000000Z',
      };

      final notification = NotificationModel.fromJson(json);

      expect(notification.id, 'f2032229-9964-4a14-bc56-d2fafc84dda8');
      expect(notification.isRead, false);
      expect(notification.displayTitle, 'Pickup Vehicle Assignment');
      expect(notification.displayMessage, 'Bentley Continental GT Speed pickup vehicle has been assigned.');
      expect(notification.pickupId, 52);
      expect(notification.vehicleId, null);
    });

    test('correctly marks notification as read when read_at is present', () {
      const notification = NotificationModel(
        id: '123',
        readAt: '2026-10-06T04:00:00.000000Z',
      );
      expect(notification.isRead, true);
    });
  });
}
