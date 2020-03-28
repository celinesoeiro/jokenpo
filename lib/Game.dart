import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  var _imageApp = AssetImage("images/padrao.png");
  String _message = "";

  void selectedOp(string){
    var ops = ['pedra','papel','tesoura'];
    var numero = Random().nextInt(ops.length);
    var appChoice = ops[numero];
    var userChoice = string;

    print('op do app: '+ appChoice);
    print('nossa op:' + userChoice);

    switch ( appChoice ) {
      case 'pedra': 
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
        break;
      case 'papel': 
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });
        break;
      case 'tesoura': 
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
      default:
        setState(() {
          this._imageApp = AssetImage("images/padrao.png");
        });
    }

    if (string == appChoice){
      setState(() {
        this._message = "Empate!";
      });
    } else if (userChoice == 'pedra' && appChoice == 'tesoura'){
      setState(() {
        this._message = "Você ganhou!";
      });
    } else if (userChoice == 'tesoura' && appChoice == 'papel'){
      setState(() {
        this._message = "Você ganhou!";
      });
    } else if (userChoice == 'papel' && appChoice == 'pedra'){
      setState(() {
        this._message = "Você ganhou!";
      });
    } else if (userChoice == 'tesoura' && appChoice == 'pedra'){
      setState(() {
        this._message = "Você perdeu";
      });
    } else if (userChoice == 'papel' && appChoice == 'tesoura'){
      setState(() {
        this._message = "Você perdeu";
      });
    } else if (userChoice == 'pedra' && appChoice == 'papel'){
      setState(() {
        this._message = "Você perdeu";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JoKenPo')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            child: Text(
              "Escolha uma opção",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ), 
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10, bottom: 30),
            child:          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){selectedOp('pedra');},
                    child: Image.asset('images/pedra.png', height: 110),
                  ),
                  GestureDetector(
                    onTap: (){selectedOp('papel');},
                    child: Image.asset('images/papel.png', height: 110),
                  ),
                  GestureDetector(
                    onTap: (){selectedOp('tesoura');},
                    child: Image.asset('images/tesoura.png', height: 110),
                  ),
                ],
              ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 30),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ), 
          ),
          GestureDetector(
            onTap: (){print('cliquei');},
            child: Image(image: this._imageApp, height: 100,),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              "Resultado",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ), 
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 10),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(34, 148, 214, 1)
              ),
            ), 
          ),
        ],
      )
    );
  }
}