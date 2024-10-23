import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jogovelha/choose_game.dart';

import 'package:jogovelha/game.dart';

class ScreenGame extends StatefulWidget{
  final String gameMode;
  final int difficult;
  final String idioma;

  const ScreenGame(this.idioma, this.gameMode, this.difficult, {Key? key}) : super(key: key);

    @override
    State<StatefulWidget> createState(){
      return ScreenGameState();
    }
}

class ScreenGameState extends State<ScreenGame>{

  List<String> textJogador = [];//texto do placar
  List<String> textTitlePop = [];//texto do título do pop up de quem ganhou
  String titleWin = '';//texto do resultado vencedor
  String textButton1 = '';//texto do botão restart
  String textButton2 = '';//texto do botão new game


  late Game game; // Declare a variável do tipo Game
  bool mostrarLinha = false;

  @override
  void initState() {
    super.initState();

    if(widget.idioma == 'PT-BR'){
      textJogador = ['Jogador 1', 'Jogador 2'];
      textTitlePop = ['VENCEU!', 'EMPATE!'];
      titleWin = 'FIM DE JOGO!';
      textButton1 = 'REINICIAR';
      textButton2 = 'NOVO JOGO';
    }else if(widget.idioma == 'ENG'){
      textJogador = ['Player 1', 'Player 2'];
      textTitlePop = ['WINS!','DRAW!'];
      titleWin = 'GAME OVER!';
      textButton1 = 'RESTART';
      textButton2 = 'NEW GAME';
    }else if(widget.idioma == 'ESP'){
      textJogador = ['Jugador 1', 'Jugador 2'];
      textTitlePop = ['¡GANA!','¡EMPATE!'];
      titleWin = '¡FIN DEL JUEGO!';
      textButton1 = 'REINICIAR';
      textButton2 = 'NUEVO JUEGO';
    }else{
      textJogador = ['Player 1', 'Player 2'];
      textTitlePop = ['WINS!', 'DRAW!'];
      titleWin = 'GAME OVER!';
      textButton1 = 'RESTART';
      textButton2 = 'NEW GAME';
    }

    // Inicializa a variável 'game' com os valores recebidos
    game = Game(widget.gameMode, widget.difficult);
  }



