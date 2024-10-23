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
      playerWinner = tabuleiro[6];
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
    List<int> chooses = [];
    int jogada = 0;
    List<int> jogado = [];

    if(difficult == 0){//fácil

      for(int i = 0; i < tabuleiro.length; i++){
        if(tabuleiro[i] != 'X' && tabuleiro[i] != 'O'){
          chooses.add(i);
        }
      }

      if(chooses.isEmpty){
        return null;
      }

      Random random = Random();

      jogada = chooses[random.nextInt(chooses.length)];
      return jogada;
    }
    
    
    else if(difficult == 1){//médio
      for(int i = 0; i < tabuleiro.length; i++){
        if(tabuleiro[i] != 'X' && tabuleiro[i] != 'O'){
          chooses.add(i);
        }else if(tabuleiro[i] == 'X' && tabuleiro[i] == 'O'){
          jogado.add(i);
        }
      }

      for(int j = 0; j < 9; j += 3){
        if(tabuleiro[j] == 'X' && tabuleiro[j + 1] == 'X' && tabuleiro == ''){
          return jogada = j + 2;
        }
      }

      for(int k = 0; k < 3; k++){//colunas
        if(tabuleiro[k] == 'X' && tabuleiro[k + 3] == 'X' && tabuleiro[k + 6] == ''){
          print("coluna");
          return jogada = k + 6;
        }
      }

      // Verificar diagonais
      if (tabuleiro[0] == 'X' && tabuleiro[4] == 'X' && tabuleiro[8] == '') {
        return jogada = 8;
      } else if (tabuleiro[0] == 'X' && tabuleiro[8] == 'X' && tabuleiro[4] == '') {
        return jogada = 4;
      } else if (tabuleiro[4] == 'X' && tabuleiro[8] == 'X' && tabuleiro[0] == '') {
        return jogada = 0;
      }else if (tabuleiro[4] == 'X' && tabuleiro[6] == 'X' && tabuleiro[2] == '') {
        return jogada = 2;
      }else if (tabuleiro[4] == 'X' && tabuleiro[2] == 'X' && tabuleiro[6] == '') {
        return jogada = 6;
      }

      if(tabuleiro[4] == ''){//se o meio estiver vazio
        return jogada = 4;
      }

      if(chooses.isNotEmpty){
        Random random = Random();
        return jogada = chooses[random.nextInt(chooses.length)];
      }




    }else if(difficult == 2){//difícil

      //para atacar
      for(int j = 0; j < 9; j += 3){//linhas
        if(tabuleiro[j] == 'O' && tabuleiro[j + 1] == 'O' && tabuleiro[j + 2] == ''){//verifica as linhas
          return jogada = j + 2;
        }
      }

      for(int k = 0; k < 3; k++){//colunas
        if(tabuleiro[k] == 'O' && tabuleiro[k + 3] == 'O' && tabuleiro[k + 6] == ''){
          return jogada = k + 6;
        }else if(tabuleiro[k] == '' && tabuleiro[k + 3] == 'O' && tabuleiro[k + 6] == 'O'){
          return jogada = k;
        }
      }



      //para defender
      for(int i = 0; i < tabuleiro.length; i++){
        if(tabuleiro[i] != 'X' && tabuleiro[i] != 'O'){
          chooses.add(i);
        }else if(tabuleiro[i] == 'X' && tabuleiro[i] == 'O'){
          jogado.add(i);
        }
      }

      for(int j = 0; j < 9; j += 3){//linhas
        if(tabuleiro[j] == 'X' && tabuleiro[j + 1] == 'X' && tabuleiro[j + 2] == ''){
          print('linhas');
          return jogada = j + 2;
        }
      }

      for(int k = 0; k < 3; k++){//colunas
        if(tabuleiro[k] == 'X' && tabuleiro[k + 3] == 'X' && tabuleiro[k + 6] == ''){
          print("coluna");
          return jogada = k + 6;
        }else if(tabuleiro[k] == '' && tabuleiro[k + 3] == 'X' && tabuleiro[k + 6] == 'X'){
          return jogada = k;
        }
      }

      // Verificar diagonais
      if (tabuleiro[0] == 'X' && tabuleiro[4] == 'X' && tabuleiro[8] == '') {
        return jogada = 8;
      } else if (tabuleiro[0] == 'X' && tabuleiro[8] == 'X' && tabuleiro[4] == '') {
        return jogada = 4;
      } else if (tabuleiro[4] == 'X' && tabuleiro[8] == 'X' && tabuleiro[0] == '') {
        return jogada = 0;
      }else if (tabuleiro[4] == 'X' && tabuleiro[6] == 'X' && tabuleiro[2] == '') {
        return jogada = 2;
      }else if (tabuleiro[4] == 'X' && tabuleiro[2] == 'X' && tabuleiro[6] == '') {
        return jogada = 6;
      }else if(tabuleiro[0] == '' && tabuleiro[4] == 'O' && tabuleiro[8] == 'O'){
        return jogada = 0;
      }else if(tabuleiro[6] == 'O' && tabuleiro[4] == 'O' && tabuleiro[2] == ''){
        return jogada = 2;
      }

      if(tabuleiro[4] == ''){//se o meio estiver vazio
        return jogada = 4;
      }

      else if(chooses.isNotEmpty){
        if(tabuleiro[0] == 'X' && tabuleiro[6] == 'X' && tabuleiro[3] == ''){
          return jogada = 3;
        }else if(tabuleiro[0] == 'X' && tabuleiro[2] == 'X' && tabuleiro[1] == ''){
          return jogada = 1;
        }else if(tabuleiro[2] == 'X' && tabuleiro[8] == 'X' && tabuleiro[5] == ''){
          return jogada = 5;
        }else if(tabuleiro[6] == 'X' && tabuleiro[8] == 'X' && tabuleiro[7] == ''){
          return jogada = 7;
        }else if(tabuleiro[3] == 'X' && tabuleiro[4] == 'X' && tabuleiro[5] == ''){
          return jogada = 5;
        }else if(tabuleiro[0] == '' && tabuleiro[2] == 'X' && tabuleiro[1] == 'X'){//para jogar nos cantos
          return jogada = 0;
        }else if(tabuleiro[2] == '' && tabuleiro[8] == 'X' && tabuleiro[5] == 'X'){
          return jogada = 2;
        }else if(tabuleiro[6] == ''&& tabuleiro[8] == 'X' && tabuleiro[7] == 'X'){
          return jogada = 6;
        }else if(tabuleiro[0] == 'X' && tabuleiro[2] == 'X' && tabuleiro[1] == ''){
          return jogada = 1;
        }else if(tabuleiro[8] == ''){
          return jogada = 8;
        }else if(tabuleiro[4] == ''){
          return jogada = 4;
        }else if(tabuleiro[3] == ''){
          return jogada = 3;
        }else if(tabuleiro[7] == ''){
          return jogada = 7;
        }else if(tabuleiro[6] == ''){
          return jogada = 6;
        }
      }
    }else{
      return;
    }
  }
}