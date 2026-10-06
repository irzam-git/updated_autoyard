import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:start/features/notifications/domain/models/notification_model.dart';
import 'package:start/features/notifications/presentation/widgets/notification_item_card.dart';

void main() {
  group('NotificationItemCard Widget Tests', () {
    testWidgets('displays notification title, message, and triggers onTap', (tester) async {
      bool tapped = false;

      const notification = NotificationModel(
        id: 'notif-1',
        data: NotificationDataModel(
          title: 'Trip Assigned',
          message: 'You have a new pickup in Melbourne CBD.',
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NotificationItemCard(
              notification: notification,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      expect(find.text('Trip Assigned'), findsOneWidget);
      expect(find.text('You have a new pickup in Melbourne CBD.'), findsOneWidget);

      await tester.tap(find.byType(NotificationItemCard));
      expect(tapped, true);
    });
  });
}
