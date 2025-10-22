// import 'player.dart';
// import 'quiz.dart';

// class Game {
//   List<Player> players = [];
//   Quiz quiz;

//   Game({required this.quiz});

//   Player getPlayer(String name) {
//     for (var player in players) {
//       if (player.name == name) {
//         return player;
//       }
//     }
//     Player newPlayer = Player(name: name);
//     players.add(newPlayer);
//     return newPlayer;
//   }

//   void submitPlayerScore(Player player, int score) {
//     player.score = score;
//   }

//   Map<String, int> getAllPlayerScores() {
//     Map<String, int> scores = {};
//     for (var player in players) {
//       scores[player.name] = player.score;
//     }
//     return scores;
//   }
// }