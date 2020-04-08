import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String resultado = '';

  valorBitcoin() async{

    String url = 'https://blockchain.info/ticker';
    http.Response response = await http.get(url);
    Map<String,dynamic> retorno =  jsonDecode(response.body);
    String real = retorno['BRL']['buy'].toString();

    setState(() {
      resultado = 'R\$ '+real;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset(
              'assets/bitcoin.png',
              width: 320,
              ),

            Padding(
              padding: EdgeInsets.only(top:20,bottom:20),
              child: Text(
                resultado,
                style: TextStyle(
                  fontSize: 25,
                ),
                ),
            ),

            RaisedButton(
              color: Colors.orange,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              onPressed: (){
               valorBitcoin();   
              },
              child: Text(
                'Atualizar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                ),
              ),
              
          ],
        ),
      ),
      
    );

  }

}