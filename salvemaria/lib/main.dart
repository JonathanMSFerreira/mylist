import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salvemaria/ui/botao_panico.dart';
import 'package:salvemaria/ui/splash_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salve Maria Maranhão',
      home: new SplashPage(),
      debugShowCheckedModeBanner: false
    );
  }
}