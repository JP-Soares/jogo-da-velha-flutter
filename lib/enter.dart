import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogovelha/choose_game.dart';

class Enter extends StatelessWidget{
  const Enter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(  color: Colors.lightGreen[50],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/fundo_home.png'),
              // const Text("Jogo da Velha", style: TextStyle(fontSize: 40, fontFamily: 'comic-sans'),),
        
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder:(context) => ChooseGame())
                  );
                },
                child: const Text('Play Game!', 
                  style: TextStyle(fontFamily: 'Coiny', color: Colors.black, fontSize: 20),
                ),
              ),
          ],
        ),
      ),
      )
    );
  }
}