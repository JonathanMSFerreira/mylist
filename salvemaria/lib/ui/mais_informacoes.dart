import 'package:flutter/material.dart';

class MaisInformacoesPage extends StatelessWidget {
static const RosaApp = const Color(0xFFD95B96);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: Text("Instruçoes de uso"),
        backgroundColor: Color(0xFFD95B96),
      ),
      backgroundColor: Colors.white,
      body: Text(
        "Veja como funciona"
      ),
    );
  }
}