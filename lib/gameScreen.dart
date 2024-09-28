import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:jogovelha/game.dart';

class ScreenGame extends StatefulWidget{
  const ScreenGame({super.key});

    @override
    State<StatefulWidget> createState(){
      return ScreenGameState();
    }
}

class ScreenGameState extends State<ScreenGame>{

  Game game = Game();
  List<Color> colorPlayer = List.generate(9, (index) => Colors.black);

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Column( children: [
      
      placar(),
        
      Center(//tabuleiro
          child:SizedBox(height:500, 
          child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(//Malha do tabuleiro
                crossAxisCount: 3,//número de colunas
                childAspectRatio: 1.0,//espaço entre as células
              ), itemCount: 9, itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      setState((){
                        // print('$index');
                        // print(game.changePlayer());
                        if(game.tabuleiro[index] == "X" || game.tabuleiro[index] == "O"){//verifica se o espaço clicado está preenchido ou não.
                          return;
                        }else{
                          game.tabuleiro[index] = game.changePlayer();//altera o texto do tabuleiro
                          colorPlayer[index] = mudarCor(game.player);
                        }
                      });
                      game.winGame();
                      if(game.winner == true){
                        alerta(context);
                      }
                    },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Center(
                      child: Text(game.tabuleiro[index],
                      style: TextStyle(fontSize: 32,
                      fontFamily: 'Coiny',
                      color: colorPlayer[index],)
                      ),
                    ),
                  ),
                );
              }
            ),
        )
        ),
        ElevatedButton(
          onPressed: (){
             setState(() {
               game.restart();
             });
          },
          child: const Text("Restart", 
            style: TextStyle(fontSize: 24, fontFamily: 'Coiny', color: Colors.green),),
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

  //gera o placar
  placar(){
    return Container(//placar
        child: Column(children: [
        const SizedBox(height: 100,),//distância da primeira lnha do placar para o topo da página
        Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("PLayer 1", style: const TextStyle(fontSize: 24, fontFamily: 'Coiny', color: Colors.red)),
            const SizedBox(width: 100,),
            Text("PLayer 2", style: const TextStyle(fontSize: 24, fontFamily: 'Coiny', color: Colors.blue)),
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
            const SizedBox(width: 90,),
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
    showDialog(
      context: context,
      builder: (BuildContext context){
      return
      AlertDialog(
        title: Text('${game.playerWinner} WINS!'),
        content: const Text('END GAME!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState((){
                game.restart();  
              });
              Navigator.pop(context);
            },
            child: const Text('Restart'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState((){
                game.newGame();
              });
            },
            child: const Text('New Game'),
          ),
        ],
      );
    });
  }
}