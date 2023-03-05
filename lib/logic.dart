// ignore_for_file: non_constant_identifier_names

import 'dart:math';

class Player {
  static const x = 'X';
  static const o = 'O';
  static const empty = '';
  static List<int> playerX = [];
  static List<int> playerO = [];
}

extension ContainAll on List {
  bool containsall(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Game {
  void playgame(int index, String activeplayer) {
    if (activeplayer == 'x') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  checkWiner() {
    String Winner = '';
    if (Player.playerX.containsall(0, 1, 2) ||
        Player.playerX.containsall(3, 4, 5) ||
        Player.playerX.containsall(6, 7, 8) ||
        Player.playerX.containsall(0, 3, 6) ||
        Player.playerX.containsall(1, 4, 7) ||
        Player.playerX.containsall(2, 5, 8) ||
        Player.playerX.containsall(0, 4, 8) ||
        Player.playerX.containsall(2, 4, 6)) Winner = 'x';

    if (Player.playerX.containsall(0, 1, 2) ||
        Player.playerO.containsall(3, 4, 5) ||
        Player.playerO.containsall(6, 7, 8) ||
        Player.playerO.containsall(0, 3, 6) ||
        Player.playerO.containsall(1, 4, 7) ||
        Player.playerO.containsall(2, 5, 8) ||
        Player.playerO.containsall(0, 4, 8) ||
        Player.playerO.containsall(2, 4, 6)) {
      Winner = 'o';
    } else {
      Winner = '';
    }

    return Winner;
  }

  Future<void> autoplay(activelayer) async {
    int index = 0;
    List<int> emptycell = [];
    for (var i = 0; i <= 9; i++) {
      // if playerx not contains about value of i
      // if ((!Player.playerX.contains(i)|| !Player.playerO.contains(i))) {}
      if ((Player.playerX.isEmpty || !Player.playerX.contains(i)) &&
          (Player.playerO.isEmpty || !Player.playerO.contains(i))) {
        emptycell.add(i);
      }
    }
    Random random = Random();
    int randomintex = random.nextInt(emptycell.length);
    index = emptycell[randomintex];
    playgame(index, activelayer);
  }
}
