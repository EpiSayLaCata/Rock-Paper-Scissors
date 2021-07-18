import 'dart:math';

class UtilsFactory {
  /*
  This class is used to store any function that is somehow linked
  to Logic building. This is a singleton since we will use it everywhere.
  */

  int randomComputerImage() {
    var rand = new Random();
    var randNum = rand.nextInt(3);
    return (randNum + 1);
  }
}
