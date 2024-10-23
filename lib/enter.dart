import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogovelha/choose_game.dart';

class Enter extends StatefulWidget {
  const Enter({super.key});
  @override
  _EnterState createState() => _EnterState();
}

class _EnterState extends State<Enter> {
  final idiomas = ['PT-BR', 'ENG', 'ESP'];
  final selectedIdioma =
      ValueNotifier(''); //para atualizar o estado do selecionado
  String textTitle = '';
  String textButton = '';
  String textButtonEnter = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      alertIdioma();
    });
  }

  void alertIdioma() {

    setState((){
      if(selectedIdioma.value == 'PT-BR'){
        textTitle = 'SELECIONE O IDIOMA';
        textButton = 'CONCLUÍDO';
        textButtonEnter = 'Jogar!';
      }else if(selectedIdioma.value == 'ENG'){
        textTitle = 'SELECT THE LANGUAGE';
        textButton = 'CONFIRM';
        textButtonEnter = 'Play Game!';
      }else if(selectedIdioma.value == 'ESP'){
        textTitle = 'SELECCIONE EL IDIOMA';
        textButton = 'COMPLETADO';
        textButtonEnter = '¡JUGAR!';
      }else{
        textTitle = 'SELECT THE LANGUAGE';
        textButton = 'CONFIRM';
        textButtonEnter = 'Play Game!';
      }
    });

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            textTitle.toString(),
            style: TextStyle(fontSize: 32, fontFamily: 'Chakra', color: Colors.blue),
          ),
          content: ValueListenableBuilder<String>(
            valueListenable: selectedIdioma,
            builder: (BuildContext context, String value, _) {
              return DropdownButtonFormField<String>(
                icon: Icon(Icons.language),
                hint: Text('ENG'),
                value: (value.isEmpty) ? null : value,

                onChanged: (String? escolha) {
                  setState(() {
                    selectedIdioma.value = escolha.toString();
                    Navigator.of(context).pop();
                    alertIdioma();
                  });
                },
                items: idiomas
                    .map((opcao) =>
                        DropdownMenuItem(value: opcao, child: Text(opcao)))
                    .toList(), // Define o valor selecionado
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text(textButton, style: TextStyle(
                    fontFamily: 'Chakra', color: Colors.green, fontSize: 20)),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.lightGreen[50],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "TIC",
                  style: TextStyle(
                      fontSize: 40, fontFamily: 'Chakra', color: Colors.blue),
                ),
                SizedBox(
                  width: 20,
                ),
                const Text(
                  "TAC",
                  style: TextStyle(
                      fontSize: 40, fontFamily: 'Chakra', color: Colors.red),
                ),
                SizedBox(
                  width: 20,
                ),
                const Text(
                  "TOE",
                  style: TextStyle(
                      fontSize: 40, fontFamily: 'Chakra', color: Colors.green),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ChooseGame(selectedIdioma.value)));
              },
              child: Text(
                textButtonEnter,
                style: TextStyle(
                    fontFamily: 'Chakra', color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
