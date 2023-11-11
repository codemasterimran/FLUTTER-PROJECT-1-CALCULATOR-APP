import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/app/app.dart';

void main(){
  testWidgets("CALCULATOR TEST",(WidgetTester tester) async{

await tester.pumpWidget(const myapp());
expect(find.byKey(Key("result")),findsOneWidget);

  });
}