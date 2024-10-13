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
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("TIC", style: TextStyle(fontSize: 40, fontFamily: 'Chakra', color: Colors.blue),),
                  SizedBox(width: 20,),
                  const Text("TAC", style: TextStyle(fontSize: 40, fontFamily: 'Chakra', color: Colors.red),),
                  SizedBox(width: 20,),
                  const Text("TOE", style: TextStyle(fontSize: 40, fontFamily: 'Chakra', color: Colors.green),),
                ],
              ),
        
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder:(context) => ChooseGame())
                  );
                },
                child: const Text('Play Game!', 
                  style: TextStyle(fontFamily: 'Chakra', color: Colors.black, fontSize: 20),
                ),
              ),
          ],
        ),
      ),
      )
    );
  }
}