import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:autoyard/app.dart';

void main() {
  testWidgets('App initializes successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: App(),
      ),
    );

    expect(find.byType(App), findsOneWidget);
    await tester.pumpAndSettle();
  });
}

