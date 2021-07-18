import 'package:rock_paper_scissors/pages/home.dart';

List resetGame() {
  computerRandomIndex = 0;
  playerTappedIndex = 0;
  numberGames = 0;
  playerScore = 0;
  iaScore = 0;

  return [
    computerRandomIndex,
    playerTappedIndex,
    numberGames,
    playerScore,
    iaScore
  ];
}
