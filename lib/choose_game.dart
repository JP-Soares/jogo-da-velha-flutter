import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jogovelha/gameScreen.dart';


class ColorController extends GetxController{
  static ColorController get to => Get.find();

  var selectedColorX = Rx<ColorLabel?>(null); //cor para o player x
  var selectedColorO = Rx<ColorLabel?>(null); //cor para o player o
}


enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  orange('Orange', Colors.orange),
  red('Red', Colors.red),
  purple('Purple', Colors.purple);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

class ChooseGame extends StatefulWidget {
  final String idioma;
  const ChooseGame(this.idioma, {Key? key}) : super(key: key);
  @override
  ChooseGameState createState() => ChooseGameState();
}

class ChooseGameState extends State<ChooseGame> {

  final ColorController controller = Get.put(ColorController());

  bool mostraMode = true;
  String gameMode = ''; //robot or player(r;p)
  int difficult = 0; //caso robot, dificuldade 0, 1, 2

  String textTitle1 = ''; //texto do título
  String textTitle2 = ''; //texto do título
  String textTitle3 = ''; //texto do título para escolher cor
  String textButton1 = ''; //texto do botão 2 jogadores
  String textButton2 = ''; //texto do botão robô
  String textButton3 = ''; //texto do botão de concluir das cores
  List<String> textPlayer = []; //texto dos jogadores para escolher as cores
  List<String> textDifficult = []; //texto das dificuldades do robô
  List<String> textColors = []; //texto das cores

