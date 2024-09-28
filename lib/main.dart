import 'package:flutter/material.dart';
import 'package:jogovelha/enter.dart';

void main() {
  runApp(Jogo());
}

class Jogo extends StatelessWidget{
  const Jogo({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Jogo Da Velha',
      home :Enter(),
    );
  }
}