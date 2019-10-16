import 'package:flutter_test/flutter_test.dart';
import 'package:roll_a_die/dice-item.dart';

void main() {
  test('Number Occured Probability Test', () {
    var diceItem = new DiceItem();
    for (int i = 0; i < 10000000; i++) diceItem.changeDice();

    for (int i = 0; i < 7; i++)
      print(
          'Probability of the number ${i + 1} appearing: ${diceItem.occurCount[i] / diceItem.progressCount}, debiation: ${diceItem.occurCount[i] / diceItem.progressCount - 1.0 / 7.0} ');
  });
}
