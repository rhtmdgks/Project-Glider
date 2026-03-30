import 'package:flutter_test/flutter_test.dart';

import 'package:project_glider/main.dart';

void main() {
  testWidgets('App loads', (WidgetTester tester) async {
    await tester.pumpWidget(const ProjectGliderApp());

    expect(find.text('project_glider'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
  });
}
