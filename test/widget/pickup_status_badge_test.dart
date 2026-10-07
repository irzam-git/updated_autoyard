import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:autoyard/features/pickups/presentation/widgets/pickup_status_badge.dart';

void main() {
  Widget buildWidget(String status) {
    return MaterialApp(
      home: Scaffold(
        body: PickupStatusBadge(status: status),
      ),
    );
  }

  group('PickupStatusBadge Widget Tests', () {
    testWidgets('renders ACCEPTED label for accepted status', (tester) async {
      await tester.pumpWidget(buildWidget('accepted'));
      expect(find.text('ACCEPTED'), findsOneWidget);
    });

    testWidgets('renders IN TRANSIT label for in_transit status', (tester) async {
      await tester.pumpWidget(buildWidget('in_transit'));
      expect(find.text('IN TRANSIT'), findsOneWidget);
    });

    testWidgets('renders COMPLETED label for completed status', (tester) async {
      await tester.pumpWidget(buildWidget('completed'));
      expect(find.text('COMPLETED'), findsOneWidget);
    });
  });
}
