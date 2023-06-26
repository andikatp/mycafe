// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

void main() {
  int a = int.parse(stdin.readLineSync()!);
  for (int i = 1; i < a; i++) {
    print(a * i);
  }
}
