import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChooseGame extends StatelessWidget{
  const ChooseGame ({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Container(
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

              }, child: Icon(Icons.adb_rounded), 
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 100), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Remove bordas arredondadas
                    ), backgroundColor: Colors.lightBlue),
              )
            ),

            SizedBox(width: 20),

            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                // border: Border.all(color: Colors.lightBlue, width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: ElevatedButton(onPressed: (){

              }, child: Icon(Icons.adb_rounded), 
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 100), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Remove bordas arredondadas
                    ), backgroundColor: Colors.lightBlue),
              )
            ),

            SizedBox(width: 20),

            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                // border: Border.all(color: Colors.lightBlue, width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: ElevatedButton(onPressed: (){

              }, child: Icon(Icons.adb_rounded), 
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 100), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Remove bordas arredondadas
                    ), backgroundColor: Colors.lightBlue),
              )
            )
          ],),
        ),
      ),
    );
  }
}