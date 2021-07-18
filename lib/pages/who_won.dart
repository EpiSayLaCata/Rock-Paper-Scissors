import 'package:rock_paper_scissors/pages/home.dart';

List whoWon(int iaIndex, int playerIndex) {
  numberGames++;

  if (iaIndex == playerIndex) {
  } else {
    if (iaIndex == 1) {
      if (playerIndex == 2) {
        playerScore++;
      } else {
        iaScore++;
      }
    } else if (iaIndex == 2) {
      if (playerIndex == 1) {
        iaScore++;
      } else {
        playerScore++;
      }
    } else {
      if (playerIndex == 1) {
        playerScore++;
      } else {
        iaScore++;
      }
    }
  }

  return [playerScore, iaScore];
}
