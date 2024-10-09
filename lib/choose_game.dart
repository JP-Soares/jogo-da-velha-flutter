import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jogovelha/gameScreen.dart';

class ChooseGame extends StatefulWidget{
  ChooseGame({Key? key}) :super(key : key);
  @override
  ChooseGameState createState() => ChooseGameState();
}

class ChooseGameState extends State<ChooseGame>{

  bool mostraMode = true;
  String gameMode = '';//robot or player(r;p)
  int difficult = 0;//caso robot, dificuldade 0, 1, 2

  @override
  void initState() {
    super.initState();
    gameMode = ''; // Redefinir para o padrão
    difficult = 0; // Redefinir para o padrão
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(mostraMode ? "Choose the Game!" : "Chosse the Difficult!", style: TextStyle(fontSize: 32, fontFamily: 'Chakra'),),

          SizedBox(height: 60,),
          mostraMode ?
          Container(//btn dois jogadores
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                // border: Border.all(color: Colors.lightBlue, width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: ElevatedButton(onPressed: (){

                gameMode = 'p';
                difficult = 0;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ScreenGame(gameMode, difficult))
                );

              }, child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset('assets/img/two.svg', width: 48, height: 48,)
              ],), 
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 100), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Remove bordas arredondadas
                    ), backgroundColor: Colors.lightBlue),
              )
            ),


            SizedBox(width: 20),

            Container(//btn robô
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                // border: Border.all(color: Colors.lightBlue, width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: ElevatedButton(onPressed: (){setState(() {
                mostraMode = false;
                gameMode = 'r';
                difficult = 0;
              });
                //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ScreenGame(gameMode, difficult)));
              }, 
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset('assets/img/robot.svg', width: 48, height: 48,),
              ],), 
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 100), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Remove bordas arredondadas
                    ), backgroundColor: Colors.lightBlue),
              )
            )
          ],),
        )
        :Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                // border: Border.all(color: Colors.lightBlue, width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: ElevatedButton(onPressed: (){

                gameMode = 'r';
                difficult = 0;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ScreenGame(gameMode, difficult))
                );

              }, child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset('assets/img/star.svg', width: 32, height: 32,)
              ],), 
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 100), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Remove bordas arredondadas
                    ), backgroundColor: Colors.lightBlue),
              )
            ),
            
            SizedBox(width: 20,),

            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                // border: Border.all(color: Colors.lightBlue, width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: ElevatedButton(onPressed: (){

                gameMode = 'r';
                difficult = 1;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ScreenGame(gameMode, difficult))
                );

              }, child: Center( child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Flexible(
                    child: SvgPicture.asset('assets/img/star.svg', width: 32, height: 32),
                  ),
                  SizedBox(width: 4), // Ajuste o espaçamento se necessário
                  Flexible(
                    child: SvgPicture.asset('assets/img/star.svg', width: 32, height: 32),
                  ),
                ],)), 
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 100), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Remove bordas arredondadas
                    ), backgroundColor: Colors.lightBlue),
              )
            ),

            SizedBox(width: 20,),

            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                // border: Border.all(color: Colors.lightBlue, width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: ElevatedButton(onPressed: (){

                gameMode = 'r';
                difficult = 2;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ScreenGame(gameMode, difficult))
                );

              }, child: Center( child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Flexible(child: 
                  SvgPicture.asset('assets/img/star.svg', width: 32, height: 32),
                ),

                Flexible(child: 
                  SvgPicture.asset('assets/img/star.svg', width: 32, height: 32,)
                ),

                Flexible(child: 
                  SvgPicture.asset('assets/img/star.svg', width: 32, height: 32,)
                ),
              ],)), 
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 100), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Remove bordas arredondadas
                    ), backgroundColor: Colors.lightBlue),
              )
            ),

            ],
          ),
        )
      ],),
      )
        
    );
  }
}