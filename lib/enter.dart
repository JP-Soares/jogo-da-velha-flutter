import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogovelha/gameScreen.dart';

class Enter extends StatelessWidget{
  const Enter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Jogo da Velha", style: TextStyle(fontSize: 40, fontFamily: 'comic-sans'),),
      
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder:(context) => ScreenGame())
                );
              },
              child: const Text('Jogar!'),
            ),
          ],
        ),
      ),
    );
  }

  
}