  @override
  void initState() {
    super.initState();
    ColorLabel? selectedColorX = controller.selectedColorX.value;
    ColorLabel? selectedColorO = controller.selectedColorO.value;
    gameMode = ''; // Redefinir para o padrão
    difficult = 0; // Redefinir para o padrão

    if (widget.idioma == 'PT-BR') {
      textTitle1 = 'Escolha o Modo!';
      textTitle2 = 'Escolha a Dificuldade!';
      textTitle3 = 'Escolha a cor!';
      textColors = ['VERMELHO', 'AZUL', 'VERDE', 'ROSA', 'ROXO', 'AMARELO'];
      textButton1 = 'DOIS JOGADORES';
      textButton2 = 'ROBÔ';
      textDifficult = ['FÁCIL', 'MÉDIO', 'DIFÍCIL'];
      textButton3 = 'CONFIRMAR!';
      textPlayer = ['Jogador X', 'Jogador O'];
    } else if (widget.idioma == 'ENG') {
      textTitle1 = 'Choose the Mode!';
      textTitle2 = 'Choose the Difficult!';
      textTitle3 = 'Choose the color!';
      textColors = ['RED', 'BLUE', 'GREEN', 'PINK', 'PURPLE', 'YELLOW'];
      textButton1 = 'TWO PLAYERS';
      textButton2 = 'ROBOT';
      textDifficult = ['EASY', 'MEDIUM', 'HARD'];
      textButton3 = 'CONFIRM!';
      textPlayer = ['Player X', 'Player O'];
    } else if (widget.idioma == 'ESP') {
      textTitle1 = '¡Elija el modo!';
      textTitle2 = '¡Elija lo difícil!';
      textButton3 = '¡Elige el color!';
      textButton1 = 'DOS JUGADORES';
      textColors = ['ROJO', 'AZUL', 'VERDE', 'ROSADO', 'MORADO', 'AMARILLO'];
      textButton2 = 'ROBOT';
      textDifficult = ['FACIL', 'MEDIO', 'DIFÍCIL'];
      textButton3 = '¡COMPLETADO!';
      textPlayer = ['Jugador X', 'Jugador O'];
    } else {
      textTitle1 = 'Choose the Mode!';
      textTitle2 = 'Choose the Difficult!';
      textTitle3 = 'Choose the color!';
      textButton1 = 'TWO PLAYERS';
      textButton2 = 'ROBOT';
      textColors = ['RED', 'BLUE', 'GREEN', 'PINK', 'PURPLE', 'YELLOW'];
      textDifficult = ['EASY', 'MEDIUM', 'HARD'];
      textButton3 = 'CONFIRM!';
      textPlayer = ['Player X', 'Player O'];
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
                                    alertColor();
                                    // Navigator.of(context).pushReplacement(
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ScreenGame(
                                    //             widget.idioma, gameMode, difficult)));
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
                                    alertColor();
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
                                    alertColor();
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
                                    alertColor();
                                    ;
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
                                  builder: (context) =>
                                      ChooseGame(widget.idioma)));
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

  alertColor() {
    print('oi');
    print(textTitle3);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              // title: Text(textTitle3,
              //     style: TextStyle(
              //         fontFamily: 'Chakra', color: Colors.blue, fontSize: 20)),
              //content: ValueListenableBuilder<ColorLabel?>(valueListenable: selectedColor, builder: (BuildContext context, String value, _){
              child: Container(
            height: 350,
            width: 1000,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(textTitle3,
                      style: TextStyle(
                          fontFamily: 'Chakra',
                          color: Colors.blue,
                          fontSize: 20)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //player x
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Obx(()=>Text(textPlayer[0],
                                  style: TextStyle(
                                      fontFamily: 'Chakra',
                                      color:
                                          controller.selectedColorX.value?.color ?? Colors.red,
                                      fontSize: 20))), //player x
                              SizedBox(width: 50),

                              DropdownMenu<ColorLabel>(
                                //color X player
                                initialSelection:
                                    controller.selectedColorX.value ?? ColorLabel.red,
                                //controller: colorController,
                                // requestFocusOnTap is enabled/disabled by platforms when it is null.
                                // On mobile platforms, this is false by default. Setting this to true will
                                // trigger focus request on the text field and virtual keyboard will appear
                                // afterward. On desktop platforms however, this defaults to true.
                                requestFocusOnTap: false,
                                //label: const Text('Color'),
                                onSelected: (ColorLabel? color) {
                                  setState(() {
                                    controller.selectedColorX.value = color;
                                  });
                                },
                                dropdownMenuEntries: ColorLabel.values
                                    .map<DropdownMenuEntry<ColorLabel>>(
                                        (ColorLabel color) {
                                  return DropdownMenuEntry<ColorLabel>(
                                    value: color,
                                    label: color.label,
                                    //enabled: color.label != 'Red',
                                    style: MenuItemButton.styleFrom(
                                      foregroundColor: color.color,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //player o
                        Center(
                          child: Column(
                            children: [
                              Obx(()=>Text(textPlayer[1],
                                  style: TextStyle(
                                      fontFamily: 'Chakra',
                                      color:
                                          controller.selectedColorO.value?.color ?? Colors.blue,
                                      fontSize: 20))), //player o

                              DropdownMenu<ColorLabel>(
                                //color O player
                                initialSelection:
                                    controller.selectedColorO.value ?? ColorLabel.blue,
                                //controller: colorController,
                                // requestFocusOnTap is enabled/disabled by platforms when it is null.
                                // On mobile platforms, this is false by default. Setting this to true will
                                // trigger focus request on the text field and virtual keyboard will appear
                                // afterward. On desktop platforms however, this defaults to true.
                                requestFocusOnTap: false,
                                //label: const Text('Color'),
                                onSelected: (ColorLabel? color) {
                                  controller.selectedColorO.value = color;
                                },
                                dropdownMenuEntries: ColorLabel.values
                                    .map<DropdownMenuEntry<ColorLabel>>(
                                        (ColorLabel color) {
                                  return DropdownMenuEntry<ColorLabel>(
                                    value: color,
                                    label: color.label,
                                    //enabled: color.label != 'Blue',
                                    style: MenuItemButton.styleFrom(
                                      foregroundColor: color.color,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 80),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ScreenGame(
                              controller.selectedColorX.value?.color ?? Colors.red,
                              controller.selectedColorO.value?.color ?? Colors.blue,
                              widget.idioma,
                              gameMode,
                              difficult)));
                    },
                    child: Text(
                      textButton3,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Chakra',
                          color: Colors.green),
                    )),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close, color: Colors.red, size: 30),
                )
              ],
            ),
          ));
        });
  }
}
