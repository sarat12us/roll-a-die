import 'dart:math';

class DiceItem {

  int currentNumber;
  int progressCount;
  List<int> occurCount = new List(7);

  // In this the 7 has nothing to with simulating 7 sided die with 5 sided , its just a count of asset images
  DiceItem(){
    currentNumber = 1;
    progressCount = 0;
    for (int i = 0; i < 7; i++) {
      occurCount[i] = 0;
    }
  }

  void changeDice() {
    currentNumber = randSevenByFive();
    progressCount++;
    occurCount[currentNumber - 1]++;
  }

  int randFive() {
    return Random().nextInt(5) + 1;
  }

  int randSevenByFive() {
    int v = 21;
    while(v > 20)
      v = randFive() + randFive() * 5 - 6;
    return 1 + v % 7;
  }

}

