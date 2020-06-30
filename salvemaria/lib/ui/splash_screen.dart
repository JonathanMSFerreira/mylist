import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:salvemaria/pessoa/pessoa.dart';
import 'package:salvemaria/ui/botao_panico.dart';
import 'dart:async';
import 'package:salvemaria/ui/termo_uso.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

 static const RosaApp = const Color(0xFFD95B96);

 DateTime _anoAtual;
 Pessoa _pessoa;


  @override
  void initState() {
    _anoAtual = DateTime.now();
    super.initState();
    _pessoa = null;

    _carregaInformacoes();

  }





  _carregaInformacoes(){

    Future futureTimer = Future.delayed(Duration(seconds: 3));

    Future.wait([futureTimer, _temCadastro()]).then((_){


      if(_pessoa == null){

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TermoUso()));

      }else{

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BotaoPanico()));

      }

    });

  }

  Future<Null> _temCadastro() async{

    _pessoa = await Pessoa.get();
      setState(() {
      });

   }



  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(

            child: Stack(

              alignment: Alignment.center,

              children:[

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    // Box decoration takes a gradient
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.pink[600],
                        Colors.pink[500],
                        Colors.pink[400],
                        Colors.pink[300],
                      ],
                    ),
                  ),
                ),







                Center(
                  child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("images/iconSalveMaria.png"),
                        )),
                  ),
                  Center(
                      child: Text('SALVE MARIA',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontFamily: 'Reem Kufi',
                            color: Colors.white,
                          ))
                  ),
                  Center(
                      child: Text('Maranhão',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Reem Kufi',
                            color: Colors.white,
                          ))
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: LinearPercentIndicator(
                        alignment: MainAxisAlignment.center,
                        width: MediaQuery.of(context).size.width * 0.5,
                        animation: true,
                        animationDuration: 2000,
                        lineHeight: 8.0,
                        percent: 0.9,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.white,
                        progressColor: Colors.purple
                      ),
                    ),
                  ),



                 SizedBox(
                   height: 25.0,
                 ),

                 Column(


                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[

                     Text(
                       "Secretaria da Segurança Pública do Estado do Maranhão",
                       style: TextStyle(color: Colors.white, fontSize: 10),),
                     Text("Supervisão de Informática",
                       style: TextStyle(color: Colors.white, fontSize: 10),),
                     Text("2020 - ${_anoAtual.year}",
                       style: TextStyle(color: Colors.white, fontSize: 10),)

                   ],


                 )




              ]
              ),
                )],
            )
        )
        
        );
  }
}