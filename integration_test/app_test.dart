import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_app/displayPage.dart';
import 'package:test_app/loginPage.dart';
import 'package:test_app/main.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("test after enter input text", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    
    await tester.pumpWidget(LogInPage());

    final inputText1 = "roshan"; 
    final inputText2 = "123456";

    await tester.enterText(find.byKey(Key('user')), inputText1); 
    await tester.enterText(find.byKey(Key('pass')), inputText2);

    await tester.tap(find.byType(ElevatedButton));

    await tester.pumpAndSettle();

    await tester.pumpWidget(DisplayPage(userName: inputText1, passWord: inputText2,));

    
    //expect(find.byType(DisplayPage), findsOneWidget);
    expect(find.text(inputText1), findsOneWidget);
    expect(find.text(inputText2), findsOneWidget);
    await Future.delayed(Duration(minutes: 1));
  });
}