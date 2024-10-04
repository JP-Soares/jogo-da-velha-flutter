import 'dart:math';


class Game {
  List<String> tabuleiro = List.filled(9, "");
  List <int> combinacao = List.filled(3, 0);


  String player = 'X';
  int scoreX = 0;
  int scoreO = 0;
  int jogadas = 0;

  String playerWinner = '';
  bool winner = false;
  bool zebra = false;


  String gameMode;
  int difficult;


  Game(this.gameMode, this.difficult);

  changePlayer(){
    // return player = (player == 'X') ? 'O' : 'X';
    if(player == 'X'){
      return player = 'O';
    }else if(player == 'O'){
      return player = 'X';
    }

  }

  newGame(){
    scoreX = 0;
    scoreO = 0;
    restart();
  }

  restart(){
    tabuleiro = List.filled(9, '');//reiniciando o tabuleiro
    combinacao = List.filled(3, 0);
    jogadas = 0;
    player = 'X';
    winner = false;
    zebra = false;
    playerWinner = '';
  }

  winGame(){
    jogadas++;

    for(int i = 0; i < 3; i++) { // Verifica as linhas
      if (tabuleiro[i * 3] == tabuleiro[i * 3 + 1] && tabuleiro[i * 3] == tabuleiro[i * 3 + 2] && tabuleiro[i * 3] != '') {
        combinacao = [i * 3, i * 3 + 1, i * 3 + 2];
        playerWinner = tabuleiro[i * 3];
        score(playerWinner);
        winner = true;
      }
    }

    for(int j = 0; j < 3; j++) { // Verifica as colunas
      if (tabuleiro[j] == tabuleiro[j + 3] && tabuleiro[j] == tabuleiro[j + 6] && tabuleiro[j] != '') {
        combinacao = [j, j + 3, j + 6];
        playerWinner = tabuleiro[j];
        score(playerWinner);
        winner = true;
      }
    }

    //verifica as diagonais
    if(tabuleiro[0] == tabuleiro[4] && tabuleiro[0] == tabuleiro[8] && tabuleiro[0] != '' && tabuleiro[4] != '' && tabuleiro[8] != ''){
      combinacao = [0, 4, 8];
      playerWinner = tabuleiro[0];
      score(playerWinner);
      winner = true;
    }

    if(tabuleiro[6] == tabuleiro[4] && tabuleiro[6] == tabuleiro[2] && tabuleiro[6] != '' && tabuleiro[4] != '' && tabuleiro[2] != ''){
      combinacao = [6, 4, 2];
      playerWinner = tabuleiro[0];
      score(playerWinner);
      winner = true;
    }

    if(jogadas == 9 && winner == false){
      zebra = true;
    }

    // for(int k = 0; k < 9; k++){
    //   if(tabuleiro[k] == 'X' || tabuleiro[k] == 'O' && winner == false){
    //     if(k == 9){
    //       print('Zebra');
    //     }
    //   }
    // }
  }

  score(String winner){
    // print(winner);
    if(winner == 'X'){
      print('X winner');
      return scoreX++;
    }else if(winner == 'O'){
      print('O winner');
      return scoreO++;
    }
  }


  robot(difficult){
    List<int> chooses = List.filled(9, 0);

    for(int i = 0; i < tabuleiro.length; i++){
      if(tabuleiro[i] == 'X' || tabuleiro[i] == 'O'){
        continue;
      }else{
        for(int j = 0; j < i; j++){
          chooses[j] = i;
        }
      }
    }

    Random random = Random();

    if(difficult == 0){

    }else if(difficult == 1){

    }else if(difficult == 2){

    }else{
      return;
    }
  }
}