  List<Color> colorPlayer = List.generate(9, (index) => Colors.black);
  int jogadaRobot = 0;


  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Column( mainAxisAlignment: MainAxisAlignment.center, children: [
      
      placar(),
        
      Center( // tabuleiro
        child: SizedBox(
          height: 500,
          child: Stack(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // Malha do tabuleiro
                  crossAxisCount: 3, // número de colunas
                  childAspectRatio: 1.0, // espaço entre as células
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                     if(game.tabuleiro[index] == '' && game.player == 'X'){
                       _playerMove(index); // Chama a função para a jogada do jogador
                     }else{
                      return;
                     }
                    },
                    // tabuleiro
                    child: Container(
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          game.tabuleiro[index],
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Coiny',
                            color: colorPlayer[index],
                          ),
                        ),
                      ),
                    ),
                  ); // Mova este ponto e vírgula para cá
                },
              ),
            ],
          ),
        ),
      ),

        ElevatedButton(
          onPressed: (){
             setState(() {
              mostrarLinha = false;
              game.restart();
              game.newGame();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ChooseGame(widget.idioma)));
             });
          },
          child: Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/img/home.svg', width: 40, height: 40),
            ],
          ), style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen, minimumSize: Size(30,30)),
        ),
    ],),
    );
  }

  //muda a cor do tabuleiro
  Color mudarCor(String player){
    if (game.player == 'X') {
        return Colors.red;
    }else {
      return Colors.blue; // Ou você pode usar Colors.black se for 'O'
    }
  }





  void _makeRobotMove() async {
    await Future.delayed(Duration(seconds: 1));
    if(game.winner == false && game.zebra == false){
      int jogadaRobot = game.robot(game.difficult);// Delay de 1 segundo
    
      setState(() {
        game.tabuleiro[jogadaRobot] = game.player; // O robô joga
        colorPlayer[jogadaRobot] = mudarCor(game.player);
        game.changePlayer();
        game.winGame();// Verifica se houve um vencedor após a jogada do robô
        if (game.winner) {
          mostrarLinha = true;
          alerta(context);
        } else if (game.zebra) {
          alerta(context);
        }
      });
    }
  }



  void _playerMove(int index) {
  if (game.tabuleiro[index] == "X" || game.tabuleiro[index] == "O") {
    return; // Verifica se o espaço clicado está preenchido
  } else {
    setState(() {
      if (game.gameMode == 'p') { // Jogador contra jogador
        game.tabuleiro[index] = game.changePlayer();
        colorPlayer[index] = mudarCor(game.player);
      } else if (game.gameMode == 'r') { // Jogador contra computador
        if (game.player == 'X') {
          game.tabuleiro[index] = game.player;
          colorPlayer[index] = mudarCor(game.player);
          game.changePlayer();
          if(game.winner == false){
            _makeRobotMove();
          }
        }
      }

      game.winGame(); // Verifica se houve um vencedor
      if (game.winner) {
        mostrarLinha = true;
        alerta(context);
      } else if (game.zebra) {
        alerta(context);
      }
    });
  }
}


  //gera o placar
  placar(){
    return Container(//placar
        child: Column(children: [
        const SizedBox(height: 100,),//distância da primeira lnha do placar para o topo da página
        Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textJogador[0], style: const TextStyle(fontSize: 24, fontFamily: 'Coiny', color: Colors.red)),
            const SizedBox(width: 100,),
            Text(textJogador[1], style: const TextStyle(fontSize: 24, fontFamily: 'Coiny', color: Colors.blue)),
          ],
          ),
          const SizedBox(height: 20,),//distância entre as duas linhas do placar
          Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "X: ",
                    style: TextStyle(fontSize: 24, fontFamily: 'Coiny', color: Colors.red),
                  ),

                  TextSpan(
                    text: '${game.scoreX}',
                    style: TextStyle(fontSize: 24, fontFamily: 'Coiny', color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 90),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${game.scoreO}',
                    style: TextStyle(fontSize: 24, fontFamily: 'Coiny', color: Colors.black),
                  ),

                  TextSpan(
                    text: ' :O',
                    style: TextStyle(fontSize: 24, fontFamily: 'Coiny', color: Colors.blue),
                  ),
                ],
              ),
            ),
            
          ],
          ),
        ],),
      );
  }


  alerta(BuildContext context){//alerta do resultado final

    Color colorText = Colors.black;
    if(game.playerWinner == 'X'){
      colorText = Colors.red;
    }else if(game.playerWinner == 'O'){
      colorText = Colors.blue;
    }

    String text = '';

    if(game.winner == true){
      text = '${game.playerWinner} ${textTitlePop[0]}';
    }else{
      colorText = Colors.lightGreen;
      text = textTitlePop[1];
    }


    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){

      return
      AlertDialog(
        title: Text('${text}', textAlign: TextAlign.center, style: TextStyle(color: colorText, fontFamily: 'Coiny'),),
        content: Text(titleWin, textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Coiny'),),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState((){
                game.restart();  
              });
              Navigator.pop(context);
            },
            child: Text(textButton1, style: TextStyle(fontFamily: 'Coiny')),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState((){
                game.newGame();
              });
            },
            child: Text(textButton2, style: TextStyle(fontFamily: 'Coiny')),
          ),
        ],
      );
    });
  }
}


//linha para destacar a combinação vencedora
class Linha extends CustomPainter {
  final List<int> winningLine;
  final double cellSize;

  Linha(this.winningLine, this.cellSize);//construtor

  @override
  void paint(Canvas canvas, Size size) {
    if (winningLine.isNotEmpty) {
      final paint = Paint()
        ..color = Colors.red
        ..strokeWidth = 5;

      double x1 = (winningLine[0] % 3) * cellSize + cellSize / 2;
      double y1 = (winningLine[0] ~/ 3) * cellSize + cellSize / 2;
      double x2 = (winningLine[2] % 3) * cellSize + cellSize / 2;
      double y2 = (winningLine[2] ~/ 3) * cellSize + cellSize / 2;

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}