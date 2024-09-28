class Game {
  List<String> tabuleiro = List.filled(9, "");

  String player = 'X';
  int scoreX = 0;
  int scoreO = 0;

  String playerWinner = '';
  bool winner = false;

  changePlayer(){
    return player = (player == 'X') ? 'O' : 'X';
  }

  newGame(){
    scoreX = 0;
    scoreO = 0;
    restart();
  }

  restart(){
    print("restart");
    tabuleiro = List.filled(9, '');//reiniciando o tabuleiro
    player = 'X';
    winner = false;
  }

  winGame(){
    for(int i = 0; i < 3; i++) { // Verifica as linhas
      if (tabuleiro[i * 3] == tabuleiro[i * 3 + 1] && tabuleiro[i * 3] == tabuleiro[i * 3 + 2] && tabuleiro[i * 3] != '') {
        playerWinner = tabuleiro[i];
        score(tabuleiro[i]);
        winner = true;
      }
    }

    for(int j = 0; j < 3; j++) { // Verifica as colunas
      if (tabuleiro[j] == tabuleiro[j + 3] && tabuleiro[j] == tabuleiro[j + 6] && tabuleiro[j] != '') {
        playerWinner = tabuleiro[j];
        score(tabuleiro[j]);
        winner = true;
      }
    }

    //verifica as diagonais
    if(tabuleiro[0] == tabuleiro[4] && tabuleiro[0] == tabuleiro[8] && tabuleiro[0] != '' && tabuleiro[4] != '' && tabuleiro[8] != ''){
      playerWinner = tabuleiro[0];
      score(tabuleiro[0]);
      winner = true;
    }

    if(tabuleiro[6] == tabuleiro[4] && tabuleiro[6] == tabuleiro[2] && tabuleiro[6] != '' && tabuleiro[4] != '' && tabuleiro[2] != ''){
      playerWinner = tabuleiro[0];
      score(tabuleiro[6]);
      winner = true;
    }

    for(int k = 0; k < 9; k++){
      if(tabuleiro[k] == 'X' || tabuleiro[k] == 'O' && winner == false){
        if(k == 9){
          print('Zebra');
        }
      }
    }
  }

  score(String winner){
    print(winner);
    if(winner == 'X'){
      return scoreX++;
    }else{
      return scoreO++;
    }
  }
}