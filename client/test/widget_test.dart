// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:client/app/app.dart';
// import 'package:client/features/chat/data/datasources/chat_remote_datasource_impl.dart';
// import 'package:client/features/chat/data/repositories/chat_repository_impl.dart';
// import 'package:client/features/chat/domain/usecases/send_message_usecase.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(
//       App(
//         useCase: SendMessageUseCase(
//           ChatRepositoryImpl(ChatRemoteDataSourceImpl(Dio())),
//         ),
//       ),
//     );

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
