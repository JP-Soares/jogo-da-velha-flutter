import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jogovelha/gameScreen.dart';

class ChooseGame extends StatefulWidget {
  final String idioma;
  const ChooseGame(this.idioma, {Key? key}) : super(key: key);
  @override
  ChooseGameState createState() => ChooseGameState();
}

class ChooseGameState extends State<ChooseGame> {
  bool mostraMode = true;
  String gameMode = ''; //robot or player(r;p)
  int difficult = 0; //caso robot, dificuldade 0, 1, 2

  String textTitle1 = '';//texto do título
  String textTitle2 = '';//texto do título
  String textButton1 = '';//texto do botão 2 jogadores
  String textButton2 = '';//texto do botão robô
  List<String> textDifficult = [];//texto das dificuldades do robô

  @override
  void initState() {
    super.initState();
    gameMode = ''; // Redefinir para o padrão
    difficult = 0; // Redefinir para o padrão

    if(widget.idioma == 'PT-BR'){
      textTitle1 = 'Escolha o Modo!';
      textTitle2 = 'Escolha a Dificuldade!';
      textButton1 = 'DOIS JOGADORES';
      textButton2 = 'ROBÔ';
      textDifficult = ['FÁCIL', 'MÉDIO', 'DIFÍCIL'];
    }else if(widget.idioma == 'ENG'){
      textTitle1 = 'Choose the Mode!';
      textTitle2 = 'Choose the Difficult!';
      textButton1 = 'TWO PLAYERS';
      textButton2 = 'ROBOT';
      textDifficult = ['EASY', 'MEDIUM', 'HARD'];
    }else if(widget.idioma == 'ESP'){
      textTitle1 = '¡Elija el modo!';
      textTitle2 = '¡Elija lo difícil!';
      textButton1 = 'DOS JUGADORES';
      textButton2 = 'ROBOT';
      textDifficult = ['FACIL', 'MEDIO', 'DIFÍCIL'];
    }else{
      textTitle1 = 'Choose the Mode!';
      textTitle2 = 'Choose the Difficult!';
      textButton1 = 'TWO PLAYERS';
      textButton2 = 'ROBOT';
      textDifficult = ['EASY', 'MEDIUM', 'HARD'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mostraMode ? textTitle1 : textTitle2,
            style: TextStyle(fontSize: 32, fontFamily: 'Chakra'),
          ),
          SizedBox(
            height: 60,
          ),
          mostraMode
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                //btn dois jogadores
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    // color: Colors.lightBlue,
                                    // border: Border.all(color: Colors.lightBlue, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: ElevatedButton(
                                  onPressed: () {
                                    gameMode = 'p';
                                    difficult = 0;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => ScreenGame(
                                                widget.idioma, gameMode, difficult)));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/img/two.svg',
                                        width: 48,
                                        height: 48,
                                      )
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100, 100),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20), // Remove bordas arredondadas
                                      ),
                                      backgroundColor: Colors.lightBlue),
                                )),
                            Text(
                              textButton1,
                              style:
                                  TextStyle(fontSize: 16, fontFamily: 'Chakra'),
                            ),
                          ]),
                      SizedBox(width: 20), //espaço horizontal entre os itens

                      Column(children: [
                        Container(
                          //btn robô

                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                              // color: Colors.lightBlue,
                              // border: Border.all(color: Colors.lightBlue, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                mostraMode = false;
                                gameMode = 'r';
                                difficult = 0;
                              });
                              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ScreenGame(gameMode, difficult)));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/img/robot.svg',
                                  width: 48,
                                  height: 48,
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(100, 100),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20), // Remove bordas arredondadas
                                ),
                                backgroundColor: Colors.lightBlue),
                          ),
                        ),
                        Text(
                          textButton2,
                          style: TextStyle(fontSize: 16, fontFamily: 'Chakra'),
                        ),
                      ]),
                    ],
                  ),
                )
              : Container(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    // color: Colors.lightBlue,
                                    // border: Border.all(color: Colors.lightBlue, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: ElevatedButton(
                                  onPressed: () {
                                    gameMode = 'r';
                                    difficult = 0;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => ScreenGame(
                                                widget.idioma, gameMode, difficult)));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/img/star.svg',
                                        width: 32,
                                        height: 32,
                                      )
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100, 100),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20), // Remove bordas arredondadas
                                      ),
                                      backgroundColor: Colors.lightBlue),
                                )),
                            Text(
                              textDifficult[0],
                              style:
                                  TextStyle(fontSize: 16, fontFamily: 'Chakra'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    // color: Colors.lightBlue,
                                    // border: Border.all(color: Colors.lightBlue, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: ElevatedButton(
                                  onPressed: () {
                                    gameMode = 'r';
                                    difficult = 1;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => ScreenGame(
                                                widget.idioma, gameMode, difficult)));
                                  },
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: SvgPicture.asset(
                                            'assets/img/star.svg',
                                            width: 32,
                                            height: 32),
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Ajuste o espaçamento se necessário
                                      Flexible(
                                        child: SvgPicture.asset(
                                            'assets/img/star.svg',
                                            width: 32,
                                            height: 32),
                                      ),
                                    ],
                                  )),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100, 100),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20), // Remove bordas arredondadas
                                      ),
                                      backgroundColor: Colors.lightBlue),
                                )),
                            Text(
                              textDifficult[1],
                              style:
                                  TextStyle(fontSize: 16, fontFamily: 'Chakra'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    // color: Colors.lightBlue,
                                    // border: Border.all(color: Colors.lightBlue, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: ElevatedButton(
                                  onPressed: () {
                                    gameMode = 'r';
                                    difficult = 2;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => ScreenGame(
                                                widget.idioma, gameMode, difficult)));;
                                  },
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: SvgPicture.asset(
                                            'assets/img/star.svg',
                                            width: 32,
                                            height: 32),
                                      ),
                                      Flexible(
                                          child: SvgPicture.asset(
                                        'assets/img/star.svg',
                                        width: 32,
                                        height: 32,
                                      )),
                                      Flexible(
                                          child: SvgPicture.asset(
                                        'assets/img/star.svg',
                                        width: 32,
                                        height: 32,
                                      )),
                                    ],
                                  )),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100, 100),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20), // Remove bordas arredondadas
                                      ),
                                      backgroundColor: Colors.lightBlue),
                                )),
                            Text(
                              textDifficult[2],
                              style:
                                  TextStyle(fontSize: 16, fontFamily: 'Chakra'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 300,
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => ChooseGame(widget.idioma)));
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/img/home.svg',
                              width: 40, height: 40),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          minimumSize: Size(30, 30)),
                    ),
                  ],
                )),
        ],
      ),
    ));
  }
}
