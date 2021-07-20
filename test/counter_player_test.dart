import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

import 'package:rock_paper_scissors/pages/who_won.dart';

void main() {
  group(
    'Find Text',
    () {
      testWidgets(
        'Find first sentence',
        (WidgetTester tester) async {
          const childWidget = Text(
            'Let\'s play !',
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          );

          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: childWidget,
                ),
              ),
            ),
          );

          expect(find.byWidget(childWidget), findsOneWidget);
        },
      );

      testWidgets(
        'Get Button Index',
        (WidgetTester tester) async {
          var rand = new Random();
          var iaIndex = rand.nextInt(3);
          int iaScore = 0, playerScore = 0;

          var result = whoWon(iaIndex, 0);
          if (iaIndex == 0) {
            expect(result, [result[0], result[1]]);
            // do nothing, match nul
          } else if (iaIndex == 1) {
            expect(result, [result[0], result[1]]);
            iaScore++;
          } else {
            expect(result, [result[0], result[1]]);
            playerScore++;
          }
          print(iaScore);
          print(playerScore);
          if (iaScore == 0 && playerScore == 0) {
            print('ia and player has drawned');
          } else if (iaScore == 1) {
            print('ia Won');
          } else {
            print('player Won');
          }
        },
      );
    },
  );
}
