import 'package:flutter_test/flutter_test.dart';
import 'package:HoFiMeFu/app.dart';

void main() {
  testWidgets('Create main widget and verify content', (WidgetTester tester) async {

    await tester.pumpWidget(HoFiMeFuApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome to HoFiMeFu'), findsOneWidget);
    expect(find.text('Sign in'.toUpperCase()), findsOneWidget);
    expect(find.text('Register'.toUpperCase()), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
  });
}
