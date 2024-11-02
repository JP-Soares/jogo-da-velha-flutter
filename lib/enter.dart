import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jogovelha/choose_game.dart';

class Enter extends StatefulWidget {
  const Enter({super.key});
  @override
  _EnterState createState() => _EnterState();
}

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();

  var selectedIdioma = 'ENG'.obs; // Usar um Observable para reatividade
  var textTitle = ''.obs;
  var textButton = ''.obs;
  var textButtonEnter = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _updateTexts(); // Atualiza os textos quando o controlador é inicializado

    // Ouça mudanças na variável `selectedIdioma`
    ever(selectedIdioma, (_) => _updateTexts());
  }

  void _updateTexts() {
    switch (selectedIdioma.value) {
      case 'PT-BR':
        textTitle.value = 'SELECIONE O IDIOMA';
        textButton.value = 'CONCLUÍDO';
        textButtonEnter.value = 'Jogar!';
        break;
      case 'ENG':
        textTitle.value = 'SELECT THE LANGUAGE';
        textButton.value = 'CONFIRM';
        textButtonEnter.value = 'Play Game!';
        break;
      case 'ESP':
        textTitle.value = 'SELECCIONE EL IDIOMA';
        textButton.value = 'COMPLETADO';
        textButtonEnter.value = '¡JUGAR!';
        break;
      default:
        textTitle.value = 'SELECT THE LANGUAGE';
        textButton.value = 'CONFIRM';
        textButtonEnter.value = 'Play Game!';
    }
  }

  // Método para mudar o idioma
  void changeLanguage(String newIdioma) {
    selectedIdioma.value = newIdioma;
  }
}

class _EnterState extends State<Enter> {
  final idiomas = ['PT-BR', 'ENG', 'ESP'];
  final controller = Get.put(LanguageController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      alertIdioma();
    });
  }

  void alertIdioma() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Obx(() => Text(
                controller.textTitle.value,
                style: TextStyle(
                    fontSize: 32, fontFamily: 'Chakra', color: Colors.blue),
              )),
          content: DropdownButtonFormField<String>(
            icon: Icon(Icons.language),
            hint: Text('SELECT THE LANGUAGE'),
            value: controller.selectedIdioma.value.isEmpty
                ? null
                : controller.selectedIdioma.value,
            onChanged: (String? escolha) {
              if (escolha != null) {
                controller
                    .changeLanguage(escolha); // Atualiza o idioma e os textos
              }
            },
            items: idiomas.map((opcao) {
              return DropdownMenuItem(
                value: opcao,
                child: Text(opcao),
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Obx(() => Text(
                    controller
                        .textButton.value, // Use Obx para o texto do botão
                    style: TextStyle(
                        fontFamily: 'Chakra',
                        color: Colors.green,
                        fontSize: 20),
                  )),
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ChooseGame(
                          controller.selectedIdioma.value,
                        )));
              },
              child: Obx(() => Text(
                    controller.textButtonEnter.value,
                    style: TextStyle(
                        fontFamily: 'Chakra',
                        color: Colors.black,
                        fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
